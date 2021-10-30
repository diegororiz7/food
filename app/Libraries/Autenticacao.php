<?php

//Essa biblioteca cuidará da parte de autenticação na nossa aplicação

class Autenticacao {

    private $usuario;

    public function login(string $email, string $password){

        $usuarioModel = new App\Models\UsuarioModel();

        $usuario = $usuarioModel->buscaUsuarioPorEmail($email);

        /*Se não encontrar o usuário por e-mail, retorna false*/
        if($usuario == null){

            return false;

        }

        /*Se a senha não combinar com o password_hash, retorna false*/
        if(!$usuario->verificaPassword($password)){

            return false;

        }

        /*Só permitiremos o login de usuários ativos */
        if(!$usuario->ativo){

            return false;

        }

        /*Nesse ponto está tudo certo e podemos logar o usuário na aplicação invocando o método abaixo */
        $this->logaUsuario($usuario);

        //retornamos true... tudo certo
        return true;

    }

    public function logout(){

        session()->destroy();

    }

    public function pegaUsuarioLogado(){

        //Não esquecer de compartilhar a instância com services
        if($this->usuario == null){

            $this->usuario = $this->pegaUsuarioDaSessao();

        }

        //Retornamos o usuário que foi definido no início da classe
        return $this->usuario;

    }

    //O método só fica logado quem estiver na basee e estiver ativo. Do contrário será feito logout;
    //Return true sé não for null.
    public function estaLogado(){

        return $this->pegaUsuarioLogado() !== null;

    }

    private function pegaUsuarioDaSessao(){

        if(! session()->has('usuario_id')){

            return null;

        }

        //Instanciamos o Model Usuário
        $usuarioModel = new App\Models\UsuarioModel();

        //Recupero o usuário de acordo com a chave da sessão 'usuario_id'
        $usuario = $usuarioModel->find(session()->get('usuario_id'));

        //Só retorno o objeto usuário se o mesmo for encontrado e estiver ativo
        if($usuario && $usuario->ativo){

            return $usuario;

        }

    }

    private function logaUsuario(object $usuario){

        $session = session();
        $session->regenarete();
        $session->set('usuario_id', $usuario->id);

    }

}