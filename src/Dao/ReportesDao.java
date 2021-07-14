package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class ReportesDao {

	private String Reportepormeses = "select descripcion, ifnull(sub.montopositivo,0) as a,ifnull(sub.montonegativo,0) as b,ifnull((sub.montopositivo-sub.montonegativo),0) as balance from meses left join(SELECT sum(if(tipomovimiento=3,ImporteMovimiento,0)) as montopositivo,sum(if(tipomovimiento=2,ImporteMovimiento,0)) as montonegativo , month(fechamovimiento) as mes FROM bdbanco.movimiento  where extract(year from fechamovimiento)=? group by extract(month from fechamovimiento)) as sub on idmes=sub.mes";
	private String Clientesquemaspidierion = "select t1.usuarios_DNI,t1.Nombre,sum(ImportePedido) as MontoTotal,count(idprestamos) Solicitados,sum(if(aceptado=1,1,0)) as aceptados,sum(if (aceptado=0,1,0)) as rechazados from prestamos  inner join(select usuarios_DNI,CBU,t2.Nombrecompl as Nombre from cuentas inner join(select concat_ws(' ',Nombre,Apellido) as Nombrecompl,DNI from usuarios )as t2 on t2.DNI = cuentas.usuarios_DNI)as t1 on t1.CBU = prestamos.cbu  where FechaPrestamo between ? and ? group by t1.usuarios_DNI order by MontoTotal desc limit 10";
	
	public ArrayList<String[]> Reportepormeses(int anio) {
		ArrayList<String[]> as = new ArrayList<String[]>();
	
		try{
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(Reportepormeses);
			pst.setInt(1, anio);
			System.out.println(pst.toString());
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				String[] campos = new String[4];
				campos[0] = rs.getString(1);
				campos[1] = rs.getString(2);
				campos[2] = rs.getString(3);
				campos[3] = rs.getString(4);
				
				as.add(campos);
			}
			
			
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return as;
	}
	
	public ArrayList<String[]> Clientesquemaspidierion(String fecha1,String fecha2) {
		ArrayList<String[]> as = new ArrayList<String[]>();
	
		try{
			Connection cn = Conexion.getConexion().getSQLConexion();
			PreparedStatement pst = cn.prepareStatement(Clientesquemaspidierion);
			pst.setString(1, fecha1);
			pst.setString(2, fecha2);
			System.out.println(pst.toString());
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				String[] campos = new String[6];
				campos[0] = rs.getString(1);
				campos[1] = rs.getString(2);
				campos[2] = rs.getString(3);
				campos[3] = rs.getString(4);
				campos[4] = rs.getString(5);
				campos[5] = rs.getString(6);
				
				as.add(campos);
			}
			
			
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return as;
	}
}
