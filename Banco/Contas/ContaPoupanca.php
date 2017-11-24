<?php

// Determina o caminho da Classe
namespace Banco\Contas;

use Banco\Conta;

final class ContaPoupanca extends Conta
{
    private  $juros;

    public function __construct($agencia, $numero, $saldo = 0.00, float $juros = 0.1)
    {
        $this->juros = $juros;
        parent::__construct($agencia, $numero, $saldo);
    }

    /**
     * @return float
     */
    public function getJuros()
    {
        return $this->juros;
    }

    public function depositar(float $valor)
    {
        if( $valor > 0 ){
            $this->saldo += $valor + ( $valor * $this->juros );
        }

        return $this;
    }
}