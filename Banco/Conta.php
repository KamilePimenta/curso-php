<?php

abstract class Conta
{
    private $numero;
    private $agencia;
    protected $saldo;

    /**
     * Conta constructor.
     *
     * @param int   $numero
     * @param int   $agencia
     * @param float $saldo
     */
    public function __construct(int $agencia, int $numero, float $saldo = 0.00)
    {
        if ($numero <= 0 || $agencia <= 0) {
            die('Informe um número maior que 0');
        }

        $this->numero = $numero;
        $this->agencia = $agencia;
        $this->saldo = $saldo;
    }

    /**
     * @return float|string
     */
    public function getSaldo( $isFormatado = false )
    {
        if( $isFormatado ) {
            return 'R$ '.number_format( $this->saldo, 2, ',', '.' );
        }

        return $this->saldo;
    }

    /**
     * @return int
     */
    public function getNumero(): int
    {
        return $this->numero;
    }

    /**
     * @return int
     */
    public function getAgencia(): int
    {
        return $this->agencia;
    }

    /**
     * Faz um depósito
     *
     * @param float $valor
     *
     * @return $this
     */
    public function depositar(float $valor)
    {
        // Não deposita valores negativos
        if ($valor > 0) {
            $this->saldo += $valor;
        }

        return $this;
    }

    /**
     * Faz um saque
     *
     * @param float $valor
     *
     * @return $this
     */
    public function sacar(float $valor)
    {
        // Retira apenas valores positivos
        if( $valor > 0 ){
            // Impede que seja sacado um valor acima do saldo
            if( $valor <= $this->saldo ){
                $this->saldo -= $valor;
            } else {
                $this->saldo = 0.00;
            }
        }

        return $this;
    }
}