<?php

/* @var $this yii\web\View */
use app\models\News;
$this->title = $news['title'];

?>
<div class="news-page">
    <div class="col-md-8 news-content">
        <!--<h3 class="pull-right"><?/*=date('d.m.Y H:i', strtotime($news['published']))*/?></h3>-->
        <h1><?=$news['title']?></h1>
        <h2><img src="/uploads/<?=$news['id']?>.png" alt="<?=$news['title']?>" title="<?=$news['title']?>"></h2>
        <?=$news['content']?>
    </div>
    <div class="col-md-3 news-right-block">
        dssdg
    </div>
</div>