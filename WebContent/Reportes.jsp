<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reportes</title>
</head>
<body>
<h1 align="left">Reportes</h1>
<br>
<div  style="padding-left: 10px;
		    margin-left: 10px;
		    position: left;
		    float: left;
		    width: 164px;
		
		    height: auto;">
	
 <br>		
         <br>Fecha de inicio:<input type="text" name="txtFechaInicio"><br>
		
		 <br>Fecha de fin:<input type="text" name="txtFechaFin"><br>
		  
		 <br><input type="submit" name="btnFiltrar" value="Filtrar"><br>
		
		<br><input type="submit" name="btnDeudores" value="Deudores"><br>
				
		<br><input type="submit" name="btnMontoTotalCuentas" value="Monto total de cuentas"><br>
		
		<br><input type="submit" name="btnMontoTotalCuentas" value="Monto total de cuentas"><br>
		
		</div>
		<table name="tablaReportes" border="1" align="center">
		
		<thead>	
			<tr>
				<th>Fecha</th>			
				<th>campo1</th>	
				<th>campo2</th>	
				<th>Campo3</th>	
				<th>Campo4</th>
				<th>Campo5</th>
				<th>Campo6</th>
				
			</tr>
		</thead>
		<tbody>
		</table>

</body>
</html>