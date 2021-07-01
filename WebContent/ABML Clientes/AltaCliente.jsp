<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
Usuario:
<br>
	<h1 align="center">Alta Clientes</h1>
	
	<form action="${pageContext.request.contextPath}/ServletCliente?action=LIST" method="get">
	<div style="table-layout: auto" align="center">
		<table>
			<tr>
			
				<th align="left">Dni</th>
				<th><input type="text" name="txtDni"> </th>
			<tr>
			<tr> 
				<th align="left">CUIL</th>
				<th><input type="text" name="txtCuil"> </th>
			</tr>
			<tr> 
				<th align="left">Nombre</th>
				<th><input type="text" name="txtNombre"> </th>
			</tr>
			<tr> 
				<th align="left">Apellido</th>
				<th><input type="text" name="txtApellido"> </th>
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
				<th><input type="text" name="txtNacionalidad">
				</th>
			<tr> 
				<th align="left">Fecha </th>
				<th><input size="3" type="text" name="txtDia">
					<input size="3" type="text" name="txtMes">
					<input size="3" type="text" name="txtAnio"> 
					</th>
			</tr>
			<tr> 
				<th align="left">Direccion</th>
				<th><input type="text" name="txtDireccion">
				</th>
			<tr> 	
			<tr> 
				<th align="left">Localidad</th>
				<th><input type="text" name="txtLocalidad">
				</th>
			<tr> 
			<tr> 
				<th align="left">Provincia</th>
				<th><input type="text" name="txtProvincia">
				</th>
			<tr> 
			<tr> 
				<th align="left">Correo</th>
				<th><input type="text" name="txtCorreo">
				</th>
			<tr> 
			<tr> 
				<th align="left">Telefono</th>
				<th><input type="text" name="txtTelefono">
				</th>
			<tr> 
			<tr> 
				<th align="left">Usuario</th>
				<th><input type="text" name="txtUsuario">
				</th>
			<tr> 
				<tr> 
				<th align="left">Contraseña</th>
				<th><input type="password" name="txtContrasenia">
				</th>
			<tr> 
		</table>
			
<% 
 
boolean agregado;

if(request.getAttribute("Agregado")!=null){
	agregado = (boolean) request.getAttribute("Agregado");
	if(agregado){
		%>
		<br>	
		
		Usuario agregado con exito!
		
		
	<%}
}








%>			
		
	
	</div>

<div align="center">
<input type="submit" name="btnguardarCliente" value="Guardar Cliente">
</form>
</div>

</body>
</html>