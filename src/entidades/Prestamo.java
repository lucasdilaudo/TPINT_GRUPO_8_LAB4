package entidades;

public class Prestamo {
	private int IdPrestamo;
	private String CBU;
	private String Fecha;
	private double ImporteaPagar;
	private double ImportePedido;
	private int Plazo;
	private double MontoMensual;
	private int CantCuotas;
	private int Aceptado;
	
	public int getIdPrestamo() {
		return IdPrestamo;
	}
	public void setIdPrestamo(int idPrestamo) {
		IdPrestamo = idPrestamo;
	}
	public String getCBU() {
		return CBU;
	}
	public void setCBU(String cBU) {
		CBU = cBU;
	}
	public String getFecha() {
		return Fecha;
	}
	public void setFecha(String fecha) {
		Fecha = fecha;
	}
	public double getImporteaPagar() {
		return ImporteaPagar;
	}
	public void setImporteaPagar(double importeaPagar) {
		ImporteaPagar = importeaPagar;
	}
	public double getImportePedido() {
		return ImportePedido;
	}
	public void setImportePedido(double importePedido) {
		ImportePedido = importePedido;
	}
	public int getPlazo() {
		return Plazo;
	}
	public void setPlazo(int plazo) {
		Plazo = plazo;
	}
	public double getMontoMensual() {
		return MontoMensual;
	}
	public void setMontoMensual(double montoMensual) {
		MontoMensual = montoMensual;
	}
	public int getCantCuotas() {
		return CantCuotas;
	}
	public void setCantCuotas(int cantCuotas) {
		CantCuotas = cantCuotas;
	}
	
	
	public int getAceptado() {
		return Aceptado;
	}
	public void setAceptado(int aceptado) {
		Aceptado = aceptado;
	}
	@Override
	public String toString() {
		return "Prestamos [IdPrestamo=" + IdPrestamo + ", CBU=" + CBU + ", Fecha=" + Fecha + ", ImporteaPagar="
				+ ImporteaPagar + ", ImportePedido=" + ImportePedido + ", Plazo=" + Plazo + ", MontoMensual="
				+ MontoMensual + ", CantCuotas=" + CantCuotas + "]";
	}
	
	
	
	
}
