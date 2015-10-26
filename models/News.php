<?php

namespace app\models;

use Yii;

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
 *
 * @property CategoryRelations[] $categoryRelations
 */
class News extends \yii\db\ActiveRecord
{
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
			[['important', 'hits'], 'integer'],
			[['title', 'video', 'meta_key'], 'string', 'max' => 255]
		];
	}

	/**
	 * @inheritdoc
	 */
	public function attributeLabels()
	{
		return [
			'id' => 'ID',
			'title' => 'Title',
			'content' => 'Content',
			'video' => 'Video',
			'meta_key' => 'Meta Key',
			'created' => 'Created',
			'published' => 'Published',
			'important' => 'Important',
			'hits' => 'Hits',
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
