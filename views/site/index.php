<?php

/* @var $this yii\web\View */
use app\models\News;
$this->title = 'Գլխավոր էջի վերնագիր';
?>

<div class="container-fluid grey_content">
	<div class="container">
		<pre>
			<?php print_r($newses)?>
		</pre>
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
					<a href="#">
						<img src="http://newsroyal.com/timthumb.php?src=http://newsroyal.com/upload/20585.png&w=350&h=200" class="full-width" />
						<div class="img_text">
							<p>Ռեջեփ Էրդողանն ահաբեկում է Թուրքիային նոր ահաբեկչություններով</p>
						</div>
					</a>
				</div>
				<div class="col-xs-6 img_container">
					<a href="#">
						<img src="http://newsroyal.com/timthumb.php?src=http://newsroyal.com/upload/20574.png&w=200&h=135" class="full-width"  />
						<div class="img_text">
							<p>Ռեջեփ Էրդողանն ահաբեկում է ...</p>
						</div>
					</a>
				</div>
				<div class="col-xs-6 img_container">
					<a href="#">
						<img src="http://newsroyal.com/timthumb.php?src=http://newsroyal.com/upload/20574.png&w=200&h=135" class="full-width" />
						<div class="img_text">
							<p>Ռեջեփ Էրդողանն ահաբեկում է ...</p>
						</div>
					</a>
				</div>
				<div class="col-xs-6 img_container">
					<a href="#">
						<img src="http://newsroyal.com/timthumb.php?src=http://newsroyal.com/upload/20574.png&w=200&h=135" class="full-width" />
						<div class="img_text">
							<p>Ռեջեփ Էրդողանն ահաբեկում է ...</p>
						</div>
					</a>
				</div>
				<div class="col-xs-6 img_container">
					<a href="#">
						<img src="http://newsroyal.com/timthumb.php?src=http://newsroyal.com/upload/20574.png&w=200&h=135" class="full-width" />
						<div class="img_text">
							<p>Ռեջեփ Էրդողանն ահաբեկում է ...</p>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="container mid_content">
	<div class="row">

	<?php foreach($newses as $news):?>
		<div class="col-md-4">
			<a href="#">
				<img src="/thumb.php?src=uploads/<?=$news['news_id']?>.png&w=350&h=200" class="full-width" />
				<h4>Ռեջեփ Էրդողանն ահաբեկում է Թուրքիային նոր ահաբեկչություններով</h4>
				<p>Թուրքական իշխանություններին մոտ կանգնած Sabah թերթի տեղեկություններով երկրի տարբեր շրջաններում սպասվում են ահաբեկչական գործողություններ...</p>
				<p><span class="glyphicon glyphicon-pushpin"></span> Քաղաքական</p>
			</a>
		</div>
	<?php endforeach;?>

	</div>
</div>