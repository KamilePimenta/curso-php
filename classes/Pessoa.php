<?php

class Pessoa
{
    private $nome;
    private $sobrenome;
    private $dataNascimento;

    /**
     * Pessoa constructor.
     *
     * @param $nome
     * @param $sobrenome
     * @param $dataNascimento
     */
    function __construct($nome = null, $sobrenome = null, $dataNascimento = null)
    {
        $this
            ->setNome($nome)
            ->setSobrenome($sobrenome)
            ->setDataNascimento($dataNascimento);
    }

    function __destruct()
    {
        echo '<hr> Já era!';
    }

    function __set($name, $value)
    {
        $name = 'set'.ucwords($name);
        $this->$name($value);
    }

    function __get($name)
    {
        $name = 'get'.ucwords($name);
        return $this->$name();
    }

    public function setNome($nome)
    {
        if ($nome != '') {
            $this->nome = $nome;
        } else {
            $this->nome = 'Desconhecido';
        }

        return $this;
    }

    public function getNome()
    {
        return $this->nome;
    }

    public function setSobrenome($sobrenome)
    {
        $this->sobrenome = $sobrenome;

        return $this;
    }

    public function getSobrenome()
    {
        return $this->sobrenome;
    }

    public function setDataNascimento($dataNascimento)
    {
        if( preg_match('/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/', $dataNascimento) ){
            $this->dataNascimento = $dataNascimento;
        }

        return $this;
    }

    public function getDataNascimento()
    {
        return $this->dataNascimento;
    }

    public function apresentar()
    {
        return "Olá, eu sou {$this->getNome()}! Nasci no dia {$this->getDataNascimento()}";
    }
}