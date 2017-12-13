<?php

use LeoCars\Entities\Model;

require_once '_autoload.php';

$conn = new \LeoCars\App\Query();

// Insere os registros na tabela

try {
    $query = $conn->exec('SELECT * FROM Models WHERE isCar = :isCar ORDER BY name', ['isCar'=>true]);

    //die( $query->fetchObject(Model::class)->getName() );

    $models = $query->fetchAll(\PDO::FETCH_CLASS, Model::class);

    /** @var Model $model */
    foreach ($models as $model) {
        echo  $model->getId() . ' - ' . $model->getName();
        echo '<br>';
    }
} catch (\PDOException $e) {
    die('Teste:' . $e->getMessage());
}