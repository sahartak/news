<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "category_relations".
 *
 * @property integer $id
 * @property integer $news_id
 * @property integer $category_id
 *
 * @property News $news
 */
class CategoryRelations extends \yii\db\ActiveRecord
{
	/**
	 * @inheritdoc
	 */
	public static function tableName()
	{
		return 'category_relations';
	}

	/**
	 * @inheritdoc
	 */
	public function rules()
	{
		return [
			[['news_id', 'category_id'], 'integer']
		];
	}

	/**
	 * @inheritdoc
	 */
	public function attributeLabels()
	{
		return [
			'id' => 'ID',
			'news_id' => 'News ID',
			'category_id' => 'Category ID',
		];
	}

	/**
	 * @return \yii\db\ActiveQuery
	 */
	public function getNews()
	{
		return $this->hasOne(News::className(), ['id' => 'news_id']);
	}
}
