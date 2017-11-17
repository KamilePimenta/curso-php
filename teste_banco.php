<?php
require_once '_autoload_banco.php';

$cc = new ContaCorrente( 190, 899, 150.00 );

$cc->depositar(200);

echo $cc->getSaldo(true) . '<hr>';

$cp = new ContaPoupanca(190, 899, $cc->getSaldo());

$cc->sacar($cc->getSaldo());

$cp->depositar(100);

echo $cp->getSaldo(true);

$teste = new Franca();