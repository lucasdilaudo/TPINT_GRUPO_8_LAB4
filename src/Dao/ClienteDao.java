package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;

import entidades.Cliente;


public class ClienteDao {
	private String insertar = "insert into usuarios values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	
	private String borrar = "update usuarios set Estado=0 where DNI=?";
	private String modificar = "update usuarios set Contrasena=? where DNI=?";
	private String obtener = "SELECT DNI,Cuil,Nombre,Apellido,Sexo,Nacionalidad,DATE_FORMAT(FechadeNacimiento,'%d/%m/%Y'),Direccion,Localidad,Provincia,CorreoElectronico,Telefono,TipodeUsuario,Usuario,Contrasena from usuarios";
	
	
	public int AgregarCliente(Cliente c) {
		int filas=0;
		try {
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(insertar);
			
			pst.setString(1, c.getDni());
			pst.setString(2,c.getCUIL());
			pst.setString(3, c.getNombre());
			pst.setString(4, c.getApellido());
			pst.setInt(5, c.getSexo());
			pst.setString(6,c.getNacionalidad());
			pst.setString(7,c.getFecha());
			pst.setString(8,c.getDireccion());
			pst.setString(9,c.getLocalidad());
			pst.setString(10, c.getProvincia());
			pst.setString(11, c.getCorreo());
			pst.setString(12, c.getTelefono());
			pst.setInt(13, c.getTipodeCliente());
			pst.setString(14, c.getUsuario());
			pst.setString(15, c.getContrasenia());
			pst.setBoolean(16, true);
			filas = pst.executeUpdate();
			
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return filas;
	}
	
	
	public int EliminarCliente(String DNI) {
		int filas=0;
		
		try {
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(borrar);
			
			pst.setString(1, DNI);
			
			filas = pst.executeUpdate();
			
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return filas;
	}
	
	public int ModificarCliente(Cliente c) {
		int filas=0;
		try {
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(modificar);
		
			pst.setString(2, c.getDni());

			pst.setString(1, c.getContrasenia());
		
			filas = pst.executeUpdate();
			
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return filas;
	}
	public Cliente ObtenerCliente(String DNI) {
		Cliente c = new Cliente();
		try {
		
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(obtener + " where Estado=1 and DNI=?");
			pst.setString(1, DNI);
			
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
			
			
			c.setDni(rs.getString(1));
			c.setCUIL(rs.getString(2));
			c.setNombre(rs.getString(3));
			c.setApellido(rs.getString(4));
			c.setSexo(rs.getInt(5));
			c.setNacionalidad(rs.getString(6));
			c.setFecha(rs.getString(7));
			c.setDireccion(rs.getString(8));
			c.setLocalidad(rs.getString(9));
			c.setProvincia(rs.getString(10));
			c.setCorreo(rs.getString(11));
			c.setTelefono(rs.getString(12));
			c.setTipodeCliente(rs.getInt(13));
			c.setUsuario(rs.getString(14));
			c.setContrasenia(rs.getString(15));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return c;
		
		
	}
	
	public Cliente Existe(String DNI) {
		Cliente c = new Cliente();
		try {
		
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(obtener + " where DNI=?");
			pst.setString(1, DNI);
			
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
			
			
			c.setDni(rs.getString(1));
			c.setCUIL(rs.getString(2));
			c.setNombre(rs.getString(3));
			c.setApellido(rs.getString(4));
			c.setSexo(rs.getInt(5));
			c.setNacionalidad(rs.getString(6));
			c.setFecha(rs.getString(7));
			c.setDireccion(rs.getString(8));
			c.setLocalidad(rs.getString(9));
			c.setProvincia(rs.getString(10));
			c.setCorreo(rs.getString(11));
			c.setTelefono(rs.getString(12));
			c.setTipodeCliente(rs.getInt(13));
			c.setUsuario(rs.getString(14));
			c.setContrasenia(rs.getString(15));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return c;
		
		
	}
	
	public ArrayList<Cliente> ObtenerTodo() {
		ArrayList<Cliente> ac = new ArrayList<>();
		try {
		
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(obtener);
	
			ResultSet rs = pst.executeQuery();
		
			while(rs.next()) {
			
				Cliente c = new Cliente();
				
				c.setDni(rs.getString(1));
				c.setCUIL(rs.getString(2));
				c.setNombre(rs.getString(3));
				c.setApellido(rs.getString(4));
				c.setSexo(rs.getInt(5));
				c.setNacionalidad(rs.getString(6));
				c.setFecha(rs.getString(7));
				c.setDireccion(rs.getString(8));
				c.setLocalidad(rs.getString(9));
				c.setProvincia(rs.getString(10));
				c.setCorreo(rs.getString(11));
				c.setTelefono(rs.getString(12));
				c.setTipodeCliente(rs.getInt(13));
				c.setUsuario(rs.getString(14));
				c.setContrasenia(rs.getString(15));
				
				
				ac.add(c);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return ac;
		
		
	}
}
