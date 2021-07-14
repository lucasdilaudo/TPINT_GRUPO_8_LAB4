package Controles;

import java.util.Calendar;
import java.util.GregorianCalendar;

import Excepciones.FechaException;

public class Validarfecha {

	public static boolean ValidarFecha(String fecha) throws FechaException{
		GregorianCalendar c = new GregorianCalendar();
		boolean b = true;
		String[] campo = fecha.split("/");
		
		
		int dia = Integer.parseInt(campo[0]);
		int mes = Integer.parseInt(campo[1]);
		int anio = Integer.parseInt(campo[2]);
		if(mes>12) {
			b = false;
			throw new FechaException();
		}
		
		
		if(mes==2) {
			if(c.isLeapYear(anio)) {
				if(dia>29) {
					b = false;
					throw new FechaException();
					
				} 
			}
			else {
				if(dia>28) {
					b = false;
					throw new FechaException();
					
				} 
				
			}
		}
		
		else{
			if(mes==1 || mes==3 || mes==5 || mes==7 || mes==8 || mes==10 || mes==12) {
				if(dia>31) {
					b = false;
					throw new FechaException();
				
					}
			}
			else {
				if(dia>30) {
					b = false;
					throw new FechaException();					
					}
					
				}
		
		}
		
		
		return b;
	}
	
	public static boolean ValidarFecha(int dia,int mes, int anio) throws FechaException{
		GregorianCalendar c = new GregorianCalendar();
		boolean b = true;
		
		if(mes>12) {
			b = false;
			throw new FechaException();
		}
		
		
		if(mes==2) {
			if(c.isLeapYear(anio)) {
				if(dia>29) {
					b = false;
					throw new FechaException();
					
				} 
			}
			else {
				if(dia>28) {
					b = false;
					throw new FechaException();
					
				} 
				
			}
		}
		
		else{
			if(mes==1 || mes==3 || mes==5 || mes==7 || mes==8 || mes==10 || mes==12) {
				if(dia>31) {
					b = false;
					throw new FechaException();
				
					}
			}
			else {
				if(dia>30) {
					b = false;
					throw new FechaException();					
					}
					
				}
		
		}
		
		
		return b;
	}
	
	
	
}
