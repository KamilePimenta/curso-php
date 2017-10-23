<?php

class ContaPoupanca extends Conta
{
    private  $juros;

    public function __construct($agencia, $numero, $saldo = 0.00, float $juros)
    {
        $this->juros = $juros;
        parent::__construct($agencia, $numero, $saldo);
    }

    /**
     * @return float
     */
    public function getJuros(): float
    {
        return $this->juros;
    }

    public function depositar(float $valor)
    {
        if( $valor > 0 ){
            $this->saldo = ( $valor + $this->juros );
        }
    }
}