<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modificar Cuenta</title>
</head>
<body>
<% LocalDate fecha = LocalDate.now(); %>
	Usuario: 

	<br>
	<h1 align="center">Modificar  Cuenta</h1>
	<div style="table-layout: auto" align="center">
		<table>
			<tr>

				<th align="left">N° de Cuenta</th>
				<th>123</th>
				<tr>
			<tr>
				<th align="left">CBU</th>
				<th>1312</th>
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
				<th><input type="text" name="txtSaldo"></th>
		

		</table>




	</div>
<br>
	<div align="center">
		<input type="submit" name="modificarCuenta" value="Modificar Cuenta">
	</div>
</body>
</html>