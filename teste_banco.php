<?php
require_once __DIR__ . DIRECTORY_SEPARATOR . 'Banco' . DIRECTORY_SEPARATOR . 'ContaCorrente.php';

$teste = new ContaCorrente( 190, 899, 150.00 );

$teste->depositar(200);
$teste->sacar(5000);

echo $teste->getSaldo(true);