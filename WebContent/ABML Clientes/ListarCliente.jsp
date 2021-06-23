<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

</head>
<body>

<script type="text/javascript">
	$(document).ready(function() {
		$('#table_id').DataTable();
	});
</script>
</head>
<body>
Usuario:
<br>
<h1 align="Center">Listar Usuarios</h1>

	<table id="table_id" class="display">
		<thead>	
			<tr>
				<th>DNI</th>			
				<th>Nombre</th>	
				<th>Cuil</th>	
				<th>Direccion</th>	
				<th>Localidad</th>
				<th>Usuario</th>		
			</tr>
		</thead>
		<tbody>
		<% for(int i=1;i<15;i++){ %>
			<tr>
				<th><%= i %></th>	
				<th> Ejemplo</th>	
				<th><%= i*1111 %></th>	
				<th><%= "calle" +122+i %></th>	
				<th> Localidad</th>	
				<th>Ejemplo</th>	
				
				
			</tr>
			<%} %>
		</tbody>
	
	
	</table>




</body>
</html>