package Negocio;

import java.util.ArrayList;

import Dao.MovimientosDao;
import entidades.Movimiento;
import entidades.Prestamo;

public class NegocioMovimiento {
	private static MovimientosDao movDao= new MovimientosDao();
	
	public static boolean AgregarTransferencia(Movimiento m) {
		
		if(movDao.AgregarTransferencia(m)==1) {
			return true;
		}
		return false;
	}
	public static ArrayList<Movimiento> ObtenerMovPorCBU(String CBU) {
		return movDao.ObtenerMovimientosPorCBU(CBU);
	}

}
