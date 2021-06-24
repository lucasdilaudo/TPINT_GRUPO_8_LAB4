<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transferencias</title>
</head>
<body>
<h1 style="color: gray; border: steelblue solid 1px;">Transferir</h1>
<br>
<br>
<br>
<form action="MenuUsuario.jsp" method="post">
<b>Ingrese CBU:</b>
<input type="text" name="txtCBU"/>
<br>
<br>
<b>¿Cuanto quiere transferir?</b>
<input type="text" name="txtImporte"/>
<br>
<br>
<b>Motivo</b>
<select name="Motivo">
<option>Varios</option>
</select>
<br>
<br>
<b>Referencia:</b>
<input type="text" name="txtReferencia"/>
<br>
<br>
<input type="submit" name="btnTransferir" value="Realizar Transferencia">
<br>
<input type="submit" name="btnVolver" value="Volver" style="margin-left: 700px">
	</form>
</body>
</html>