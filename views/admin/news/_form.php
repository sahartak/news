<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\News */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="news-form container">

	<?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

	<?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

	<?= $form->field($model, 'content')->textarea(['rows' => 6]) ?>

	<?= $form->field($model, 'video')->textInput(['maxlength' => true]) ?>

	<?= $form->field($model, 'meta_key')->textInput(['maxlength' => true]) ?>
	<?php if($model->id):?>
		<img src="/thumb.php?src=/uploads/<?=$model->id?>.png&h=100" >
	<?php endif;?>
	<?= $form->field($model, 'imageFile')->fileInput() ?>

	<?= $form->field($model, 'important')->checkbox() ?>

	<?= $form->field($model, 'categories')->checkboxList($categories)?>

	<?= $form->field($model, 'is_published')->checkbox(); ?>


	</div>


	<div class="form-group">
		<?= Html::submitButton($model->isNewRecord ? 'Ավելացնել' : 'Խմբագրել', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	</div>

	<?php ActiveForm::end(); ?>

</div>
<script>
	window.onload = function() {
		CKEDITOR.replace( 'News[content]' );
	}

</script>