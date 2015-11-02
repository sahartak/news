<?php

namespace app\controllers;

use app\models\Category;
use app\models\CategoryRelations;
use app\models\News;
use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;

class SiteController extends Controller
{
	public function behaviors()
	{
		return [
			'access' => [
				'class' => AccessControl::className(),
				'only' => ['logout'],
				'rules' => [
					[
						'actions' => ['logout'],
						'allow' => true,
						'roles' => ['@'],
					],
				],
			],
			'verbs' => [
				'class' => VerbFilter::className(),
				'actions' => [
					'logout' => ['post'],
				],
			],
		];
	}

	public function actions()
	{
		return [
			'error' => [
				'class' => 'yii\web\ErrorAction',
			],
			'captcha' => [
				'class' => 'yii\captcha\CaptchaAction',
				'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
			],
		];
	}

    public function actionIndex()
	{
		$this->layout = 'index_layout';
		$header_news = News::find()->where(['important' => 1])->orderBy('id DESC')->asArray()->one();
		$header_id = $header_news ? $header_news['id'] : 0;

		$categories_ids = CategoryRelations::find()->select('category_id')->distinct()->orderBy('category_id')->column();
		$newses_ids = array();
		$categories = array();
		$newses_ids[] = $header_id;
		foreach($categories_ids as $cat_id) {
			$query = CategoryRelations::find()->joinWith(['news','category'])->where(['news.is_published' => 1, 'category_id' => $cat_id])->andWhere(['NOT IN', 'news.id', $newses_ids])->orderBy('news.published DESC')->asArray()->one();
			if($query) {
				$categories[] = $query;
				$newses_ids[] = $query['news']['id'];
			}
		}
		$top_newses = News::find()->where(['is_published' => 1])->andWhere(['NOT IN', 'id', $newses_ids])->orderBy('published DESC')->limit(5)->asArray()->all();
		return $this->render('index', compact('categories', 'header_news', 'top_newses'));
	}

	public function actionNews($news_id) {
		$news = News::find()->where(['id'=>$news_id, 'is_published' => 1])->asArray()->one();
		if($news) {
			$news['categories'] = CategoryRelations::get_news_categories_names($news['id']);
			return $this->render('news', compact('news'));
		}
	}


	public function actionContact()
	{
		$model = new ContactForm();
		if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
			Yii::$app->session->setFlash('contactFormSubmitted');

			return $this->refresh();
		}
		return $this->render('contact', [
			'model' => $model,
		]);
	}

	public function actionAbout()
	{
		return $this->render('about');
	}
}
