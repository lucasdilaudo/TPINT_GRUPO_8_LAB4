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
		<table border="4">
		
		<tr><th style="width: 100px;">Fecha</th> <th style="width: 300px;">Concepto</th> <th style="width: 100px;">Importe</th></tr>
		</table>
		<input type="submit" name="btnVolver" value="Volver" style="margin-left: 700px">
	</form>

</body>
</html>