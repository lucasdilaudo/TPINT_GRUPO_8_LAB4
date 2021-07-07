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
<% 
String Usuario = (String) session.getAttribute("Usuario");
%>

Usuario:<%out.print(Usuario); %>
<br>
<br>
<br>
<br>
<form action="${pageContext.request.contextPath}/ServletTransferencia?action=LIST" method="post">
<b>Elija que numero de cuenta debitara:</b>
<select name="ddlNroDeCuenta">
<option value="0">Elija una cuenta</option>
	<% if(request.getAttribute("CantCuentas")!=null){
		int cantcuentas = Integer.parseInt(request.getAttribute("CantCuentas").toString());
		for(int i=1;i<=cantcuentas;i++){
			%><option value="<%=i%>"><%=i %></option><% 			
		}
		
	}
	
	%>
</select>
<br>
<br>
<b>¿Cuanto quiere transferir?</b>
<input type="text" name="txtImporte"/>
<br>
<br>
<b>Motivo</b>
<select name="Motivo">
<option value="varios">Varios</option>
</select>
<br>
<br>
<b>Ingrese CBU destinatario:</b>
<input type="text" name="txtCbuDestino"/>
<br>
<br>
<input type="submit" name="btnTransferir" value="Realizar Transferencia">
<br>
<input type="submit" name="btnVolver" value="Volver" style="margin-left: 700px">
	</form>
</body>
</html>