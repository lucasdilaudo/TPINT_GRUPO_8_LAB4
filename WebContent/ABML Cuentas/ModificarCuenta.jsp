<%@page import="Negocio.NegocioCuenta"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="entidades.Cuenta" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modificar Cuenta</title>
</head>
<body>
	Usuario: 

	<br>
	<h1 align="center">Modificar  Cuenta</h1>
	
	
<form action="${pageContext.request.contextPath}/ServletCuenta?action=LIST" method="post">
<div style="table-layout: auto" align="center">
	<% Cuenta c = new Cuenta(); //para evitar que llame a obtener cuenta una vez que modifico el registro
		if(request.getAttribute("Mensaje")==null) {
		 c = NegocioCuenta.ObtenerCuenta(request.getParameter("CBU"), request.getParameter("NrodeCuenta"));
		  %>
		<table>
			<tr>

				<th align="left">N° de Cuenta</th>
				<th><%= c.getNroCuenta() %><input type="hidden" value=<%=c.getNroCuenta() %> name="hiddenNrodeCuenta">  </th>
				<tr>
			<tr>
				<th align="left">CBU</th>
				<th><%= c.getCBU() %><input type="hidden" value=<%= c.getCBU() %> name="hiddenCBU"> </th>
			</tr>
			<tr>
				<th align="left">Tipo de Cuenta</th>
				<th align="left"> <select name="selectTipodeCuenta">
						<option value="1">Caja de ahorro</option>
						<option value="2">Cuenta corriente</option> 
						</select>
				</th>
			</tr>
			<tr>
				<th align="left">Dni</th>
				<th><input type="text" name="txtDni" value="<%= c.getDNICliente() %>" required pattern="[0-9]+" title="Solo se permiten Numeros">
				<input type="hidden" name="hiddenDniAntiguo" value="<%= c.getDNICliente()%>">		</th>	
			</tr>
			<tr>
				<th align="left">Fecha de Creacion</th>
				<th><%= c.getFechaCreacion() %></th>
			</tr>
			<tr>
				<th align="left">Saldo</th>
				<th><input type="text" name="txtSaldo" value="<%= c.getSaldo() %>" required pattern="[0-9]+(\.[0-9][0-9]?)?" title="Solo se permiten Numeros con decimales"></th>
		

		</table>




	</div>
<br>
	<div align="center">
		<input type="submit" name="btnModificarCuenta" value="Modificar Cuenta"> 
		<%
		}
			if(request.getAttribute("Mensaje")!=null){
			
				%>
				
					<br><%= request.getAttribute("Mensaje") %>
				
					
				<% 
						
			
				
			
			}
		
		
		
		
		
		 %>
		
			<br> <br>
		
	<a href="${pageContext.request.contextPath}/ABML Cuentas/ListarCuenta.jsp?action=LIST">Volver a Listar Cuenta</a>
	</div>
	
	</form>
</body>
</html>