<%@page import="Negocio.NegocioCuenta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Negocio.NegocioCliente"%>
<%@page import="entidades.Cliente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>Perfil</title>
</head>
<body>
<h1 style="color: gray; border: steelblue solid 1px;">Mi perfil</h1>
<% 
String Usuario = (String) session.getAttribute("Usuario");
String DNI= (String) session.getAttribute("DNI");

%>

Usuario:<%out.print(Usuario); %><br>

<br>
<br>
<br>
<form action="${pageContext.request.contextPath}/ServletMenu?IraMenuUsu=1" method="post">
<div style="table-layout: auto"align="left" >
	<table id="table_id" class="display" border="1">
		<thead>	
			<tr>
				<th class="p-3 mb-2 bg-info text-white">DNI</th>			
				<th class="p-3 mb-2 bg-info text-white">Nombre</th>	
				<th class="p-3 mb-2 bg-info text-white">Apellido</th>
				<th class="p-3 mb-2 bg-info text-white">Cuil</th>	
				<th class="p-3 mb-2 bg-info text-white">Direccion</th>	
				<th class="p-3 mb-2 bg-info text-white">Localidad</th>
				<th class="p-3 mb-2 bg-info text-white">Correo</th>
				<th class="p-3 mb-2 bg-info text-white">Usuario</th>
			
			</tr>
		</thead>
		<tbody>
		<% 
		Cliente c = (Cliente) request.getAttribute("Cliente");
		
			
			 %>
			<tr>
				<th><%out.print(c.getDni());%></th>	
				<th><%out.print(c.getNombre());%></th>
				<th><%out.print(c.getApellido());%></th>	
				<th><%out.print(c.getCUIL());%></th>	
				<th><%out.print(c.getDireccion()); %></th>	
				<th><%out.print(c.getLocalidad()); %></th>	
				<th><%out.print(c.getCorreo());%></th>	
				<th><%out.print(c.getUsuario());%></th>
				
			</tr>
			
		</tbody>
	
	
	</table>
	</div>
	<br>
	
	<div  align="center">
<input type="submit"  class="btn btn-primary" name="btnVolver" value="Volver"/>
</div>
</form>
</body>
</html>