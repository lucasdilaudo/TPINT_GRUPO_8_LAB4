package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Daointerfaz.MovimientosDaoInterfaz;
import entidades.Movimiento;
import entidades.Prestamo;

public class MovimientosDao implements MovimientosDaoInterfaz{
	//transferencia
	private String insertarTransferencia = "insert into movimiento(FechaMovimiento, DetalleMovimiento, ImporteMovimiento, TipoMovimiento,`CBU origen`, `CBU destino`) values(?, ?, ?, ?, ?, ?)";
	private String select="select IDmovimiento,DATE_FORMAT(FechaMovimiento,'%d/%m/%Y'),DetalleMovimiento,ImporteMovimiento, TipoMovimiento, `CBU origen`, `CBU destino` from movimiento";
	
	public int AgregarTransferencia(Movimiento m) {
		int filas=0;
		try {
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(insertarTransferencia);
			
			pst.setString(1, m.getFecha());
			pst.setString(2, m.getDetalle());
			pst.setFloat(3, m.getImporte());
			pst.setInt(4, m.getTipoMovimiento());
			pst.setInt(5, m.getCbuOrigen());
			pst.setInt(6, m.getCbuDestino());
			System.out.println(pst.toString());
			filas = pst.executeUpdate();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return filas;
	}

	public ArrayList<Movimiento> ObtenerMovimientosPorCBU(String CBU) {
		ArrayList<Movimiento> amov = new ArrayList<>();

		 
		try {
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst;
			pst = cn.prepareStatement(select+" where `CBU destino`="+CBU+" or `CBU origen`="+CBU);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				Movimiento mov = new Movimiento();
				mov.setIdMovimiento(rs.getInt(1));
				mov.setFecha(rs.getString(2));
				mov.setDetalle(rs.getString(3));
				mov.setImporte(rs.getFloat(4));
				mov.setTipoMovimiento(rs.getInt(5));
				mov.setCbuOrigen(rs.getInt(6));
				mov.setCbuDestino(rs.getInt(7));
				
				amov.add(mov);
			}
			
			
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return amov;
		
	}
}
