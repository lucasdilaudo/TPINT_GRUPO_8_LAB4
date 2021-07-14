package Excepciones;

public class FechaException extends RuntimeException{
	
	public FechaException(){
		
	}

	@Override
	public String getMessage() {
		return "Fecha no valida";
	}
	
	

}
