<%@page import="Negocio.NegocioCliente"%>
<%@page import="entidades.Cliente" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modificar Cliente</title>
</head>
<body>
<% 
String Usuario = (String) session.getAttribute("Usuario");
%>

Usuario:<%out.print(Usuario); %>
<br>
<h1 align="center">Modificar Cliente</h1>
<div align="center">
<br>
<br>
<form  action="${pageContext.request.contextPath}/ServletCliente?action=LIST" method="post">
		<% Cliente c = new Cliente();
		if(request.getAttribute("Mensaje")==null) {
		 c = NegocioCliente.ObtenerCliente(request.getParameter("DNI"));
		  %>
	<table>
		<tr>
			<th align="left">DNI</th>
			<th><%= c.getDni() %><input type="hidden" value=<%= c.getDni() %> name="hiddenDniCliente"> </th>
		</tr>
		<tr>
			<th align="left">Nombre</th>
			<th><input type="text" name="txtNombre" value="<%= c.getNombre() %>" required></th>
		</tr>
		<tr>
			<th align="left">Apellido</th>
				<th><input type="text" name="txtApellido" value="<%= c.getApellido() %>" required></th>
		</tr>
		<tr>
			<th align="left">CUIL</th>
			<th><input type="text" name="txtCuil" value="<%= c.getCUIL() %>" required pattern="[0-9]+" title="Solo se permiten Numeros"></th>	
		</tr>
		<tr>
			<th align="left">Direccion</th>
			<th><input type="text" name="txtDireccion" value="<%= c.getDireccion() %>" required></th>
		</tr>
		<tr>
			<th align="left">Localidad</th>
			<th><input type="text" name="txtLocalidad" value="<%= c.getLocalidad() %>" required></th>
		</tr>
		<tr>
			<th align="left">Correo</th>
			<th><input type="email" name="txtCorreo" value="<%= c.getCorreo() %>" required></th>
		</tr>
	</table>

<input type="submit" value="Modificar" name="btnModCliente">

<%
		}
			if(request.getAttribute("Mensaje")!=null){
			
				%>
					<br><%= request.getAttribute("Mensaje") %>
				<% 
			
			}
		 %>
		 <br><br>
		<a href="${pageContext.request.contextPath}/ABML Clientes/ListarCliente.jsp?action=LIST">Volver a Listar Cliente</a>
</form>
</div>




</body>
</html>