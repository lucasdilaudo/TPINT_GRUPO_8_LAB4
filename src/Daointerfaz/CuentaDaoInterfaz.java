package Daointerfaz;

import java.util.ArrayList;

import entidades.Cuenta;

public interface CuentaDaoInterfaz {
	public int AgregarCuenta(Cuenta c);
	
	public int EliminarCuenta(String CBU, String NrodeCuenta);
	
	public int ModificarCuenta(Cuenta c);
	
	public Cuenta ObtenerCuenta(String CBU, String NrodeCuenta);
	
	public Cuenta ObtenerCuentaConDNI(String DNI);
	
	public Cuenta Existe(String CBU, String NrodeCuenta);
	
	public Cuenta Existe(String CBU);
		
	public ArrayList<Cuenta> ObtenerTodo();
	
	public int CantidadCuentas(String DNI);
	
	public Cuenta ObtenerCuenta(String CBU);
	
	public ArrayList<Cuenta> ObtenerCuentPorUsuario(String dni);
	

}
