<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Prestamo" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Autorizacion de prestamos</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

</head>
<body>
<% 
String Usuario = (String) session.getAttribute("Usuario");
%>

Usuario:<%out.print(Usuario); %>
<br>
<script type="text/javascript">
	$(document).ready(function() {
		$('#table_id').DataTable();
	});
</script>
</head>
<br>
<h1 align="Center">Autorizacion de Prestamos</h1><br><br> <a href="${pageContext.request.contextPath}/MenuAdmin.jsp?action=LIST"> Volver al menu</a>
 <% if(request.getAttribute("Mensaje")!=null) %><%=request.getAttribute("Mensaje")%><%  %>
<table id="table_id" class="display">
		<thead>	
			<tr>
			    <th>CBU</th>			
				<th>Fecha</th>	
				<th>Importe solicitado</th>	
				<th>Importe a Pagar</th>		
				<th>Plazo en meses</th>	
				<th>Monto mensual</th>
				<th>Cantidad de cuotas</th>
				<th></th>
				<th></th>
				</tr>
		</thead>
		<tbody>
		<% if(request.getAttribute("Prestamos")!=null){
			ArrayList<Prestamo> ap = (ArrayList) request.getAttribute("Prestamos");
			for(Prestamo p : ap){  %>
			<tr>
				<th><%= p.getCBU() %></th>	
				<th><%= p.getFecha() %></th>	
				<th><%= p.getImportePedido() %></th>
				<th><%= p.getImporteaPagar() %></th>	
				<th><%= p.getPlazo() %></th>	
				<th><%= p.getMontoMensual()%></th>	
				<th><%= p.getCantCuotas()%></th>	
				<th> <input type="submit" value="Rechazar" name="btnRechazarPrestamo"
				onclick="window.location.href='${pageContext.request.contextPath}/ServletPrestamo?Id=<%=p.getIdPrestamo()%>&Rechazar=1'"> </th>
				<th> <input type="submit" value="Aceptar" name="btnAceptarPrestamo"
				onclick="window.location.href='${pageContext.request.contextPath}/ServletPrestamo?Id=<%=p.getIdPrestamo()%>&Aceptar=1'"> </th>
				
			</tr>
			<%}} %>
		</tbody>
</table>

</body>
</html>