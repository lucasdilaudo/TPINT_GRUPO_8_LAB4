<%@page import="java.util.ArrayList"%>
<%@page import="Negocio.NegocioCuenta"%>
<%@page import="entidades.Cuenta"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>Mi Cuenta</title>
</head>

<body>
<% 
String Usuario = (String) session.getAttribute("Usuario");
String dni= (String) session.getAttribute("DNI");

%>

Usuario:<%out.print(Usuario); %>
<br>
	<center><h1 style="color: gray; border: steelblue solid 1px;">Mi cuenta</h1></center>
	<br>
	
	<div  align="center">
	<a href="Inicio.jsp" class="badge badge-danger">Cerrar Sesion</a>
	</div>
	<br>
	<div>
		<div style="padding-left: 10px;
	    padding-top: 10px;
	    margin-left: 57px;
	    margin-bottom: 50px;
	    float: left;
	    position: relative;
	    width: 75%;
	    border: steelblue solid 1px;
	    height: auto;">
		<center>
		<form style = "width: 100%; margin-bottom: 11px;" action="MenuUsuario.jsp" method="get" >
			
			<table style="width: 60%"  border="2">
				 
			    <tr>
			    	<th align="center" class="p-3 mb-2 bg-info text-white">Tipo de Cuenta</th>
			    	<th align="center" class="p-3 mb-2 bg-info text-white">Moneda</th>
			    	<th align="center" class="p-3 mb-2 bg-info text-white" width="60%">Nro de Cuenta</th>
			    	<th align="center" class="p-3 mb-2 bg-info text-white" width="60%">Saldo</th>
			    </tr>
			  <%if(request.getAttribute("Cuentas")!=null){
				  ArrayList<Cuenta> ac = (ArrayList) request.getAttribute("Cuentas");
				  for(Cuenta c : ac){
				  %>  
			    <tr>
			    <%
			    	if (c.getTipoDeCuenta()==1){
			    		%>
			    		<td align="center" width="30%"> Caja de ahorros </td>
			    		<%
			    	}else{
			    		%>
			    		<td align="center" width="30%"> Cuenta Corriente </td>
			    		<%
			    	}
			    %>
		    		
					<td align="center" width="20%"> Pesos </td>
					<td align="center" width="30%"> <%=c.getNroCuenta() %> </td>
					<td align="center" width="20%"> <%=c.getSaldo() %> </td>
				</tr>
				<% 
				
				  }} %>
			</table>
		
		</form>
		</center>
		</div>
		<div  style="padding-top: 10px;
		    padding-left: 10px;
		    margin-left: 10px;
		    position: relative;
		    float: left;
		    width: 15%;
		    border: steelblue solid 1px;
		    height: auto;">
			<div><a href="${pageContext.request.contextPath}/ServletMenu?IraMovimientos=<%out.print(dni);%>"> Historial de movimientos </a></div><br>
			<div><a href="${pageContext.request.contextPath}/ServletMenu?IraTransferencia=<% out.print(dni);%>"> Hacer Transferencia </a></div><br>
			<div><a href="${pageContext.request.contextPath}/ServletMenu?IraPrestamos=<% out.print(dni);%>">Solicitar Prestamo</a></div><br>
			<div><a href="${pageContext.request.contextPath}/ServletMenu?IraPerfil=1"> Mi Perfil </a></div><br>
			<div><a href="${pageContext.request.contextPath}/ServletMenu?IraPago=1"> Pago de prestamos </a></div><br>
		</div>
		<br>
	</div>
	
</body>
</html>