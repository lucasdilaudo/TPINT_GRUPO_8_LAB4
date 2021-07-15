<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>Inicio</title>
</head>
<body>
	<center><b><h1 style="color: gray; border: steelblue solid 1px;">BIENVENIDOS AL BANCO</h1></b></center>
	<br>
	<br>
	<br>
	<center><form action="${pageContext.request.contextPath}/ServletInicio?action=LIST" method="post">
		
		<table border="0">
			<tr>
				<td width="50%">DNI:</td>
				<td width="50%"><input type="text" name="txtDNI" required pattern="[0-9]+" title="Solo se permiten Numeros"></td>
				
			</tr>
			 
		    <tr>
				<td width="50%">Usuario:</td>
				<td width="50%"><input type="text" name="txtUsuario" required></td>
				
			</tr>
			 
			<tr>
				<td width="50%">Contrase�a:</td>
				<td width="50%"><input type="password" name="txtContrase�a" required></td>
				
			</tr>
		    <tr>
		    	
				<td width="50%"></td>
				<td width="50%" align="center"><input type="submit" name="btnIngresar" value="Ingresar" class="btn btn-primary"> </td>
				
			</tr>
		</table>
		

<% 
 


if(request.getAttribute("Mensaje")!=null){
	

		%>
		<br>	
		
		<%=request.getAttribute("Mensaje") %>
		
		
	<%}


%>	
	
	
		
		
	
	
	</form></center>
</body>
</html>