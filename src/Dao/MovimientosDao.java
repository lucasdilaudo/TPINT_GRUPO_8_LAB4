package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import entidades.Movimiento;

public class MovimientosDao {
	//transferencia
	private String insertarTransferencia = "insert into movimiento(FechaMovimiento, DetalleMovimiento, ImporteMovimiento, TipoMovimiento, CBUorigen, CBUdestino) values(?, ?, ?, ?, ?, ?)";
	
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
			
			filas = pst.executeUpdate();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return filas;
	}
	
	
}
