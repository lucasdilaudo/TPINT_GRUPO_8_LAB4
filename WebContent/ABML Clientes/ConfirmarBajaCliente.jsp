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
<form action="${pageContext.request.contextPath}/ServletCliente?action=LIST" method="post">
<% if(request.getAttribute("ConfirmarEliminado")==null){ %>
<div align="center"> ¿Esta seguro que desea dar de baja este cliente?
<br><br>
Dni:<%= request.getParameter("DNI") %>  Nombre:<%= request.getParameter("Nombre") %> 
<br><br>
<input type="submit" name="ConfirmarSi" value="Si" style=" width: 82px">

<input type=hidden value=<%= request.getParameter("DNI") %> name="hiddenDNI">
<br>
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
 <a href="${pageContext.request.contextPath}/ABML Clientes/ListarCliente.jsp?action=LIST">Volver a Listar Clientes</a>
</div>
</form>
</body>
</html>