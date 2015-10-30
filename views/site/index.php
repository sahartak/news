<?php

/* @var $this yii\web\View */
use app\models\News;
$this->title = 'Գլխավոր էջի վերնագիր';
?>

<div class="container-fluid grey_content">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 ">
				<h3 class="pull-right"><?=date('d.M.Y')?></h3>
			</div>
		</div>
		<div class="row align_center">
			<div class="col-md-8 img_container">
				<a href="#">
					<img src="/thumb.php?src=uploads/<?=$header_news['id']?>.png&w=750&h=437" class="full-width" class="full-width" />
					<div class="img_text">
						<h3><?=$header_news['title']?></h3>
						<p><?=News::cut_string($header_news['content'])?></p>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<div class="col-sm-12 img_container">
					<a href="/news/<?=$top_newses[0]['id']?>">
						<img src="/thumb.php?src=uploads/<?=$top_newses[0]['id']?>.png&w=350&h=200" class="full-width" />
						<div class="img_text">
							<p><?=News::cut_string($top_newses[0]['content'],1); unset($top_newses[0])?></p>
						</div>
					</a>
				</div>
			<?php foreach($top_newses as $top_news):?>
				<div class="col-xs-6 img_container">
					<a href="/news/<?=$top_news['id']?>">
						<img src="/thumb.php?src=uploads/<?=$top_news['id']?>.png&w=200&h=135" class="full-width"  />
						<div class="img_text">
							<p><?=News::cut_string($top_news['content'],2)?> ...</p>
						</div>
					</a>
				</div>
			<?php endforeach;?>
			</div>
		</div>
	</div>
</div>

<div class="container mid_content">
	<div class="row">

	<?php foreach($categories as $news):?>
		<div class="col-md-4">
			<a href="/news/<?=$news['news_id']?>">
				<img src="/thumb.php?src=uploads/<?=$news['news_id']?>.png&w=350&h=200" class="full-width" />
				<h4><?=$news['news']['title']?></h4>
				<p><?=News::cut_string($news['news']['content'])?>...</p>
				<p><span class="glyphicon glyphicon-pushpin"></span> <?=$news['category']['name']?></p>
			</a>
		</div>
	<?php endforeach;?>

	</div>
</div>