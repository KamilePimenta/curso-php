<?php
/**
 * Tabela Modelos
 */

namespace LeoCars\Entities;


class Modelo
{
    /** @var  integer */
    private $id;
    /** @var  string */
    private $nome;
    /** @var  integer */
    private $eCarro;

    /**
     * @return int
     */
    public function getId(): int
    {
        return $this->id;
    }

    /**
     * @return string
     */
    public function getNome(): string
    {
        return $this->nome;
    }

    /**
     * @return bool
     */
    public function isCarro(): bool
    {
        return $this->eCarro == 1;
    }
}