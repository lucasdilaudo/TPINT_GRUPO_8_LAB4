<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1 style="color: gray; border: steelblue solid 1px;">PRESTAMOS</h1>
<% 
String Usuario = (String) session.getAttribute("Usuario");
%>

Usuario:<%out.print(Usuario); %>
<br>
<br>
<br>
<form action="MenuUsuario.jsp" method="post">
<b>Tipo de Prestamo:</b>
 <select name="TipoPrestamo">
 <option>Seleccione un tipo de prestamo</option>
 </select>
 <br>
 <br>
 <b>Plazo en meses:</b>
 <select name="PlazoMeses">
 <option>Seleccione un plazo</option>
 </select>
 <br>
 <br>
 <b>Importe solicitado:</b>
 <input type="text" name="txtImporte"/>
 <br>
 <br>
 <br>
 <input type="submit" name="btnSolicitar" value="Solicitar Prestamo">
 <input type="submit" name="btnVolver" value="Volver" style="margin-left: 700px">
	</form>
</body>
</html>