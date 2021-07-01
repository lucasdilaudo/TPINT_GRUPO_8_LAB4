<%@page import="Negocio.NegocioCuenta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Negocio.NegocioCliente"%>
<%@page import="entidades.Cliente"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.sun.javafx.scene.layout.region.Margins.Converter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Listar Cliente</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

</head>
<body>

<script type="text/javascript">
	$(document).ready(function() {
		$('#table_id').DataTable();
	});
</script>
</head>
<body>
Usuario:
<br>
<h1 align="Center">Listar Clientes</h1>
<a href="${pageContext.request.contextPath}/MenuAdmin.jsp?action=LIST"> Volver al menu</a><br><br>

	<table id="table_id" class="display">
		<thead>	
			<tr>
				<th>DNI</th>			
				<th>Nombre Completo</th>	
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
		<% ArrayList<Cliente> ac = NegocioCliente.ObtenerTodo();
		
			for(Cliente c : ac){
			 %>
			<tr>
				<th><%= c.getDni() %></th>	
				<th><%= c.getNombre()+" "+c.getApellido() %></th>	
				<th><%= c.getCUIL() %></th>	
				<th><%= c.getDireccion() %></th>	
				<th><%= c.getLocalidad() %></th>	
				<th><%=c.getCorreo() %></th>	
				<th><%= c.getUsuario() %></th>
				<th> <input type="submit" value="Eliminar" name="btnBajaCliente"
				onclick="window.location.href='ConfirmarBajaCliente.jsp?DNI=<%=c.getDni()%>&Nombre=<%=c.getNombre()%>'"> </th>
				<th> <input type="submit" value="Modificar" name="btnModCliente"
				onclick="window.location.href='ModificarCliente.jsp?DNI=<%=c.getDni()%>'"> </th>
			</tr>
			<%} %>
		</tbody>
	
	
	</table>




</body>
</html>