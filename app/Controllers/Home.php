<?php

namespace App\Controllers;

class Home extends BaseController
{
    public function index()
    {
        return view('welcome_message');
    }

    public function email(){

        $email = \Config\Services::email();

        $email->setFrom('your@example.com', 'Your Name');
        $email->setTo('makas76592@cyadp.com');

        $email->setSubject('Teste de e-mail');
        $email->setMessage('Teste de e-mail');

        if($email->send()){

            echo 'E-mail enviado';

        }else{

            echo $email->printDebugger();

        }
    }
}
