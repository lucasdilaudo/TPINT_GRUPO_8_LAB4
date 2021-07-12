package Negocio;

import java.util.ArrayList;

import javax.print.attribute.standard.PDLOverrideSupported;

import Dao.PrestamosDao;
import entidades.Prestamo;

public class NegocioPrestamo {
	private static PrestamosDao pdao = new PrestamosDao();
	

	
	public static Boolean EliminarPrestamo(String id) {
		
		if(pdao.EliminarPrestamo(id)==1) return true;
		else return false;
	}
	
    public static ArrayList<Prestamo> ObtenerTodo(){
    	
    	return pdao.ObtenerPrestamos();
    }
	
    public static ArrayList<Prestamo> ObtenerPorCbu(String cbu){
    	return pdao.ObtenerPrestamosPorCbu(cbu);
    }
	
    public static boolean AgregarPrestamo(Prestamo p) {
    	if(pdao.AgregarPrestamo(p)==1) return true;
    	else return false;
    	
    }
	
   
    public static void AceptarPrestamo(int a,String id) {
    	
    	pdao.AceptarPrestamo(a, id);
    
    	
    }
	
    public static ArrayList<Prestamo> ObtenerPrestamosAceptados(String dni){
    	return pdao.ObtenerPrestamosAceptados(dni);
    }
   
    public static Prestamo ObtenerPrestamo (String id) {
    	
    	return pdao.ObtenerPrestamo(id);
    }
    
    
    public static boolean PagarPrestamo(Prestamo p) {
    	
    	if(pdao.PagarPrestamo(p)==1) return true;
    	else return false;
    	
    }
    
    
}
