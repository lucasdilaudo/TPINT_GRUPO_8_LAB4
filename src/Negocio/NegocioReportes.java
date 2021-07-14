package Negocio;

import java.util.ArrayList;

import Dao.ReportesDao;


public class NegocioReportes {
	private static ReportesDao rdao = new ReportesDao();
	
	public static ArrayList<String[]> Reportepormeses(int anio){
		return rdao.Reportepormeses(anio);
		
		
	  
	}
	
	
	public static ArrayList<String[]> Clientesquemaspidieron(String fecha1,String fecha2){
		
		return rdao.Clientesquemaspidierion(fecha1, fecha2);
	}
	
	
	
}
