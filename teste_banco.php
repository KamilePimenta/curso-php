<?php
require_once __DIR__ . DIRECTORY_SEPARATOR . 'Banco' . DIRECTORY_SEPARATOR . 'ContaCorrente.php';
require_once __DIR__ . DIRECTORY_SEPARATOR . 'Banco' . DIRECTORY_SEPARATOR . 'ContaPoupanca.php';

$cc = new ContaCorrente( 190, 899, 150.00 );

$cc->depositar(200);

echo $cc->getSaldo(true) . '<hr>';

$cp = new ContaPoupanca(190, 899, $cc->getSaldo());

$cc->sacar($cc->getSaldo());

$cp->depositar(100);

echo $cp->getSaldo(true);