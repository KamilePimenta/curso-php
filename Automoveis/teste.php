<?php

use LeoCars\Entities\Model;

require_once '_autoload.php';

$conn = new \LeoCars\App\Connection();

// Insere os registros na tabela

try {
    $query = $conn->getConn()->prepare('SELECT * FROM Models WHERE isCar = :isCar ORDER BY name');
    $query->bindValue(':isCar',true, PDO::PARAM_BOOL);
    $query->execute();

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