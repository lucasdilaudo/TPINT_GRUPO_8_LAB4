package Daointerfaz;

import java.util.ArrayList;

import entidades.Movimiento;

public interface MovimientosDaoInterfaz {
	
	public int AgregarTransferencia(Movimiento m);

	public ArrayList<Movimiento> ObtenerMovimientosPorCBU(String CBU);
	
	
	
}
