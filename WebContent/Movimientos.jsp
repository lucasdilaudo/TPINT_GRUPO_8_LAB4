<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Movimiento" %>
<%@page import="entidades.Cuenta"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Movimientos</title>

<style>
	table{
		
		text-align: center;
		width: 60%
	}
	th, td{
		padding: 10px;
	}
	tr:nth-child(even){
		background-color: #ddd;
	}
	thead{
		background-color: grey;
		border-bottom: solid 5px #0F362D;
		color: white;
	}
	a:hover{
		font-size: 1.1em;
	}
	
</style>


</head>
<body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#table_id').DataTable();
	});
</script>
<% 
String Usuario = (String) session.getAttribute("Usuario");
String DNI = (String) session.getAttribute("DNI");
%>

Usuario:<%out.print(Usuario); %>
<br>
	<h1 style="padding-left: 120px; color: gray; border: steelblue solid 1px;">Utimos Movimientos</h1>
<a href="${pageContext.request.contextPath}/ServletMenu?IraMenuUsu=1"> Volver al menu</a><br><br>
	<form action="${pageContext.request.contextPath}/ServletMovimiento" method="post">
	Seleccione un CBU: <select name="ddlCbu">
<%
	if(request.getAttribute("listaCbu")!=null){
		ArrayList<Cuenta> ac = (ArrayList) request.getAttribute("listaCbu");
		//request.removeAttribute("listaCuentas");
			for(Cuenta c : ac){
				%>
				<option value="<% out.write(c.getCBU()); %>"><% out.print(c.getCBU()); %></option>
				<%
			}
	}
 %>
 </select>
 <input type="submit" name="btnFiltrar" value="Filtrar">
 <input type="hidden" name="hiddenDni" value="<%out.write(DNI);%>">
 <input type="submit" name="btnMostrarTodo" value="Mostrar todo"><br><br>
		<table id="table_id" class="display">
		<thead>	
			<tr>
			    <th>Fecha</th>			
				<th>Detalle</th>	
				<th>Importe</th>			
				<th>Tipo de mov</th>	
				<th>CBU origen</th>
				<th>CBU destino</th>
				
				</tr>
		</thead>
		<tbody>
		<% if(request.getAttribute("Movimientos")!=null){
			ArrayList<Movimiento> amov = (ArrayList) request.getAttribute("Movimientos");
			for(Movimiento m : amov){  %>
			<tr>
				<th><%= m.getFecha() %></th>	
				<th><%= m.getDetalle() %></th>	
				<th><%= m.getImporte() %></th>
				<th><% switch(m.getTipoMovimiento()){
							case 1:out.print("Alta de cuenta");
							break;
							case 2:out.print("Alta de un prestamo");
							break;
							case 3:out.print("Pago de prestamo");
							break;
							case 4:out.print("Transferencia");
							break;
							default:out.print(m.getTipoMovimiento());
							break;
						}
					%></th>
				<th><%= m.getCbuOrigen()%></th>	
				<th><%= m.getCbuDestino()%></th>	
							
				
			</tr>
			
			<%}} 
			
			%>
		
		</tbody>
</table>

		
	</form>
<br>
</body>
</html>