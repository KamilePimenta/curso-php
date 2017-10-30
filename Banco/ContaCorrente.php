<?php

require_once __DIR__ . DIRECTORY_SEPARATOR . 'Conta.php';

final class ContaCorrente extends Conta
{
    private $creditoPessoal;

    /**
     * ContaCorrente constructor.
     *
     * @param int   $agencia
     * @param int   $numero
     * @param float $saldo
     * @param float $credito
     */
    public function __construct($agencia, $numero, $saldo = 0.00, float $credito = 500.00)
    {
        $this->creditoPessoal = $credito;

        // Executa o método construtor da Class Pai
        parent::__construct($agencia, $numero, $saldo);
    }

    /**
     * @return float
     */
    public function getCreditoPessoal(): float
    {
        return $this->creditoPessoal;
    }

    /**
     * Utiliza o creditoPessoal no saque
     *
     * @param float $valor
     *
     * @return $this
     */
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