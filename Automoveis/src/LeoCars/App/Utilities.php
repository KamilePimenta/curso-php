<?php
/**
 * Ferramentas do sistema
 */

namespace LeoCars\App;


class Utilities
{
    /** Caminho da pasta de configurações */
    const PATH_CONFIG =
        __DIR__ . DIRECTORY_SEPARATOR .
        '..' . DIRECTORY_SEPARATOR .
        '..' . DIRECTORY_SEPARATOR .
        '..' . DIRECTORY_SEPARATOR .
        'config' . DIRECTORY_SEPARATOR;

    /** Tipos de configuração para usar com getConfig() */
    const TYPE_DATABASE = 'database';
    const TYPE_ROUTES = 'routes';

    /**
     * Pega as configurações do sistema
     *
     * @param string $type Tipo de configuração
     *
     * @return array
     */
    static public function getConfig($type)
    {
        // Pega o arquivo se ele existir
        $path = self::PATH_CONFIG . $type . '.php';
        $response = [];
        if (file_exists($path)) {
            $response = include($path);
        }

        // Verifica se há configurações locais
        $pathLocal = self::PATH_CONFIG . $type . '.local.php';
        if( file_exists($pathLocal) ){
            $temp = include ($pathLocal);
            // Substitui a configuração pelas configurações locais
            $response = array_merge($response, $temp);
        }

        return $response;
    }
}