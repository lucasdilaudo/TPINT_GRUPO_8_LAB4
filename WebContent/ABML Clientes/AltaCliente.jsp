<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>Alta Cliente</title> 
</head>
<body>
<% 
String Usuario = (String) session.getAttribute("Usuario");
%>

Usuario:&nbsp;<%out.print(Usuario); %>
<br>
	<h1 align="center">Alta Clientes</h1> 
	<a href="${pageContext.request.contextPath}/MenuAdmin.jsp?action=LIST" class="badge badge-secondary"> Volver al menu</a>
	
		<form action="${pageContext.request.contextPath}/ServletCliente?action=LIST" method="get">
		
	<div align="center">
		<table>
			<tr>
			
				<th align="left">Dni</th>
				<th><input type="text" name="txtDni" required pattern="[0-9]+" title="Solo se permiten Numeros"> </th>
			<tr>
			<tr> 
				<th align="left">CUIL</th>
				<th><input type="text" name="txtCuil" required pattern="[0-9]+" title="Solo se permiten Numeros"> </th>
			</tr>
			<tr> 
				<th align="left">Nombre</th>
				<th><input type="text" name="txtNombre" required pattern="[a-zA-Z]+" title="Solo se permiten Letras"> </th>
			</tr>
			<tr> 
				<th align="left">Apellido</th>
				<th><input type="text" name="txtApellido" required pattern="[a-zA-Z]+" title="Solo se permiten Letras"> </th>
			</tr>
			<tr> 
				<th align="left">Sexo</th>
				<th><select name="ddlSexo">
					<option value=1>Femenino</option>
					<option value=2>Masculino</option> 
					</select></th>
			</tr>
			<tr> 
				<th align="left">Nacionalidad</th>
				<th><input type="text" name="txtNacionalidad" required pattern="[a-zA-Z_ ]+" title="Solo se permiten Letras">
				</th>
			<tr> 
				<th align="left">Fecha </th>
				<th><input size="3" type="text" name="txtDia" required pattern="[0-9]+" title="Solo se permiten Numeros">
					<input size="3" type="text" name="txtMes" required pattern="[0-9]+" title="Solo se permiten Numeros">
					<input size="3" type="text" name="txtAnio" required pattern="[0-9]+" title="Solo se permiten Numeros"> 
					</th>
			</tr>
			<tr> 
				<th align="left">Direccion</th>
				<th><input type="text" name="txtDireccion">
				</th>
			<tr> 	
			<tr> 
				<th align="left">Localidad</th>
				<th><input type="text" name="txtLocalidad" required pattern="[a-zA-Z_ ]+" title="Solo se permiten Letras">
				</th>
			<tr> 
			<tr> 
				<th align="left">Provincia</th>
				<th><input type="text" name="txtProvincia" required pattern="[a-zA-Z_ ]+" title="Solo se permiten Letras">
				</th>
			<tr> 
			<tr> 
				<th align="left">Correo</th>
				<th><input type="email" name="txtCorreo" required>
				</th>
			<tr> 
			<tr> 
				<th align="left">Telefono</th>
				<th><input type="text" name="txtTelefono" required pattern="[0-9]+" title="Solo se permiten Numeros">
				</th>
			<tr> 
			<tr> 
				<th align="left">Usuario</th>
				<th><input type="text" name="txtUsuario" required>
				</th>
			<tr> 
				<tr> 
				<th align="left">Contrase???a</th>
				<th><input type="password" name="txtContrasenia" required>
				</th>
			<tr> 
			<tr> 
				<th align="left">Tipo de Usuario</th>
				<th><select name="ddlTipodeusuario">
					<option value=1>Admin</option>
					<option value=2>Cliente</option> 
					</select></th>
			</tr>
		</table>
			
		
		
	
	</div>

<div align="center">
<br>
<input type="submit" name="btnguardarCliente" value="Guardar Cliente"  class="btn btn-success">
<% 
 


if(request.getAttribute("Mensaje")!=null){
	

		%>
		<br>	
		
		<%=request.getAttribute("Mensaje") %>
		
		
	<%}


%>	

</form>
</div>

</body>
</html>