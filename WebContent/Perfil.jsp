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
<form action="MenuUsuario.jsp" method="post">
<div style="table-layout: auto"align="left" >
	<table id="table_id" class="display" border="1">
		<thead>	
			<tr>
				<th>DNI</th>			
				<th>Nombre</th>	
				<th>Apellido</th>
				<th>Cuil</th>	
				<th>Direccion</th>	
				<th>Localidad</th>
				<th>Correo</th>
				<th>Usuario</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		<% 
		Cliente c = NegocioCliente.ObtenerCliente(DNI);
		
			
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
				<th> <input type="submit" value="Eliminar" name="btnBajaCliente"
				onclick="window.location.href='ConfirmarBajaCliente.jsp?DNI=<%=c.getDni()%>&Nombre=<%=c.getNombre()%>'"> </th>
				<th> <input type="submit" value="Modificar" name="btnModCliente"
				onclick="window.location.href='ModificarCliente.jsp?DNI=<%=c.getDni()%>'"> </th>
			</tr>
			
		</tbody>
	
	
	</table>
	
<input type="submit" name="btnVolver" value="Volver" style="margin-left: 700px">
	</form>
</body>
</html>