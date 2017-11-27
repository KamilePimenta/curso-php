<?php
// Registra as Classes que são chamadas
spl_autoload_register(function ($class){

    // Portabilidade:  Substitui as barras invertidas do Namespace pelos separadores de diretorio do SO
    $class = str_replace('\\', DIRECTORY_SEPARATOR, $class);

    // Pega o caminho do arquivo
    $path = __DIR__ . DIRECTORY_SEPARATOR . 'src' . DIRECTORY_SEPARATOR . $class . '.php';

    // Se o arquivo não existir, finaliza o processo
    if( ! file_exists($path) ){
        die("A Classe $class não existe.");
    }

    // Requisita a Classe
    require_once $path;
});