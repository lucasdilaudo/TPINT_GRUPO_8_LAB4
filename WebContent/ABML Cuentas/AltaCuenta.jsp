<%@page import="Negocio.NegocioCuenta"%>
<%@page import="Dao.CuentaDao"%>
<%@page import="entidades.Cuenta"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alta Cuenta</title>
</head>
<body>
<% LocalDate fecha = LocalDate.now(); %>
	Usuario:
	<br>
	<h1 align="center">Alta Cuentas</h1>
	
	<form action="${pageContext.request.contextPath}/ServletCuenta?action=LIST" method="get">
	<div style="table-layout: auto" align="center">
		<table>
			<tr>

				<th align="left">N° de Cuenta</th>
				<th><input type="text" name="txtNrodeCuenta"></th>
			<tr>
			<tr>
				<th align="left">CBU</th>
				<th><input type="text" name="txtCBU"></th>
			</tr>
			<tr>
				<th align="left">Tipo de Cuenta</th>
				<th align="left"> <select name="tipodeCuenta">
						<option value="1">Caja de ahorro</option>
						<option value="2">Cuenta corriente</option> 
						</select>
				</th>
			</tr>
			<tr>
				<th align="left">Dni</th>
				<th><input type="text" name="txtDni"></th>
			</tr>
			<tr>
				<th align="left">Fecha de Creacion</th>
				<th><%= fecha.getDayOfMonth()+"/"+fecha.getMonthValue()+"/"+ fecha.getYear() %></th>
			</tr>
			<tr>
				<th align="left">Saldo</th>
				<th>$ 10.000</th>
		

		</table>




	</div>
<br>
	<div align="center">
		<input type="submit" name="btnGuardarCuenta" value="Crear Cuenta">

<% 
 
boolean agregado;

if(request.getAttribute("Agregado")!=null){
	agregado = (boolean) request.getAttribute("Agregado");
	if(agregado){
		%>
		<br>	
		Cuenta agregada con exito!
		
	<%}
}








%>	
	</div>
	</form>	
	
</body>
</html>