<?php
/**
 * Interface para todos os repositórios
 * ( Interface é um modelo para uma classe )
 */

namespace LeoCars\Repositories;


interface InterfaceRepository
{
    /**
     * Insere um registro na tabela
     *
     * @param $entity
     *
     * @return mixed
     */
    public function create($entity);

    /**
     * Atualiza um registro da tabela
     *
     * @param $entity
     *
     * @return mixed
     */
    public function update($entity);

    /**
     * Deleta um registro
     *
     * @param $entity
     *
     * @return bool
     */
    public function delete($entity);
}