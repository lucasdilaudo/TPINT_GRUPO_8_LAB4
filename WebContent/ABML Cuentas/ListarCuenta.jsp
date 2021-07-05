<%@page import="Negocio.NegocioCliente"%>
<%@page import="entidades.Cliente"%>
<%@page import="Negocio.NegocioCuenta"%>
<%@page import="entidades.Cuenta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Listar Cuentas</title>
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
<% 
String Usuario = (String) session.getAttribute("Usuario");
%>

Usuario:<%out.print(Usuario); %>
<br>

<h1 align="Center">Listar Cuentas</h1>
<a href="${pageContext.request.contextPath}/MenuAdmin.jsp?action=LIST"> Volver al menu</a>
<br>
<br>

	<table id="table_id" class="display">
		<thead>
			<tr>
				<th>Nro de Cuenta</th>			
				<th>CBU</th>	
				<th>Dni</th>	
				<th>Nombre de Usuario</th>	
				<th>Tipo de Cuenta</th>
				<th>Fecha de Creacion</th>
				<th>Saldo</th>		
				<th></th>
				<th></th>
				
			</tr>
	
	</thead>


	<tbody>
	
		
		<%
			if(request.getAttribute("ListadeCuentas")!=null) {
				ArrayList<Cuenta> ac = (ArrayList) request.getAttribute("ListadeCuentas");
				for(Cuenta c : ac){
		%>
			<tr>
			
			
					<th><%= c.getNroCuenta() %> </th>	
					<th><%= c.getCBU() %></th>	
					<th><%= c.getDNICliente() %></th>	
					<th></th>	
					<% if(c.getTipoDeCuenta()==1){%>
						<th>Caja de Ahorro </th>	
					<%}  else {%>
						<th>Cuenta Corriente </th>
					<%} %>
					<th><%= c.getFechaCreacion() %> </th>	
					<th><%= c.getSaldo() %> </th>
					
					<th> <input type="submit" value="Eliminar" name="btnBajaCuenta" 
					onclick="window.location.href='${pageContext.request.contextPath}/ABML Cuentas/ConfirmarBajaCuenta.jsp?CBU=<%=c.getCBU()%>&NrodeCuenta=<%= c.getNroCuenta() %>'"></th>
					<th> <input type="submit" value="Modificar" name="btnModCuenta"
					onclick="window.location.href='${pageContext.request.contextPath}/ServletCuenta?CBU=<%=c.getCBU()%>&NrodeCuenta=<%= c.getNroCuenta() %>&IraMod=1'"></th>	
	
			</tr>
			<%
				}
			} %>
		
		</tbody>

	</table>

	

	
</body>
</html>