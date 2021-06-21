package entidades;

public class Cuenta {
	
	private String tipoDeCuenta;
	private String nroCuenta;
	private String CBU;
	private String DNICliente;
	private String fechaCreacion;
	private double saldo;
	
	public Cuenta(){
		saldo=10000;
	}

	public String getTipoDeCuenta() {
		return tipoDeCuenta;
	}

	public void setTipoDeCuenta(String tipoDeCuenta) {
		this.tipoDeCuenta = tipoDeCuenta;
	}

	public String getNroCuenta() {
		return nroCuenta;
	}

	public void setNroCuenta(String nroCuenta) {
		this.nroCuenta = nroCuenta;
	}

	public String getCBU() {
		return CBU;
	}

	public void setCBU(String cBU) {
		CBU = cBU;
	}

	public String getDNICliente() {
		return DNICliente;
	}

	public void setDNICliente(String dNICliente) {
		DNICliente = dNICliente;
	}

	public String getFechaCreacion() {
		return fechaCreacion;
	}

	public void setFechaCreacion(String fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}

	public double getSaldo() {
		return saldo;
	}

	public void setSaldo(double saldo) {
		this.saldo = saldo;
	}

	@Override
	public String toString() {
		return "Tipo de cuenta: " + tipoDeCuenta + ", "
				+ "Numero de cuenta: " + nroCuenta + ", "
				+ "CBU: " + CBU + ", "
				+ "DNI del cliente: " + DNICliente + ","
				+ " fecha de creacion: " + fechaCreacion + ", "
				+ "saldo: " + saldo;
	}
	
	
	
}
