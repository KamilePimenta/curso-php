<?php
/**
 * Tabela de Veículos
 */

namespace LeoCars\Entities;


use LeoCars\Repositories\ModelRepository;

class Vehicle
{
    /** @var  int */
    private $id;
    /** @var  int */
    private $model;
    /** @var  string */
    private $plate;
    /** @var  string */
    private $chassis;
    /** @var  string */
    private $renavam;
    /** @var  string */
    private $color;
    /** @var  string */
    private $fuel;

    /**
     * @return int
     */
    public function getId(): int
    {
        return $this->id;
    }

    /**
     * @return Model
     */
    public function getModel(): Model
    {
        $model = new ModelRepository();

        return $model->getModel($this->model);
    }

    /**
     * @param Model $model
     *
     * @return Vehicle
     */
    public function setModel(Model $model): Vehicle
    {
        $this->model = $model->getId();

        return $this;
    }

    /**
     * @return string
     */
    public function getPlate(): string
    {
        return $this->plate;
    }

    /**
     * @param string $plate
     *
     * @return Vehicle
     */
    public function setPlate(string $plate): Vehicle
    {
        $this->plate = $plate;

        return $this;
    }

    /**
     * @return string
     */
    public function getChassis(): string
    {
        return $this->chassis;
    }

    /**
     * @param string $chassis
     *
     * @return Vehicle
     */
    public function setChassis(string $chassis): Vehicle
    {
        $this->chassis = $chassis;

        return $this;
    }

    /**
     * @return string
     */
    public function getRenavam(): string
    {
        return $this->renavam;
    }

    /**
     * @param string $renavam
     *
     * @return Vehicle
     */
    public function setRenavam(string $renavam): Vehicle
    {
        $this->renavam = $renavam;

        return $this;
    }

    /**
     * @return string
     */
    public function getColor(): string
    {
        return $this->color;
    }

    /**
     * @param string $color
     *
     * @return Vehicle
     */
    public function setColor(string $color): Vehicle
    {
        $this->color = $color;

        return $this;
    }

    /**
     * @return string
     */
    public function getFuel(): string
    {
        return $this->fuel;
    }

    /**
     * @param string $fuel
     *
     * @return Vehicle
     */
    public function setFuel(string $fuel): Vehicle
    {
        $this->fuel = $fuel;

        return $this;
    }
}