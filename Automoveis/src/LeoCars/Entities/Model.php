<?php
/**
 * Tabela Modelos
 */

namespace LeoCars\Entities;


class Model
{
    /** @var  integer */
    private $id;
    /** @var  string */
    private $name;
    /** @var  integer 1 para carro e 0 para moto */
    private $isCar;

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
    public function getName(): string
    {
        return $this->name;
    }

    /**
     * @param string $name
     *
     * @return Model
     */
    public function setName(string $name): Model
    {
        $this->name = $name;

        return $this;
    }

    /**
     * @param bool $isCar
     *
     * @return Model
     */
    public function setIsCar(bool $isCar): Model
    {
        $this->isCar = $isCar ? 1 : 0;

        return $this;
    }

    /**
     * @return bool
     */
    public function isCar(): bool
    {
        return $this->isCar == 1;
    }
}