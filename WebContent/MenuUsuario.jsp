<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mi Cuenta</title>
</head>

<body>
	<center><h1 style="color: gray; border: steelblue solid 1px;">Mi cuenta</h1></center>
	<br>
	<br>
	<div>
		<div style="padding-left: 10px;
	    padding-top: 10px;
	    margin-left: 57px;
	    margin-bottom: 50px;
	    float: left;
	    position: relative;
	    width: 75%;
	    border: steelblue solid 1px;
	    height: auto;">
		<center>
		<form style = "width: 100%; margin-bottom: 11px;" action="MenuUsuario.jsp" method="get" >
			
			<table style="width: 60%"  border="2">
				 
			    <tr>
			    	<th>Tipo de Cuenta</th>
			    	<th>Moneda</th>
			    	<th width="60%">Nro de Cuenta</th>
			    	<th width="60%">Saldo</th>
			    </tr>
			    
			    <tr>
		    		<td align="center" width="30%"> Cuenta </td>
					<td align="center" width="20%"> pesos </td>
					<td align="center" width="30%"> 132354 </td>
					<td align="center" width="20%"> $200 </td>
				</tr>
			</table>
		
		</form>
		</center>
		</div>
		<div  style="padding-top: 10px;
		    padding-left: 10px;
		    margin-left: 10px;
		    position: relative;
		    float: left;
		    width: 15%;
		    border: steelblue solid 1px;
		    height: auto;">
			<div><a href="Movimientos.jsp"> Historial de movimientos </a></div><br>
			<div><a href="Transferencias.jsp"> Transferencias </a></div><br>
			<div><a href="Prestamos.jsp"> Solicitar Prestamo </a></div><br>
			<div><a href="Perfil.jsp"> Mi Perfil </a></div><br>
			<div><a href="PagoDePrestamos.jsp"> Pago de prestamos </a></div><br>
		</div>
	</div>
</body>
</html>