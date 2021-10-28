<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class UsuarioSeeder extends Seeder{
    
    public function run(){
        
        $usuarioModel= new \App\Models\UsuarioModel;

        $usuario = [

            'nome'     => 'Lucio Antonio de Souza',
            'email'    => 'admin@admin.com',
            'cpf'      => '349.957.910-35',
            'telefone' => '41 - 99999-9999',

        ];

        $usuarioModel->protect(false)->insert($usuario);

        $usuario = [

            'nome'     => 'Fulano de Tal',
            'email'    => 'fulano@email.com',
            'cpf'      => '349.466.600-89',
            'telefone' => '41 - 98888-9999',

        ];

        $usuarioModel->protect(false)->insert($usuario);

        dd($usuarioModel->errors());
        
    }
}
