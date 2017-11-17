<?php
/**
 * Exemplo de autoload
 */

spl_autoload_register(function ($class) {
    $path = __DIR__ . DIRECTORY_SEPARATOR . 'Banco' . DIRECTORY_SEPARATOR . $class . '.php';
    if( ! file_exists($path) ){
        die("A classe $class não existe.");
    }

    require_once $path;
});