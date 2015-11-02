<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
	<meta charset="<?= Yii::$app->charset ?>">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<?= Html::csrfMetaTags() ?>
	<title>News | <?= Html::encode($this->title) ?></title>
	<?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
	<?php
	NavBar::begin([
		'brandLabel' => '<img src="http://static.bbci.co.uk/frameworks/barlesque/2.91.2/orb/4/img/bbc-blocks-light.png"/>',
		'brandUrl' => Yii::$app->homeUrl,
		'options' => [
			'class' => 'navbar-inverse navbar-fixed-top',
		],
	]);
	echo Nav::widget([
		'options' => ['class' => 'navbar-nav navbar-right'],
		'items' => [
			['label' => 'Գլխավոր', 'url' => ['/admin']],
			['label' => 'Նորություններ', 'url' => ['/admin/news']],
			['label' => 'Կատեգորիաներ', 'url' => ['/admin/category']],
			Yii::$app->user->isGuest ?
				['label' => 'Login', 'url' => ['/site/login']] :
				[
					'label' => 'Logout (' . Yii::$app->user->identity->username . ')',
					'url' => ['/admin/logout'],
					'linkOptions' => ['data-method' => 'post']
				],
		],
	]);
	NavBar::end();
	?>
	<div class="container">
		<?= Breadcrumbs::widget([
			'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
		]) ?>
		<?= $content ?>
	</div>
</div>

<footer class="footer">
	<div class="container">
		<p class="pull-left">&copy; News <?= date('Y') ?></p>

		<p class="pull-right">Powered by <a href="http://web.armsolid.ru" rel="external">WebandHost</a></p>
	</div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
