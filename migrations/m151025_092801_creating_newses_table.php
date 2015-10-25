<?php

use yii\db\Schema;
use yii\db\Migration;

class m151025_092801_creating_newses_table extends Migration
{
    public function up()
    {
        $this->createTable('news', [
            'id' => Schema::TYPE_PK,
            'title' => Schema::TYPE_STRING . ' NOT NULL',
            'content' => Schema::TYPE_TEXT,
            'video' => Schema::TYPE_STRING,
            'meta_key' => Schema::TYPE_STRING,
            'created' => Schema::TYPE_TIMESTAMP. ' DEFAULT CURRENT_TIMESTAMP',
            'published' => Schema::TYPE_TIMESTAMP.' DEFAULT 0',
            'important' => Schema::TYPE_SMALLINT.' DEFAULT 0',
            'hits' => Schema::TYPE_INTEGER.' DEFAULT 0'
        ]);
    }

    public function down()
    {
        $this->dropTable('news');
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
