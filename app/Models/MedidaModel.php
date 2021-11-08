<?php

namespace App\Models;

use CodeIgniter\Model;

class MedidaModel extends Model
{
    protected $DBGroup              = 'default';
    protected $returnType           = 'App\Entities\Medida';
    protected $table                = 'medidas';
    protected $useSoftDeletes       = true;
    protected $allowedFields        = ['nome', 'descricao', 'ativo'];

    // Dates
    protected $useTimestamps        = true;
    protected $dateFormat           = 'datetime';
    protected $createdField         = 'criado_em';
    protected $updatedField         = 'atualizado_em';
    protected $deletedField         = 'deletado_em';

    //Validações
    protected $validationRules    = [
        'nome'             => 'required|min_length[2]|max_length[120]|is_unique[medidas.nome]',
    ];
    protected $validationMessages = [
        'nome'        => [
            'required'  => 'Desculpe, o campo nome é obrigatório!',
            'is_unique' => 'Essa medida já existe!',
        ],
    ];

    public function procurar($term){

        if($term === null){
            return[];
        }

        return $this->select('id, nome')
                    ->like('nome', $term)
                    ->withDeleted(true)
                    ->get()
                    ->getResult();    

    }

    public function desfazerExclusao(int $id){

        return $this->protect(false)
                    ->where('id', $id)
                    ->set('deletado_em', null)
                    ->update();

    }

}
