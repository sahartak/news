<?php

namespace app\models;

use Yii;
use yii\web\UploadedFile;

/**
 * This is the model class for table "news".
 *
 * @property integer $id
 * @property string $title
 * @property string $content
 * @property string $video
 * @property string $meta_key
 * @property string $created
 * @property string $published
 * @property integer $important
 * @property integer $hits
 * @property integer $is_published
 * @property CategoryRelations[] $categoryRelations
 */
class News extends \yii\db\ActiveRecord
{

	public $categories = [];

	public $imageFile;
	/**
	 * @inheritdoc
	 */
	public static function tableName()
	{
		return 'news';
	}

	/**
	 * @inheritdoc
	 */
	public function rules()
	{
		return [
			[['title'], 'required'],
			[['content'], 'string'],
			[['created', 'published'], 'safe'],
			[['important', 'hits', 'is_published'], 'integer'],
			[['title', 'video', 'meta_key'], 'string', 'max' => 255],
			[['imageFile'], 'file', 'skipOnEmpty' => true, 'extensions' => 'png, jpg']
		];
	}

	public function upload()
	{
		$this->imageFile = UploadedFile::getInstance($this, 'imageFile');
		if ($this->validate()) {
			$this->imageFile->saveAs('uploads/' . $this->id . '.' . 'png');
			return true;
		} else {
			return false;
		}
	}

	/**
	 * @inheritdoc
	 */
	public function attributeLabels()
	{
		return [
			'id' => 'ID',
			'title' => 'Վերնագիր',
			'content' => 'Տեքստ',
			'video' => 'Վիդեո',
			'meta_key' => 'բանալի բառեր',
			'created' => 'Ստեղծման ամսաթիվ',
			'published' => 'Հրապարակման ամսաթիվ',
			'important' => 'Գլխավոր',
			'hits' => 'Դիտվել է',
			'is_published' => 'Հրապարակված է',
			'imageFile' => 'Նկար'
		];
	}

	/**
	 * @return \yii\db\ActiveQuery
	 */
	public function getCategoryRelations()
	{
		return $this->hasMany(CategoryRelations::className(), ['news_id' => 'id']);
	}
}
