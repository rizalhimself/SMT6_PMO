<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class DbRestapi19SA1116Mig extends Migration
{
    public function up()
    {
        //
        $this->forge->addField([
            'id'=>[
                'type'=>'INT',
                'constraint'=>11,
                'unsigned'=>true,
                'auto_increment'=>true,
            ],
            'username'=>[
                'type'=> 'varchar',
                'constraint'=>100,
            ],
            'firstname'=>[
                'type'=>'text',
            ],
            'lastname'=>[
                'type'=>'text',
            ],
            'address'=>[
                'type'=>'text',
            ],
            'age'=> [
                'type'=>'int',
                'constraint',
            ],
            'password'=>[
                'type'=>'text',
            ],
            'salt'=>[
                'type'=>'text',
            ],
            'avatar'=>[
                'type'=>'text',
                'null'=>true,
            ],
            'role'=>[
                'type'=>'int',
                'constraint'=>1,
                'default'=>1,
            ],
            'created_by'=>[
                'type'=>'int',
                'constraint'=>11,
            ],
            'create_date'=>[
                'type'=>'datetime',
            ],
            'updated_date'=>[
                'type'=>'datetime',
                'null'=>true,
            ],
            'updated_by'=>[
                'type'=>'int',
                'constraint'=>11,
                'null'=>true,
            ]
        ]);
        $this->forge->addKey('id', true);
        $this->forge->createTable('users');
    }

    public function down()
    {
        //
        $this->forge->dropTable('users');
    }
}
