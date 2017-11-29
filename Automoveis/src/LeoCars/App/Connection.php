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
        $config = Utilities::getConfig(Utilities::TYPE_DATABASE);

        $dbname = $config['dbname'] ?? 'test';
        $host = $config['host'] ?? 'localhost';
        $user = $config['user'] ?? 'root';
        $pass = $config['pass'] ?? '';

        $this->conn = new \PDO("mysql:dbname=$dbname;host=$host", $user, $pass);
    }

    /**
     * @return \PDO
     */
    public function getConn(): \PDO
    {
        return $this->conn;
    }
}