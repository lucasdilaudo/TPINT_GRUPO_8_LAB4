package entidades;

public class Movimiento {
	private int idMovimiento;
	private String fecha;
	private String detalle;
	private float importe;
	private int tipoMovimiento;
	private int cbuOrigen;
	private int cbuDestino;
	public int getIdMovimiento() {
		return idMovimiento;
	}
	public void setIdMovimiento(int idMovimiento) {
		this.idMovimiento = idMovimiento;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public String getDetalle() {
		return detalle;
	}
	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}
	public float getImporte() {
		return importe;
	}
	public void setImporte(float importe) {
		this.importe = importe;
	}
	public int getTipoMovimiento() {
		return tipoMovimiento;
	}
	public void setTipoMovimiento(int tipoMovimiento) {
		this.tipoMovimiento = tipoMovimiento;
	}
	public int getCbuOrigen() {
		return cbuOrigen;
	}
	public void setCbuOrigen(int cbuOrigen) {
		this.cbuOrigen = cbuOrigen;
	}
	public int getCbuDestino() {
		return cbuDestino;
	}
	public void setCbuDestino(int cbuDestino) {
		this.cbuDestino = cbuDestino;
	}
	
	
}
