<?php

require_once("globals.php");
require_once("db.php");
require_once("models/User.php");
require_once("models/message.php");
require_once("dao/UserDAO.php");

$message = new Message($BASE_URL);

$userDao = new UserDAO($conn, $BASE_URL);

// RESGATA O TIPO DO FORMULARIO

$type = filter_input(INPUT_POST, "type");

// VERIFICAÇÃO DO TIPO DE FORMULARIO

if($type === "register") {
    
    $name = filter_input(INPUT_POST, "name");
    $lastname = filter_input(INPUT_POST, "lastname");
    $email = filter_input(INPUT_POST, "email");
    $password = filter_input(INPUT_POST, "password");
    $confirmpassword = filter_input(INPUT_POST, "confirmpassword");
    

    // VERIFICAÇÃO DE DADOS MINIMOS
    if($name && $lastname && $email && $password) {

        // VERIFICAR SE AS SENHAS BATEM
        if($password === $confirmpassword) {

            // VERFICAR SE O EMAIL JA ESTA CADASTRADO NO SITEMA
            if($userDao->findByEmail($email) === false) {

            $user = new User();

            // CRIAÇÃO DE TOKEN E SENHA

            $userToken = $user->generateToken();
            $finalPassword = $user->generatePassword($password);

            $user->name = $name;
            $user->lastname= $lastname;
            $user->email = $email;
            $user->password= $finalPassword;
            $user->token = $userToken;

            $auth = true;

            $userDao->create($user, $auth);

            } else {
                // ENVIA UMA MENSAGEM SE USUARIO JA EXISTE
                $message->setMessage("Usuario ja cadastrado. Tente outro email!", "error", "back");
            }

        }else {

            // EMVIAR MENSAGEM SE AS SENHAS NÃO BATEM
            $message->setMessage("Confirmação de senha incorreta.", "error", "back");
        }
        
    }else {
        // ENVIAR UMA MENSAGEM DE ERRO, DE DADOS FALTANTES
        $message->setMessage("Por favor, preencha todos os campos.", "error", "back");
    }
}else if($type === "login") {

    $email = filter_input(INPUT_POST, "email");
    $password = filter_input(INPUT_POST, "password");

    // TENTA AUTENTICAE USUARIO

    if($userDao->authenticateUser($email, $password)) {

        $message->setMessage("Seja bem vindo!", "success", "editprofile.php");

        // REDIRECIONA O USUARIO, CASO NAO CONSEGUIR AUTENTICAR
    }else {
        $message->setMessage("Usuario e/ou senha incorretos", "error", "back");
    }
}else {
    $message->setMessage("informações invalidas", "error", "index.php");
}
