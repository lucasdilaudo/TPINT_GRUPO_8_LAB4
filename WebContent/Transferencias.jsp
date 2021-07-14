<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import=" java.util.ArrayList" %>
<%@page import="entidades.Cuenta"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transferencias</title>
</head>
<body>
<h1 style="color: gray; border: steelblue solid 1px;">Transferir</h1>
<% 
String Usuario = (String) session.getAttribute("Usuario");
String dni=(String) session.getAttribute("DNI");
%>

Usuario:<%out.print(Usuario); %>
<br>
<br>
<a href="${pageContext.request.contextPath}/ServletMenu?IraMenuUsu=1"> Volver al menu</a>
<br>
<br>
<form action="${pageContext.request.contextPath}/ServletTransferencia?action=LIST" method="post">
<b>Elija que numero de cuenta debitara:</b>
<select name="ddlNroDeCuenta">
<option value="0">Elija una cuenta</option>
<%
	if(request.getAttribute("listaCuentas")!=null){
		ArrayList<Cuenta> ac = (ArrayList) request.getAttribute("listaCuentas");
		//request.removeAttribute("listaCuentas");
			for(Cuenta c : ac){
				%>
				<option value="<%= c.getCBU() %>"><% out.print(c.getNroCuenta()+"- Saldo: $"+c.getSaldo()); %></option>
				<%
			}
	}
	

	
	
	
 %>
</select>
<br>
<br>
<b>¿Cuanto quiere transferir?</b>
<input type="text" name="txtImporte" required pattern="[0-9]+(\.[0-9][0-9]?)?" title="Solo se permiten numeros con decimales"/>
<br>
<br>
<b>Motivo</b>
<select name="Motivo">
	<option value="">-- Seleccione un motivo --</option>
	<option value="Alquileres">Alquileres</option>
	<option value="Cuota">Cuota</option>
	<option value="Expensas">Expensas</option>
	<option value="Factura">Factura</option>
	<option value="Honorarios">Honorarios</option>
	<option value="varios">Varios</option>
</select>
<br>
<br>
<b>Ingrese CBU destinatario:</b>
<input type="text" name="txtCbuDestino" required pattern="[0-9]+" title="Solo se permiten numeros"/>
<br>
<br>
<input type="submit" name="btnTransferir" value="Realizar Transferencia">
<input type="hidden" name="hiddenDni" value="<%out.write(dni);%>">
<br>
	</form>
	<% if(request.getAttribute("Mensaje")!=null)%><%= request.getAttribute("Mensaje") %><%  ;%>
</body>
</html>