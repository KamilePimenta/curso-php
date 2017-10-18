<?php
/**
 * Faz o cálculo de média
 */
class Media {
	/** @var array */
	private $valor;

	/**
	 * Adiciona os valores ao objeto
	 * 
	 * @param integer $valor
	 * 
	 * @return Media
	 */
	public function addValor(int $valor) {
		$this->valor[] = $valor;
		
		return $this;
	}
	
	/**
	 * Retorna o resultado da média
	 *
	 * @return integer
	 */
	public function resultado() {
		$soma = 0;
		$qtde = count($this->valor);
	
		// Evita divisão por zero
		if( $qtde == 0 ) {
			return 0;
		}
		
		// Soma os valores atribuídos
		foreach( $this->valor as $valor ){
			$soma += $valor;
		}
		
		// Calcula o reultado
		return $soma / $qtde;
	}
}