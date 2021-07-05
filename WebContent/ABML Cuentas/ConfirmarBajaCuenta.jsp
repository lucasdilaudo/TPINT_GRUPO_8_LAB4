<%@page import="Negocio.NegocioCliente"%>
<%@page import="entidades.Cliente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirmar Baja</title>
</head>
<body>
<% 
String Usuario = (String) session.getAttribute("Usuario");
%>

Usuario:<%out.print(Usuario); %>
<br>
<h1 align="center">Confirmar</h1>
<br>
<form action="${pageContext.request.contextPath}/ServletCuenta?action=LIST" method="post">



<div align="center">
<!-- el if es para que desaparezcan los controles una vez se haya confirmado la baja -->
<% if(request.getAttribute("ConfirmarEliminado")==null){ %>
				 ¿Esta seguro que desea dar de baja esta Cuenta?<br><br>
				Nro de Cuenta: <%= request.getParameter("NrodeCuenta") %> 
				 CBU: <%= request.getParameter("CBU") %> Nombre del Usuario:  <%= request.getParameter("Nombre") %>  <br><br>
				 <input type="submit" name="ConfirmarBajaSi" value="Dar de Baja" style=" width: 123px">
				
				<br>
				<br>
				<!-- guardar los datos dentro de un hidden para conservar los valores y enviarlos al servley -->
				<input type=hidden value=<%= request.getParameter("CBU") %> name="hiddenCBU">
				<input type=hidden value=<%= request.getParameter("NrodeCuenta") %> name="hiddenNrodeCuenta">

<%
}
	if(request.getAttribute("ConfirmarEliminado")!=null){	
		boolean eliminado = (boolean) request.getAttribute("ConfirmarEliminado");	
		
		if(eliminado){
			%>
			
			Usuario Eliminado Con Exito
			
			
		<% 
		}
		
	}
	
	
	
 %>
 <br><br>
 <a href="${pageContext.request.contextPath}/ServletCuenta?action=LIST&IraListar=1">Volver a Listar Cuentas</a>
 
<br>
</div>
</form>
</body>
</html>