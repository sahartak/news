<?php

use yii\db\Schema;
use yii\db\Migration;

class m151029_093750_add_is_published_column extends Migration
{
    public function up()
    {
        $this->addColumn('news', 'is_published', Schema::TYPE_SMALLINT.' DEFAULT 0');
    }

    public function down()
    {
        echo "m151029_093750_add_is_published_column cannot be reverted.\n";

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
