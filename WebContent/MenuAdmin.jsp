<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Menu Administrador</title>

</head>

<body>
<% 
String Usuario = (String) session.getAttribute("Usuario");
%>

Usuario:<%out.print(Usuario); %>
<br>
<h1 align="center">Menu Administrador</h1>
<br>

<div  style="padding-left: 10px;
		    margin-left: 10px;
		    position: left;
		    float: left;
		    width: 164px;
		
		    height: auto;">
	Gestion de Clientes:
 <br>	<br>	
		 <a href="ABML Clientes/AltaCliente.jsp">Alta Cliente</a><br><br>
		
		<a href="${pageContext.request.contextPath}/ServletCliente?IraListar=1">Listar Clientes</a><br>
		
		</div>
<div  style="padding-left: 10px;
		    margin-left: 10px;
		    position: left;
		    float: left;
		    width: 164px;
		  
		    height: auto;">
	Gestion de Cuentas:
 <br>	<br>	
		 <a href="ABML Cuentas/AltaCuenta.jsp">Alta Cuenta</a><br><br>
		<a href="${pageContext.request.contextPath}/ServletCuenta?action=LIST&IraListar=1">Listar Cuenta</a><br>
		
		
		</div>
		
	<div style="padding-left: 10px;
		    margin-left: 10px;
		    position: left;
		    float: left;
		    width: 164px;"
		    
		    height: auto;">
	<br>
	<br>
		<a href="${pageContext.request.contextPath}/ServletMenu?action=LIST&IraAutorizacion=1">Autorizacion de prestamos </a><br><br>
		<a href="Reportes.jsp">Reportes</a>
		</div>
		<div style="padding-left: 10px;
		    margin-left: 10px;
		    position: left;
		    float: left;
		    width: 164px;"
		    
		    height: auto;">
	<br>
	<br>
		<a href="Inicio.jsp">Cerrar sesión</a>
		</div>
		
		
</body>
</html>