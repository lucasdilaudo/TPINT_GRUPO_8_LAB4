package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entidades.Cuenta;

public class CuentaDao {
	private String insertar = "insert into cuentas values(?,?,?,?,?,?,?)";
	//private String borrar = "delete from Cuentas where NrodeCuenta=? and CBU=?";
	private String borrar = "update bdbanco.cuentas set Estado=0 where NrodeCuenta=? and CBU=?";
	private String modificar = "update cuentas set DNI=?,TipodeCuenta=?,Saldo=? where NrodeCuenta=? and CBU=?";
	private String obtener = "SELECT * FROM bdbanco.cuentas where Estado=1";
	
	public int AgregarCuenta(Cuenta c) {
		int filas=0;
		try {
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(insertar);
			pst.setString(1, c.getNroCuenta());
			pst.setString(2, c.getCBU());
			
			pst.setString(3, c.getDNICliente());
			pst.setString(4, c.getFechaCreacion());
			pst.setInt(5, c.getTipoDeCuenta());
			pst.setDouble(6, c.getSaldo());
			pst.setBoolean(7, true);
			filas = pst.executeUpdate();
			
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return filas;
	}
	
	
	public int EliminarCuenta(String CBU, String NrodeCuenta) {
		int filas=0;
		System.out.println(CBU+" "+NrodeCuenta);
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
		
			pst.setString(8, c.getNroCuenta());
			pst.setString(9, c.getCBU());
			pst.setString(1, c.getDNICliente());
		
			pst.setInt(3, c.getTipoDeCuenta());
			pst.setDouble(4, c.getSaldo());
		
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
			PreparedStatement pst = cn.prepareStatement(obtener + " and NrodeCuenta=? and CBU=?");
			pst.setString(1, NrodeCuenta);
			pst.setString(2, CBU);
			ResultSet rs = pst.executeQuery();
			rs.next();
			c.setNroCuenta(rs.getString(1));
			c.setCBU(rs.getString(2));
			c.setDNICliente(rs.getString(3));
			c.setFechaCreacion(rs.getString(4));
			c.setTipoDeCuenta(rs.getInt(5));
			c.setSaldo(rs.getDouble(6));
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
			PreparedStatement pst = cn.prepareStatement(obtener);
	
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
