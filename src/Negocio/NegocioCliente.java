package Negocio;

import java.util.ArrayList;

import Dao.ClienteDao;
import Dao.CuentaDao;
import entidades.Cliente;
import entidades.Cuenta;

public class NegocioCliente {
	private static ClienteDao cdao = new ClienteDao();
	
	public static boolean AgregarCliente(Cliente c) {
		
		if(cdao.AgregarCliente(c)==1) return true;
		else return false;
		
	}
	
	public static Cliente ObtenerCliente(String DNI) {
		
		return cdao.ObtenerCliente(DNI);
	}

	public static ArrayList<Cliente> ObtenerTodo(){

		return cdao.ObtenerTodo();
	}
	
	public static boolean EliminarCliente(String DNI) {
		if (cdao.EliminarCliente(DNI)==1) return true;
		else return false;
	}
	
	public static boolean ModificarCliente(Cliente c) {
		if (cdao.ModificarCliente(c)==1) return true;
		else return false;	
			
		
		
	}
	
	
	
	
	
	
}
