package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Daointerfaz.PrestamosDaoInterfaz;
import entidades.Prestamo;

public class PrestamosDao implements PrestamosDaoInterfaz{
	private String select = "select idprestamos,CBU,DATE_FORMAT(FechaPrestamo,'%d/%m/%Y'),ImporteApagar,ImportePedido,PlazoPrestamo,MontoMensual,CantCuotas,aceptado from prestamos";
	private String delete = "delete * from prestamos";
	private String insert = "insert into prestamos values(default,?,?,?,?,?,?,?,null)";
	private String pagar = "update prestamos set ImporteApagar=?,CantCuotas=? where idprestamos=?;";
	private String aceptar = "update prestamos set Aceptado=? where idprestamos=?";
	private String prestamosAceptados = "SELECT idprestamos,prestamos.CBU,DATE_FORMAT(FechaPrestamo,'%d/%m/%Y'),ImporteApagar,ImportePedido,PlazoPrestamo,MontoMensual,CantCuotas,aceptado from bdbanco.prestamos inner join cuentas on usuarios_DNI = ? where cuentas.CBU=prestamos.CBU and aceptado=1 and ImporteApagar>0";
	public int AgregarPrestamo(Prestamo p) {
		int filas=0;
		try {
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(insert);
			pst.setString(1, p.getCBU());
			pst.setString(2, p.getFecha());
			pst.setDouble(3, p.getImporteaPagar());
			pst.setDouble(4, p.getImportePedido());
			pst.setInt(5, p.getPlazo());
			pst.setDouble(6, p.getMontoMensual());
			pst.setInt(7, p.getCantCuotas());
			
			
			filas = pst.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return filas;
	}
	
	public int PagarPrestamo(Prestamo p) {
		int filas=0;
		try {
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(pagar);
			pst.setDouble(1, p.getImporteaPagar());
			pst.setInt(2, p.getCantCuotas());
			pst.setInt(3, p.getIdPrestamo());
		
			filas = pst.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return filas;
	}
	
	public int EliminarPrestamo(String id) {
		int filas=0;
		try {
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(delete+"where idptrestamos=");
			pst.setString(1, id);

			
			filas = pst.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return filas;
		
		
	}
	
	
	public ArrayList<Prestamo> ObtenerPrestamos() {
		ArrayList<Prestamo> ap = new ArrayList<>();

		 
		try {
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst;
			
			pst = cn.prepareStatement(select+" where aceptado is null");
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				Prestamo p = new Prestamo();
				p.setIdPrestamo(rs.getInt(1));
				p.setCBU(rs.getString(2));
				p.setFecha(rs.getString(3));
				p.setImporteaPagar(rs.getDouble(4));
				p.setImportePedido(rs.getDouble(5));
				p.setPlazo(rs.getInt(6));
				p.setMontoMensual(rs.getDouble(7));
				p.setCantCuotas(rs.getInt(8));
				
				ap.add(p);
			}
			
			
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ap;
		
	}
	
	public ArrayList<Prestamo> ObtenerPrestamosPorCbu(String cbu) {
		ArrayList<Prestamo> ap = new ArrayList<>();

		 
		try {
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst;
			pst = cn.prepareStatement(select+" where CBU="+cbu); //para buscar por cbu o traer todos
			
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				Prestamo p = new Prestamo();
				p.setIdPrestamo(rs.getInt(1));
				p.setCBU(rs.getString(2));
				p.setFecha(rs.getString(3));
				p.setImporteaPagar(rs.getDouble(4));
				p.setImportePedido(rs.getDouble(5));
				p.setPlazo(rs.getInt(6));
				p.setMontoMensual(rs.getDouble(7));
				p.setCantCuotas(rs.getInt(8));
				
				ap.add(p);
			}
			
			
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ap;
		
	}
	
	public Prestamo ObtenerPrestamo(String id) {
		Prestamo p = new Prestamo();

		 
		try {
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst;
			pst = cn.prepareStatement(select+" where idprestamos="+id); //para buscar por cbu o traer todos
			
			ResultSet rs = pst.executeQuery();
			rs.next();
				
			p.setIdPrestamo(rs.getInt(1));
			p.setCBU(rs.getString(2));
			p.setFecha(rs.getString(3));
			p.setImporteaPagar(rs.getDouble(4));
			p.setImportePedido(rs.getDouble(5));
			p.setPlazo(rs.getInt(6));
			p.setMontoMensual(rs.getDouble(7));
			p.setCantCuotas(rs.getInt(8));
				
		
			
			
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return p;
		
	}
	
	
	public ArrayList<Prestamo> ObtenerPrestamosAceptados(String dni) {
		ArrayList<Prestamo> ap = new ArrayList<>();

		 
		try {
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst;
			pst = cn.prepareStatement(this.prestamosAceptados); //para buscar por cbu o traer todos
			pst.setString(1, dni);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				Prestamo p = new Prestamo();
				p.setIdPrestamo(rs.getInt(1));
				p.setCBU(rs.getString(2));
				p.setFecha(rs.getString(3));
				p.setImporteaPagar(rs.getDouble(4));
				p.setImportePedido(rs.getDouble(5));
				p.setPlazo(rs.getInt(6));
				p.setMontoMensual(rs.getDouble(7));
				p.setCantCuotas(rs.getInt(8));
				
				ap.add(p);
			}
			
			
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ap;
		
	}
	
	public int AceptarPrestamo(int a,String id) {
		int filas=0;
		try {
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(aceptar);
			pst.setInt(1, a);
			pst.setString(2, id);

		
			
			filas = pst.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return filas;
	}
	

}
