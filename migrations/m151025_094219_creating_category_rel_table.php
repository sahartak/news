<?php

use yii\db\Schema;
use yii\db\Migration;

class m151025_094219_creating_category_rel_table extends Migration
{
    public function up()
    {

        $this->createTable(
            'category_relations', [
                'id' => 'pk',
                'news_id' => 'int',
                'category_id' => 'int',
            ],
            'ENGINE=InnoDB'
        );
        $this->addForeignKey('news_categories', 'category_relations',
            'news_id', 'news', 'id');
    }

    public function down()
    {
        echo "m151025_094219_creating_category_rel_table cannot be reverted.\n";

        return false;
    }

    /*
    // Use safeUp/safeDown to run migration code within a transaction
    public function safeUp()
    {
    }

    public function safeDown()
    {
    }
    */
}
