<?php
$nota1 = filter_input(INPUT_POST, 'nota_um', FILTER_VALIDATE_INT);
$nota2 = filter_input(INPUT_POST, 'nota_dois', FILTER_VALIDATE_INT);
$nota3 = filter_input(INPUT_POST, 'nota_tres', FILTER_VALIDATE_INT);
$nota4 = filter_input(INPUT_POST, 'nota_quatro', FILTER_VALIDATE_INT);

if (!$nota1 || !$nota2 || !$nota3 || !$nota4) {
    die('Você digitou algo errado!');
}

/** Portabilidade:
 *      __DIR__ usa-se para garantir que o caminho inicial será o do arquivo atual
 *      DIRECTORY_SEPARATOR para haver compatibilidade com outros SOs
 */

require_once __DIR__ .
    DIRECTORY_SEPARATOR . '..' .
    DIRECTORY_SEPARATOR . 'classes' .
    DIRECTORY_SEPARATOR . 'Media.php';

$media = new Media();
$media
    ->addValor($nota1)
    ->addValor($nota2)
    ->addValor($nota3)
    ->addValor($nota4);

echo $media->resultado();