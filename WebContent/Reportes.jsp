<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reportes</title>
</head>
<body>
<% 
String Usuario = (String) session.getAttribute("Usuario");
%>

Usuario:<%out.print(Usuario); %>
<br>
<center><h1 style="color: gray; border: steelblue solid 1px;">REPORTES</h1></center>
<a href="${pageContext.request.contextPath}/MenuAdmin.jsp?action=LIST"> Volver al menu</a>
<br>	  
<div  style="padding-left: 10px;
		    margin-left: 10px;
		    position: left;
		    float: left;
		    width: 377px;
		
		    height: auto;">
	
 <br><form action="${pageContext.request.contextPath}/ServletReportes?action=LIST" method="post">
		  Monto  total por mes<br>
		  Seleccionar Año: <input type="text" name="txtAnio" required pattern="[0-9]+">
		 <input type="submit" name="btnBuscar1" value="Buscar"><br>
		</form>
		<br>
		<form action="${pageContext.request.contextPath}/ServletReportes?action=LIST" method="post">
			Clientes que mas solicitaron prestamos: <br>
			<input type="text" placeholder="Fecha Inicio" name="fechaInicio" style="width: 109px; " required pattern="\d{1,2}/\d{1,2}/\d{4}" title="d/m/a"> 
			<input type="text" placeholder="Fecha Fin" name="fechaFin" style="width: 109px; " required pattern="\d{1,2}/\d{1,2}/\d{4}" title="d/m/a">
			<input type="submit" value="Buscar" name="btnBuscar2"><br>
			<% if(request.getAttribute("Mensaje2")!=null)%><%= request.getAttribute("Mensaje2") %><%  ;%>
		</form>
		<br><input type="submit" name="btnDeudores" value="Deudores"><br>
				
		<br><br>
		
		<br><br>
		
		</div>
		
					
			<%!	private void cargarmontopormes(){
				%>	<% 	if(request.getAttribute("Tablamontopormes")!=null){
						
						ArrayList<String[]> ar = (ArrayList) request.getAttribute("Tablamontopormes");
						
						%>
							<table border="1">
								<tr>
									<th>Mes</th>
									
									<th>Monto recibido <br>por Usuarios</th>
									<th>Monto dado<br> a usuarios</th>
									<th style="width: 106px; ">Balance</th>
									
								</tr>
						
						<%
						for(String[] campos : ar){
				%>
							<tr>
								<th><%=campos[0]%></th>
								<th><%=campos[1]%></th>
								<th><%=campos[2]%></th>
								<th style="width: 106px; "><%=campos[3]%></th>
							</tr>
							
				
				<%			}			
						}%></table>
				<%!
			}
			 %>
			
			<%!	private void cargarClientesquemaspidierion(){
				%>	<% 	if(request.getAttribute("Tablaclientesquemaspidieron")!=null){
						
						ArrayList<String[]> ar = (ArrayList) request.getAttribute("Tablaclientesquemaspidieron");
						%>
							<table border="1">
								<tr>
									<th>Dni</th>
									<th>Nombre</th>
									<th>Monto pedido</th>
									<th>Prestamos<br>solicitados</th>
									<th>Prestamos<br>aceptados</th>
									<th>Prestamos<br>rechazados</th>
								</tr>
						
						<%
						for(String[] campos : ar){
				%>
							<tr>
								<th><%=campos[0]%></th>
								<th><%=campos[1]%></th>
								<th><%=campos[2]%></th>
								<th><%=campos[3]%></th>
								<th><%=campos[4]%></th>
								<th><%=campos[5]%></th>
								
							</tr>
							
				
				<%			}			
						}%></table>
				<%!
			}
			 %>
			
			
</body>
</html>