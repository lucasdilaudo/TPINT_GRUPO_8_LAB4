<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pago de prestamos</title>
</head>
<body>

<h1 align="Center">Pago de Prestamos</h1>
<br>
<a href="MenuUsuario.jsp">Volver</a>
<br><br>
<select name="listaPrestamos">
	<option value="1">Seleccione un prestamo</option>
	<option value="2">Prestamo 1</option>
	<option value="3">Prestamo 22</option>
</select>
<input type="button" name="btnIr" value="Ir">
<br><br>
<table  border="1">
			<tr>
			    <th>Numero de cuenta</th>			
				<th>Cuota N�</th>	
				<th>Importe</th>			
				<th>Pagar</th>
				</tr>
		
		
			<tr>
				<td>
					<select name="listaCuentas">
						<option value="1">Seleccione una cuenta</option>
						<option value="2">Cuenta 1</option>
						<option value="3">Cuenta 2</option>
						<option value="4">Cuenta 3</option>
					</select>
				</td>	
				<td>1</td>	
				<td>100</td>			
				<td> <input type="checkbox"> </td>
			</tr>
			<tr>
				<td>
					<select name="listaCuentas">
						<option value="1">Seleccione una cuenta</option>
						<option value="2">Cuenta 1</option>
						<option value="3">Cuenta 2</option>
						<option value="4">Cuenta 3</option>
					</select>
				</td>	
				<td>2</td>	
				<td>100</td>			
				<td> <input type="checkbox"> </td>
			</tr>

</table>
<br>
<input type="submit" name="btnConfirmar" value="Comfirmar">

</body>
</html>