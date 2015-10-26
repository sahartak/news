<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\News;

/**
 * NewsSearch represents the model behind the search form about `app\models\News`.
 */
class NewsSearch extends News
{
	/**
	 * @inheritdoc
	 */
	public function rules()
	{
		return [
			[['id', 'important', 'hits'], 'integer'],
			[['title', 'content', 'video', 'meta_key', 'created', 'published'], 'safe'],
		];
	}

	/**
	 * @inheritdoc
	 */
	public function scenarios()
	{
		// bypass scenarios() implementation in the parent class
		return Model::scenarios();
	}

	/**
	 * Creates data provider instance with search query applied
	 *
	 * @param array $params
	 *
	 * @return ActiveDataProvider
	 */
	public function search($params)
	{
		$query = News::find();

		$dataProvider = new ActiveDataProvider([
			'query' => $query,
		]);

		$this->load($params);

		if (!$this->validate()) {
			// uncomment the following line if you do not want to return any records when validation fails
			// $query->where('0=1');
			return $dataProvider;
		}

		$query->andFilterWhere([
			'id' => $this->id,
			'created' => $this->created,
			'published' => $this->published,
			'important' => $this->important,
			'hits' => $this->hits,
		]);

		$query->andFilterWhere(['like', 'title', $this->title])
			->andFilterWhere(['like', 'content', $this->content])
			->andFilterWhere(['like', 'video', $this->video])
			->andFilterWhere(['like', 'meta_key', $this->meta_key]);

		return $dataProvider;
	}
}
