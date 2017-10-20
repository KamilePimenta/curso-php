<?php

require_once __DIR__ . DIRECTORY_SEPARATOR . 'Conta.php';

class ContaCorrente extends Conta
{
    private $creditoPessoal;

    public function __construct($agencia, $numero, $saldo = 0.00, float $credito = 500.00)
    {
        $this->creditoPessoal = $credito;
        parent::__construct($agencia, $numero, $saldo);
    }

    /**
     * @return float
     */
    public function getCreditoPessoal(): float
    {
        return $this->creditoPessoal;
    }

    public function sacar(float $valor)
    {
        if( $valor > 0 ){
            if( $valor <= ($this->saldo + $this->creditoPessoal)){
                $this->saldo -= $valor;
            } else {
                $this->saldo = - $this->creditoPessoal;
            }
        }

        return $this;
    }
}