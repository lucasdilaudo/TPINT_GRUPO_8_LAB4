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
	
	
	public static boolean Existe(String DNI) {
		
		if(cdao.Existe(DNI).getDni()!=null) return true;
		else return false;
		
		
	}
	
   
     public static int Saber_TipodeUsuario(String Usuario,String Contrasena) {
		
		if(cdao.Saber_TipodeUsuario(Usuario,Contrasena).getDni()==null) return 0;
		
		else {
			if(cdao.Saber_TipodeUsuario(Usuario,Contrasena).getTipodeCliente()==1) {
				return 1;
			}
			else {
				if(cdao.Saber_TipodeUsuario(Usuario,Contrasena).getTipodeCliente()==2) {
					return 2;
				}
				else {
					return 3; // en este caso el usuario esta mal en el sistema y no es ni admin ni cliente.
				}
			}
		}
		
		
	}
	
	
}
