<?php

namespace app\controllers;

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
	public $layout = 'index_layout';

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
		$header_news = News::find()->where(['important' => 1])->orderBy('id DESC')->asArray()->one();
		$header_id = $header_news ? $header_news['id'] : 0;

		$categories_ids = CategoryRelations::find()->select('category_id')->distinct()->column();
		$newses_ids = array();
		$categories = array();
		$newses_ids[] = $header_id;
		foreach($categories_ids as $cat_id) {
			$query = CategoryRelations::find()->joinWith(['news','category'])->where(['news.is_published' => 1, 'category_id' => $cat_id])->andWhere(['NOT IN', 'news.id', $newses_ids])->asArray()->one();
			if($query) {
				$categories[] = $query;
				$newses_ids[] = $query['news']['id'];
			}
		}
		return $this->render('index', compact('categories', 'header_news'));
	}

	public function actionLogin()
	{
		if (!\Yii::$app->user->isGuest) {
			return $this->goHome();
		}

		$model = new LoginForm();
		if ($model->load(Yii::$app->request->post()) && $model->login()) {
			return $this->goBack();
		}
		return $this->render('login', [
			'model' => $model,
		]);
	}

	public function actionLogout()
	{
		Yii::$app->user->logout();

		return $this->goHome();
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
