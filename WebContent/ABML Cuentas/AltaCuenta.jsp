<%@page import="com.sun.webkit.ContextMenu.ShowContext"%>
<%@page import="javax.sound.midi.SysexMessage"%>
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
<% 
String Usuario = (String) session.getAttribute("Usuario");
%>

Usuario:<%out.print(Usuario); %>
<br>
	
	<center><h1 style="color: gray; border: steelblue solid 1px;">ALTA CUENTA</h1></center><br><a href="${pageContext.request.contextPath}/MenuAdmin.jsp?action=LIST"> Volver al menu</a><br><br>
	
	<form action="${pageContext.request.contextPath}/ServletCuenta?action=LIST" method="get">
	<div style="table-layout: auto" align="center">
		<table>
			<tr>

				<th align="left">N° de Cuenta</th>
				<th><input type="text" name="txtNrodeCuenta" required pattern="[0-9]+" title="Solo se permiten Numeros"></th>
			<tr>
			<tr>
				<th align="left">CBU</th>
				<th><input type="text" name="txtCBU" required pattern="[0-9]+" title="Solo se permiten Numeros"></th>
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
				<th><input type="text" name="txtDni" required pattern="[0-9]+" title="Solo se permiten Numeros"></th>
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

if(request.getAttribute("Mensaje")!=null){

		%>
		<br>
		<br>
		<%=
		request.getAttribute("Mensaje") %>
		
	<%
}








%>	
	</div>
	</form>	
	
</body>
</html>