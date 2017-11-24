<?php
/**
 * Exemplo de autoload
 */

// Requisita as Classes apenas quando necessário
spl_autoload_register(function ($class) {
    // Previne erro de caminho (Windows/Linux)
    $class = str_replace('\\', DIRECTORY_SEPARATOR, $class);
    // Pega o caminho da Classe
    $path = __DIR__ . DIRECTORY_SEPARATOR . $class . '.php';
    // Verifica se o arquivo existe
    if( ! file_exists($path) ){
        die("A classe $class não existe. ($path)");
    }

    // Requisita a Classe apenas uma vez
    require_once $path;
});