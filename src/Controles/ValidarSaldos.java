package Controles;

import Excepciones.SaldoNegativoException;

public class ValidarSaldos {
	public static boolean ValidarSaldos(Double saldo) throws SaldoNegativoException {
		boolean b=true;
		if(saldo<0) {
			b = false;
			throw new SaldoNegativoException();
			
		}
		return b;
	}
}
