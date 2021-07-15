<%@page import="com.sun.javafx.scene.layout.region.Margins.Converter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import=" java.util.ArrayList" %>
<%@page import="entidades.Prestamo"%>
<%@page import="entidades.Cuenta"%>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>Pago de prestamos</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
</head>
<body>
<div>
<% 
String Usuario = (String) session.getAttribute("Usuario");
%>

Usuario:<%out.print(Usuario); %>
<br>

<h1 align="Center">Pago de Prestamos<br></h1>
<br>
<br>
</div>
<br>
<a href="${pageContext.request.contextPath}/ServletMenu?IraMenuUsu=1" class="badge badge-secondary"> Volver al menu</a><br>
<br><br>

<script type="text/javascript">
	$(document).ready(function() {
		$('#table_id').DataTable();
	});
</script>



<div style="float: left; padding-left: 50px" >
	<table id="table_id" class="display">
		<thead>
			<tr>
				<th>Idprestamo</th>
				<th>ImporteaPagar</th>
				<th>CantCuotas</th>
				<th>MontoMensual</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<% 
				if(request.getAttribute("listaPrestamos")!=null){
					ArrayList<Prestamo> ap = (ArrayList) request.getAttribute("listaPrestamos");
					for(Prestamo p : ap){
			%>
						<tr>
							<th><%= p.getIdPrestamo() %></th>
							<th><%= p.getImporteaPagar() %></th>
							<th><%= p.getCantCuotas() %></th>
							<th><%= p.getMontoMensual() %></th>
							<th> <input type="submit" name="btnSeleccionar" value="Seleccionar"
							onclick="window.location.href='${pageContext.request.contextPath}/ServletPagoPrestamo?Seleccionar=1&Id=<%=p.getIdPrestamo()%>'"></th>
						</tr>
			<%			}
					} %>
		</tbody>
	</table>
</div>
<form action="${pageContext.request.contextPath}/ServletPagoPrestamo?action=LIST" method="post">
<% Prestamo hidden = new Prestamo();
 if(request.getAttribute("PrestamoElegido")!=null) {
	hidden = (Prestamo) request.getAttribute("PrestamoElegido");
	
}

%> <input type="hidden" name="hiddenId" value="<%= hidden.getIdPrestamo()  %>">
<div style="float: left; padding-left: 50px;" >
	<b>Cuentas: </b>
	<ul>
		<% if(request.getAttribute("listaCuentas")!=null){ 
			ArrayList<Cuenta> ac = (ArrayList) request.getAttribute("listaCuentas");
				for(Cuenta c : ac){%>
					<li><%= "CBU : "+c.getCBU()+", Saldo: "+c.getSaldo() %></li>
					
		<% 		}
			}%>
	</ul>
	<% if(request.getAttribute("PrestamoElegido")!=null){ 
		int cantcuotas = Integer.parseInt(request.getAttribute("CantCuotas").toString());	
	%><table class="border border-dark">
		<tr class="border border-dark"> 
			<th align="left">Prestamo Seleccionado :</th> 
			<th  align="left"><%= hidden.getIdPrestamo() %> </th> 
		</tr>
		<tr class="border border-dark">
			<th  class="border border-dark" align="left">Cantidad de Cuotas:</th> 
			<th  align="left"> <select name="ddlCuotas" style="width: 46px; ">
								<% for(int i=1;i<=cantcuotas;i++){ %>
									<option value="<%=i%>"> <%= i %> </option>
									<% }%>
								</select>		
			</th>
		</tr>
		<tr class="border border-dark">
			<th class="border border-dark"  align="left">	Cbu : </th> 
			<th  align="left"> 
				<select name="ddlCbu" style="width: 46px; ">
				<% ArrayList<Cuenta> ac = (ArrayList) request.getAttribute("listaCuentas");
					for(Cuenta c : ac){
						%>
						<option value="<%= c.getCBU()%>"><%=c.getCBU() %></option>
						<% 
					}
				%>
				</select> 
			</th>
		</tr>
		<tr>
			<th></th>
			<th>
				<input type="submit"  class="btn btn-success"  onclick="return confirm('Esta seguro de pagar esta cuota?')" value="Confirmar" name="btnConfirmar">
			</th>
		</tr>
	</table>
	<% }%>
</div>
	<%if(request.getAttribute("Mensaje")!=null) %><%= request.getAttribute("Mensaje")%><%; %>
	<% if(request.getAttribute("Mensaje2")!=null)%><%= request.getAttribute("Mensaje2") %><%  ;%>
	
	
	
<br><br>


<br>

</form>
</body>
</html>