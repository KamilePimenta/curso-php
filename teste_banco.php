<?php
require_once '_autoload_banco.php';

use Banco\Contas\ContaCorrente as CC;
use Banco\Contas\ContaPoupanca as CP;

$cc = new CC( 190, 899, 150.00 );

$cc->depositar(200);

echo $cc->getSaldo(true) . '<hr>';

$cp = new CP(190, 899, $cc->getSaldo());

$cc->sacar($cc->getSaldo());

$cp->depositar(100);

echo $cp->getSaldo(true);