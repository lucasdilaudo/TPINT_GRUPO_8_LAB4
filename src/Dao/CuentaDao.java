package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Daointerfaz.CuentaDaoInterfaz;
import entidades.Cuenta;

public class CuentaDao implements CuentaDaoInterfaz {
	private String insertar = "insert into cuentas values(?,?,?,?,?,?,?)";
	private String contar = "Select count(usuarios_DNI) from cuentas where usuarios_DNI=?";
	//private String borrar = "delete from Cuentas where NrodeCuenta=? and CBU=?";
	private String borrar = "update bdbanco.cuentas set Estado=0 where NrodeCuenta=? and CBU=?";
	private String modificar = "update cuentas set usuarios_DNI=?,tiposdecuentas_IDTipodeCuenta=?,Saldo=? where NrodeCuenta=? and CBU=?";
	private String obtener = "SELECT NrodeCuenta,CBU,usuarios_DNI,tiposdecuentas_IDTipodeCuenta,DATE_FORMAT(FechadeCreacion, '%d/%m/%Y'),Saldo FROM bdbanco.cuentas";
	
	public int AgregarCuenta(Cuenta c) {
		int filas=0;
		try {
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(insertar);
			pst.setString(1, c.getNroCuenta());
			pst.setString(2, c.getCBU());
			
			pst.setString(7, c.getDNICliente());
			pst.setString(3, c.getFechaCreacion());
			pst.setInt(6, c.getTipoDeCuenta());
			pst.setDouble(4, c.getSaldo());
			pst.setBoolean(5, true);
			filas = pst.executeUpdate();
			
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return filas;
	}
	
	
	public int EliminarCuenta(String CBU, String NrodeCuenta) {
		int filas=0;
		
		try {
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(borrar);
			
			pst.setString(1, NrodeCuenta);
			pst.setString(2, CBU);
			filas = pst.executeUpdate();
			
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return filas;
	}
	
	public int ModificarCuenta(Cuenta c) {
		int filas=0;
		try {
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(modificar);
		
			pst.setString(4, c.getNroCuenta());
			pst.setString(5, c.getCBU());
			pst.setString(1, c.getDNICliente());
		
			pst.setInt(2, c.getTipoDeCuenta());
			pst.setDouble(3, c.getSaldo());
		
			filas = pst.executeUpdate();
			
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return filas;
	}
	public Cuenta ObtenerCuenta(String CBU, String NrodeCuenta) {
		Cuenta c = new Cuenta();
		try {
		
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(obtener + " where Estado=1 and NrodeCuenta=? and CBU=?");
			pst.setString(1, NrodeCuenta);
			pst.setString(2, CBU);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
			c.setNroCuenta(rs.getString(1));
			c.setCBU(rs.getString(2));
			c.setDNICliente(rs.getString(3));
			c.setFechaCreacion(rs.getString(5));
			c.setTipoDeCuenta(rs.getInt(4));
			c.setSaldo(rs.getDouble(6));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return c;
		
		
	}
	
	public Cuenta ObtenerCuenta(String CBU) {
		Cuenta c = new Cuenta();
		try {
		
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(obtener + " where Estado=1 and CBU=?");
		
			pst.setString(1, CBU);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
			c.setNroCuenta(rs.getString(1));
			c.setCBU(rs.getString(2));
			c.setDNICliente(rs.getString(3));
			c.setFechaCreacion(rs.getString(5));
			c.setTipoDeCuenta(rs.getInt(4));
			c.setSaldo(rs.getDouble(6));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return c;
		
		
	}
	
	public Cuenta ObtenerCuentaConDNI(String DNI) {
		Cuenta c = new Cuenta();
		try {
		
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(obtener + " where Estado=1 and usuarios_DNI=?");
			pst.setString(1, DNI);
			
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
			c.setNroCuenta(rs.getString(1));
			c.setCBU(rs.getString(2));
			c.setDNICliente(rs.getString(3));
			c.setFechaCreacion(rs.getString(5));
			c.setTipoDeCuenta(rs.getInt(4));
			c.setSaldo(rs.getDouble(6));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return c;
		
		
	}
	
	public Cuenta Existe(String CBU, String NrodeCuenta) {
		Cuenta c = new Cuenta();
		try {
		
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(obtener + " where NrodeCuenta=? and CBU=?");
			pst.setString(1, NrodeCuenta);
			pst.setString(2, CBU);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
			c.setNroCuenta(rs.getString(1));
			c.setCBU(rs.getString(2));
			c.setDNICliente(rs.getString(3));
			c.setFechaCreacion(rs.getString(5));
			c.setTipoDeCuenta(rs.getInt(4));
			c.setSaldo(rs.getDouble(6));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return c;
		
		
	}
	
	public Cuenta Existe(String CBU) {
		Cuenta c = new Cuenta();
		try {
		
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(obtener + " where Estado=1 and CBU=?");
			
			pst.setString(1, CBU);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
			c.setNroCuenta(rs.getString(1));
			c.setCBU(rs.getString(2));
			c.setDNICliente(rs.getString(3));
			c.setFechaCreacion(rs.getString(5));
			c.setTipoDeCuenta(rs.getInt(4));
			c.setSaldo(rs.getDouble(6));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return c;
		
		
	}
	
	
	public ArrayList<Cuenta> ObtenerTodo() {
		ArrayList<Cuenta> ac = new ArrayList<>();
		try {
		
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(obtener+ " where Estado=1");
	
			ResultSet rs = pst.executeQuery();
		
			while(rs.next()) {
			
				Cuenta c = new Cuenta();
				c.setNroCuenta(rs.getString(1));
				c.setCBU(rs.getString(2));
				c.setDNICliente(rs.getString(3));
				c.setFechaCreacion(rs.getString(5));
				c.setTipoDeCuenta(rs.getInt(4));
				c.setSaldo(rs.getDouble(6));
				
				ac.add(c);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return ac;
		
		
	}
	
	public int CantidadCuentas(String DNI) {
		int i=0;
		try {
		
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(contar);
			pst.setString(1, DNI);
			
			ResultSet rs = pst.executeQuery();
			rs.next();
	
			i = rs.getInt(1);
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
		
		
	}

	
	public ArrayList<Cuenta> ObtenerCuentPorUsuario(String dni) {
		ArrayList<Cuenta> ac = new ArrayList<>();
		try {
		
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(obtener+ " where Estado=1 and usuarios_DNI="+dni);
	
			ResultSet rs = pst.executeQuery();
		
			while(rs.next()) {
			
				Cuenta c = new Cuenta();
				c.setNroCuenta(rs.getString(1));
				c.setCBU(rs.getString(2));
				c.setDNICliente(rs.getString(3));
				c.setFechaCreacion(rs.getString(5));
				c.setTipoDeCuenta(rs.getInt(4));
				c.setSaldo(rs.getDouble(6));
				
				ac.add(c);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return ac;
		
		
	}
	


}
