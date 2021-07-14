package Daointerfaz;

import java.util.ArrayList;

import entidades.Cliente;

public interface ClienteDaoInterfaz {
	public int AgregarCliente(Cliente c);
	
	
	
	public int EliminarCliente(String DNI);
	
	public int ModificarCliente(Cliente c);
	
	public Cliente ObtenerCliente(String DNI);
	
	public Cliente Existe(String DNI);
	
	public Cliente Saber_TipodeUsuario(String Usuario,String Contrasena);
	
	public ArrayList<Cliente> ObtenerTodo();


	
	
}
