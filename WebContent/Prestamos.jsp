<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import=" java.util.ArrayList" %>
<%@page import="entidades.Cuenta"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1 style="color: gray; border: steelblue solid 1px;">PRESTAMOS</h1>
<% 
String Usuario = (String) session.getAttribute("Usuario");
String DNI = (String) session.getAttribute("DNI");

%>

Usuario:<%out.print(Usuario); %>
<br>
<br>
<br>
<form action="${pageContext.request.contextPath}/ServletPrestamo?action=LIST&DNI=<%out.print(DNI); %>" method="post">
<b>Seleccione un CBU donde se acreditara el prestamo:</b>
 <select name="ddlCBU">
 <option value="0">-Seleccione un CBU-</option>
<%
	if(request.getAttribute("listaCuentas")!=null){
		ArrayList<Cuenta> ac = (ArrayList) request.getAttribute("listaCuentas");
		//request.removeAttribute("listaCuentas");
			for(Cuenta c : ac){
				%>
				<option value="<% out.write(c.getCBU()); %>"><% out.print(c.getCBU()); %></option>
				<%
			}
	}
 %>
 </select>
 <br><br>
<b>Tipo de Prestamo:</b>
 <select name="TipoPrestamo">
 <option value="0">Seleccione un tipo de prestamo</option>
 <option value="1">Credito personal</option>
 </select>
 <br>
 <br>
 <b>Plazo en meses:</b>
 <select name="PlazoMeses">
 <option value="0">Seleccione un plazo</option>
 <option value="1">12 meses</option>
  <option value="2">24 meses</option>
 </select>
 <br>
 <br>
 <b>Importe solicitado:</b>
 <input type="text" name="txtImporte" required pattern="[0-9]+(\.[0-9][0-9]?)?" title="Solo se permiten numeros con decimales"/>
 <br>
 <br>
 <br>
 <input type="submit" name="btnSolicitar" value="Solicitar Prestamo">
 <input type="hidden" name="hiddenDni" value="<%out.write(DNI);%>">
 </form>
 <input type="submit" name="btnVolver" value="Volver" style="margin-left: 700px" onclick="window.location.href='${pageContext.request.contextPath}/ServletMenu?IraMenuUsu=1'">
 <% 
 


if(request.getAttribute("Mensaje")!=null){
	

		%>
		<br>	
		
		<%=request.getAttribute("Mensaje") %>
		
		
	<%}


%>	
	
</body>
</html>