<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Movimiento" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Movimientos</title>
</head>
<body>
<% 
String Usuario = (String) session.getAttribute("Usuario");
%>

Usuario:<%out.print(Usuario); %>
<br>
	<h1 style="padding-left: 120px; color: gray; border: steelblue solid 1px;">Utimos Movimientos</h1>

	<form action="MenuUsuario.jsp" method="post">
		<table id="table_id" class="display">
		<thead>	
			<tr>
			    <th>ID</th>			
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
				<th><%= m.getIdMovimiento() %></th>	
				<th><%= m.getDetalle() %></th>	
				<th><%= m.getImporte() %></th>	
				<th><%= m.getTipoMovimiento() %></th>	
				<th><%= m.getCbuOrigen()%></th>	
				<th><%= m.getCbuDestino()%></th>	
							
				
			</tr>
			
			<%}} 
			
			%>
		
		</tbody>
</table>
		<input type="submit" name="btnVolver" value="Volver" style="margin-left: 700px">
	</form>

</body>
</html>