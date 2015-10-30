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
		$newses = CategoryRelations::find()
					->select('news_id')
					->distinct()
					->addSelect('category_id')
					->where(['!=', 'news_id', $header_id])
					->groupBy('category_id')
					->with('news')
					->orderBy('category_id')
					->addOrderBy('news_id DESC')
					->joinWith('news')
					->joinWith('category')
					->asArray()
					->all();
		return $this->render('index', compact('newses', 'header_news'));
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
