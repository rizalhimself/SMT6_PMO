<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class Users extends Seeder
{
    public function run()
    {
        //melakukan perulangan data
        for($i=0;$i<10;$i++){
            $data=[
                [
                    'username'=>'rizal',
                    'password'=>'1234',
                    'firstname'=>'Rizal',
                    'lastname'=>'Alfikri',
                    'address'=>'Purbalingga',
                    'age'=>'19'],
                [
                    'username'=>'arsya',
                    'password'=>'1234',
                    'firstname'=>'Muhammad',
                    'lastname'=>'Arsya Alfikri',
                    'address'=>'Purbalingga',
                    'age'=>'1',
                ]
            ];
            //insert semua data ke tabel
            $this->db->table('users')->insertBatch($data);
        }
    }
}
