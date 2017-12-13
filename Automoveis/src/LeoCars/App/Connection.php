<?php
/**
 * Conecta com o BD
 */

namespace LeoCars\App;


class Connection
{
    private $conn;

    public function __construct()
    {
        $config = new Config(Config::TYPE_DATABASE);

        $dbname = $config->get('dbname');
        $host = $config->get('host');
        $user = $config->get('user');
        $pass = $config->get('pass');

        try {
            $this->conn = new \PDO("mysql:host=$host;dbname=$dbname", $user, $pass, [
                \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
            ]);
        } catch (\PDOException $e) {
            die('Erro de conexão: ' . $e->getMessage());
        }
    }

    /**
     * @return \PDO
     */
    public function getConn(): \PDO
    {
        return $this->conn;
    }
}