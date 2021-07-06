package Negocio;

import Dao.MovimientosDao;
import entidades.Movimiento;

public class NegocioMovimiento {
	private static MovimientosDao movDao= new MovimientosDao();
	
	public static boolean AgregarTransferencia(Movimiento m) {
		
		if(movDao.AgregarTransferencia(m)==1) {
			return true;
		}
		return false;
	}
}
