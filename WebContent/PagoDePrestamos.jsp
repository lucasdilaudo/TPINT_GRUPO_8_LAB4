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
<title>Pago de prestamos</title>
</head>
<body>
<% 
String Usuario = (String) session.getAttribute("Usuario");
%>

Usuario:<%out.print(Usuario); %>
<br>
<h1 align="Center">Pago de Prestamos</h1>
<br>
<a href="MenuUsuario.jsp">Volver</a>
<br><br>
<form action="${pageContext.request.contextPath}/ServletPagoPrestamo?action=LIST" method="post">
<% Prestamo hidden = new Prestamo();
 if(request.getAttribute("PrestamoElegido")!=null) {
	hidden = (Prestamo) request.getAttribute("PrestamoElegido");
	
}

%> <input type="hidden" name="hiddenId" value="<%= hidden.getIdPrestamo()  %>">
<select name="selectPrestamos">
	<option value="0">Seleccione un prestamo</option>
<%
	
//	if(request.getAttribute("listaCuentas")!=null){
		ArrayList<Prestamo> pre = (ArrayList) request.getAttribute("listaPrestamos");
		//request.removeAttribute("listaCuentas");
			for(Prestamo p : pre){
				%>
				<option value="<%= p.getIdPrestamo() %>"><% out.print(p.getIdPrestamo()); %></option>
				<%
			}
	//}
 %>
</select>
<input type="submit" name="btnIr" value="Ir" style="width: 105px; ">
<br><br>

<table  border="1">
			<tr>
			    <th>Cuenta</th>			
				<th>Cuota N°</th>	
				<th>Importe</th>			
				<th>Pagar</th>
				</tr>
		
		
			<tr>
			<% if(request.getAttribute("CantCuotas")!=null){
				int cantcuotas = Integer.parseInt(request.getAttribute("CantCuotas").toString());
				double precio = Double.parseDouble(request.getAttribute("PrecioCuota").toString());
				for(int i=1;i<=cantcuotas;i++){
			 %>
				<td>
				<% if(i==1){ %>
					<select name="ddlCBU">
 <option value="0">-Seleccione un CBU-</option>
<%
	if(request.getAttribute("listaCuentas")!=null){
		ArrayList<Cuenta> ac = (ArrayList) request.getAttribute("listaCuentas");
		//request.removeAttribute("listaCuentas");
			for(Cuenta c : ac){
				%>
				<option value="<%= c.getCBU() %>"><% out.print(c.getCBU()); %></option>
				<%
			}
	}
 %>
 </select>
 	<%} %>
				</td>	
				<td><%= i %></td>	
				<td><%= precio %></td>			
				<td> <input type="checkbox" name="chk<%=i%>"> </td>
			</tr>
	
			<% }}%>

</table>
<br>
<input type="submit" name="btnConfirmar" value="Confirmar">
</form>
</body>
</html>