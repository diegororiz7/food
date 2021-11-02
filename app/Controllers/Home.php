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

        $email->setSubject('Um novo teste');
        $email->setMessage('Ainda mais legal');

        if($email->send()){

            echo 'E-mail enviado';

        }else{

            echo $email->printDebugger();

        }
    }
}
