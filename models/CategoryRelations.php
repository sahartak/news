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
			'category_id' => 'Կատեգորիա',
		];
	}

	/**
	 * @return \yii\db\ActiveQuery
	 */
	public function getNews()
	{
		return $this->hasOne(News::className(), ['id' => 'news_id']);
	}

	/**
	 * @return \yii\db\ActiveQuery
	 */
	public function getCategory()
	{
		return $this->hasOne(Category::className(), ['id' => 'category_id']);
	}

    public static function get_news_categories_names($news_id) {
        $sql = 'SELECT `categories`.`name` FROM `category_relations`
					INNER JOIN `categories` ON `categories`.`id` = `category_relations`.`category_id`
					WHERE `category_relations`.`news_id` = '.$news_id;
        $categories = self::findBySql($sql)->column();
        if($categories) {
            return $categories;
        }
        return array();
    }
}
