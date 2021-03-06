package Negocio;

import java.util.ArrayList;

import Dao.CuentaDao;
import entidades.Cuenta;

public class NegocioCuenta {
	private static CuentaDao cdao = new CuentaDao();
	
	
	
	public static boolean AgregarCuenta(Cuenta c) {
		
		if(cdao.AgregarCuenta(c)==1) return true;
		else return false;
		
	}
	
	public static Cuenta ObtenerCuenta(String CBU, String NrodeCuenta) {
		
		return cdao.ObtenerCuenta(CBU, NrodeCuenta);
	}
	public static Cuenta ObtenerCuenta(String CBU) {
		
		return cdao.ObtenerCuenta(CBU);
	}
	
	public static Cuenta ObtenerCuentaConDNI(String DNI) {
		
		return cdao.ObtenerCuentaConDNI(DNI);
	}

	public static ArrayList<Cuenta> ObtenerTodo(){

		return cdao.ObtenerTodo();
	}
	
	public static boolean EliminarCuenta(String CBU, String NrodeCuenta) {
		if (cdao.EliminarCuenta(CBU,NrodeCuenta)==1) return true;
		else return false;
	}
	
	public static boolean ModificarCuenta(Cuenta c) {
		if (cdao.ModificarCuenta(c)==1) return true;
		else return false;	
			
		
		
	}
	
	public static int CantidadCuentas(String DNI) {
		
		
		return cdao.CantidadCuentas(DNI);
		
	}
	
	
	
	public static boolean Existe(String CBU, String NrodeCuenta) {
	
		 
		if(cdao.Existe(CBU, NrodeCuenta).getCBU()!=null) return true;
		else return false;
	}
	
	public static ArrayList<Cuenta> ObtenerCuentasPorUsuario(String dni){

		return cdao.ObtenerCuentPorUsuario(dni);
	}
	
	
	public static boolean Existe(String CBU) {
		
		 
		if(cdao.Existe(CBU).getCBU()!=null) return true;
		else return false;
	}
	
}
