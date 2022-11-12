<?php

require_once("globals.php");
require_once("db.php");
require_once("models/message.php");
require_once("dao/UserDAO.php");

$message = new Message($BASE_URL);

$flassMessage = $message->getMessage();

if(!empty($flassMessage["msg"])) {
    // LIMPAR A MENSAGEM
    $message->clearMessage();
}

$userDao = new UserDAO($conn, $BASE_URL);

$userData = $userDao->verifyToken(false);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SWE</title>
    <link rel="short icon" href="<?= $BASE_URL ?>img/moviestar.ico">
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.2/css/bootstrap.css" integrity="sha512-+QrNe4Kul4TNKwDK+EJM71C9z5I9I/iYLEIJPYTfmXouMSU8tkayWYnOsAKjDAaOOH21+MS747IPTYcD+2euuQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Fonte awesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- css do projeto-->
    <link rel="stylesheet" href="<?= $BASE_URL ?>css/styles.css">
</head>
<body>
    <header>
        <nav id="main-navbar" class="navbar navbar-expand-lg">
            <a href="<?= $BASE_URL ?>" class="navbar-brand">
            <img src="<?= $BASE_URL ?>img/logo.svg" alt="MovieStar" id="logo">
            <span id="moviestar-title">moviestar</span>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="navbar" aria-controls="navbar" aria-expanded="false" aria-label="toggle navigantion">
            <i class="fas fa-bars"></i>
        </button>
        <form action="" id="search-form" class="form-inline my-2 my-lg-0">
            <input type="text" name="q" id="search" class="form-control mr-sm-2" type="search"
            placeholder="Buscar Filmes" aria-label="Search">
            <button class="btn my-2 my-sm-0" type="submit">
                <i class="fas fa-search"></i>
            </button>
        </form>
        <div class="collapse navbar-collapse" id="navbar">
            <ul class="navbar-nav">
                <?php if($userData): ?>
                    <li class="nav-item">
                    <a href="<?= $BASE_URL ?>newmovie.php" class="nav-link">
                    <i class="far fa-plus-square"></i> Incluir Filme
                  </a>
                </li>
                <li class="nav-item">
                    <a href="<?= $BASE_URL ?>dashboard.php" class="nav-link">Meus Filmes</a>
                </li>
                <li class="nav-item">
                    <a href="<?= $BASE_URL ?>editprofile.php" class="nav-link bold">
                    <?= $userData->name ?>
                </a>
                </li>
                <li class="nav-item">
                    <a href="<?= $BASE_URL ?>logout.php" class="nav-link">Sair</a>
                </li>
                <?php else: ?>
                <li class="nav-item">
                    <a href="<?= $BASE_URL ?>auth.php" class="nav-link">Entrar / Cadastrar</a>
                </li>
               <?php endif; ?>
            </ul>
        </div>
      </nav>
    </header>
    <?php if(!empty($flassMessage["msg"])): ?>
        <div class="msg-container">
        <p class="msg <?= $flassMessage["type"] ?>"><?= $flassMessage["msg"] ?></p>
    </div>
    <?php endif; ?>
    