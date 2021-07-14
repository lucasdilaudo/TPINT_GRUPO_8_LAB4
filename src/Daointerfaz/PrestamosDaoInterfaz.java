package Daointerfaz;


import java.util.ArrayList;

import entidades.Prestamo;

public interface PrestamosDaoInterfaz {
	public int AgregarPrestamo(Prestamo p);
	
	public int PagarPrestamo(Prestamo p);
	
	public int EliminarPrestamo(String id);
	
	public ArrayList<Prestamo> ObtenerPrestamos();
	
	public ArrayList<Prestamo> ObtenerPrestamosPorCbu(String cbu);
	
	public Prestamo ObtenerPrestamo(String id);
	
	public ArrayList<Prestamo> ObtenerPrestamosAceptados(String dni);
	
	public int AceptarPrestamo(int a,String id);
	
	
}
