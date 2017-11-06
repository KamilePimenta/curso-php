<?php
$db = require_once('config/database.php');
if (file_exists('config/database.local.php')) {
    $dbLocal = require_once('config/database.local.php');

    // Mescla os arrays de configuração,
    // substituindo os dados oficiais pelos locais
    $db = array_merge($db, $dbLocal);
}

// Configura a conexão com o BD
$pdo = new PDO(
    "mysql:host={$db['host']};dbname={$db['dbname']}",
    $db['user'],
    $db['pass']
);

// Insere os rehistros na tabela
$query = $pdo->query("INSERT INTO carros (placa, cor) VALUES ('BUC-6723','Verde'),('GRD-1255', 'Amarelo'), ('FBI-8900', 'Preto')");

echo $query->rowCount();