<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
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
<div align="center">
<% if(request.getAttribute("ConfirmarEliminado")==null){ %>
 ¿Esta seguro que desea dar de baja este cliente?
<br><br>
Dni:<%= request.getParameter("DNI") %>  Nombre:<%= request.getParameter("Nombre") %> 
<br><br>
<input type="submit" name="ConfirmarSi" value="Si" style=" width: 82px"  class="btn btn-danger">

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
 <a href="${pageContext.request.contextPath}/ServletCliente?IraListar=1" class="badge badge-secondary">Volver a Listar Clientes</a>
</div>
</form>
</body>
</html>