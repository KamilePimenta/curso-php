<?php
require_once 'classes/Pessoa.php';
require_once 'classes/Media.php';

$jessica = new Pessoa('Jessica', 'Silva', '1987-08-07');
$jessica->dataNascimento = '1999--07';

echo $jessica->apresentar();


echo '<hr>';

$notaFinal = new Media;

$notaFinal
	->addValor(4)
	->addValor(8);
	
$teste = $notaFinal->resultado();

$jessica = null;

echo $teste;