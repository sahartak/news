<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\News */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="news-form">

	<?php $form = ActiveForm::begin(); ?>

	<?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

	<?= $form->field($model, 'content')->textarea(['rows' => 6]) ?>

	<?= $form->field($model, 'video')->textInput(['maxlength' => true]) ?>

	<?= $form->field($model, 'meta_key')->textInput(['maxlength' => true]) ?>

	<?= $form->field($model, 'created')->textInput() ?>

	<?= $form->field($model, 'published')->textInput() ?>

	<?= $form->field($model, 'important')->textInput() ?>

	<?= $form->field($model, 'hits')->textInput() ?>

	<div class="form-group">
		<?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	</div>

	<?php ActiveForm::end(); ?>

</div>
