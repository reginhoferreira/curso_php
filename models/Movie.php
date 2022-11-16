<?php

class Movie {

    public $id;
    public $title;
    public $description;
    public $image;
    public $trailer;
    public $category;
    public $length;
    public $users_id;

    public function imageGenerateName() {
        return bin2hex(random_bytes(60)) . ".jpg";
    }
}

interface MovieDAOInterface {

    public function buildMovie($data);// receber dados
    public function findAll();//encontrar todos os filmes
    public function getLatestMovies();//encontrar filmes por edição decrescente
    public function getMoviesByCategory($category);//pegar por categoria
    public function getMoviesByUserId($id);//pegar filme por usuario especifico
    public function findById($id);//encontrar filme por id
    public function findByTitle($title);//encontrar filme por titulo/sera usado na busca por filme
    public function create(Movie $movie);
    public function update(Movie $movie);
    public function destroy($id);

}