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
%>

Usuario:<%out.print(Usuario); %>
<br>
<br>
<br>
<form action="MenuUsuario.jsp" method="post">
<div style="table-layout: auto"align="left" >
		<table border=4>
			<tr>
			
				<th align="left">Dni</th>
				<th>456462236</th>
			<tr>
			<tr> 
				<th align="left">CUIL</th>
				<th>24-456462236-8</th>
			</tr>
			<tr> 
				<th align="left">Nombre</th>
				<th> Jorge</th>
			</tr>
			<tr> 
				<th align="left">Apellido</th>
				<th> Diaz</th>
			</tr>
			
			<tr> 
				<th align="left">CBU</th>
				<th>
				2356491253795463254865</th>
		</table>
<input type="submit" name="btnVolver" value="Volver" style="margin-left: 700px">
	</form>
</body>
</html>