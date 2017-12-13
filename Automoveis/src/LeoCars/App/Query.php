<?php
/**
 * Created by PhpStorm.
 * User: User
 * Date: 01/12/2017
 * Time: 16:50
 */

namespace LeoCars\App;

class Query
{
    /** @var Connection */
    private $conn;

    /**
     * Query constructor.
     */
    public function __construct()
    {
        $this->conn = new Connection();
    }

    /**
     * Executor de Query
     *
     * @param string $query
     * @param array  $campos
     * @param bool   $oneRow
     *
     * @return \PDOStatement
     */
    public function exec($query, $campos = [], $oneRow = true)
    {
        // Prepara a Query
        $sql = $this->conn->getConn()->prepare($query);

        // Seta os valores se houver
        if (!empty($campos)) {
            // Divide os valores do array
            foreach ($campos as $chave => $valor) {
                // Atribui os valores aos seus campos
                switch ($valor) {
                    case is_null($valor):
                        $sql->bindValue($chave, null, \PDO::PARAM_NULL);
                        break;
                    case is_bool($valor):
                        $sql->bindValue($chave, $valor, \PDO::PARAM_BOOL);
                        break;
                    case is_int($valor):
                        $sql->bindValue($chave, $valor, \PDO::PARAM_INT);
                        break;
                    default:
                        $sql->bindValue($chave, $valor);
                }
            }
        }

        // Faz a execução da Query
        $sql->execute();

        return $sql;
    }
}