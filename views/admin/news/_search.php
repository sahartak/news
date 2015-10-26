<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\NewsSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="news-search">

	<?php $form = ActiveForm::begin([
		'action' => ['index'],
		'method' => 'get',
	]); ?>

	<?= $form->field($model, 'id') ?>

	<?= $form->field($model, 'title') ?>

	<?= $form->field($model, 'content') ?>

	<?= $form->field($model, 'video') ?>

	<?= $form->field($model, 'meta_key') ?>

	<?php // echo $form->field($model, 'created') ?>

	<?php // echo $form->field($model, 'published') ?>

	<?php // echo $form->field($model, 'important') ?>

	<?php // echo $form->field($model, 'hits') ?>

	<div class="form-group">
		<?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
		<?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
	</div>

	<?php ActiveForm::end(); ?>

</div>
