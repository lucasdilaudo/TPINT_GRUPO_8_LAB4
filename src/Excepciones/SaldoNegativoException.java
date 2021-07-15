package Excepciones;

public class SaldoNegativoException extends RuntimeException {
	
	public SaldoNegativoException() {
		super();
	}

	@Override
	public String getMessage() {
		
		return "La operacion excede el saldo disponible.";
	}
}
