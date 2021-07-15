<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>Menu Administrador</title>

</head>

<body>
<% 
String Usuario = (String) session.getAttribute("Usuario");
%>

Usuario:<%out.print(Usuario); %>
<br>
<h1 align="center">Menu Administrador</h1>
<br>
		<div align="center">
		<a href="Inicio.jsp" class="badge badge-danger">Cerrar sesión</a>
		<br><br>
		</div>
		
		 <table align="center" width="70%" border="1" cellpadding="0" cellspacing="2" style="border-collapse:separate;border-spacing:2px;border-color:#ddd;">

        <tr>
            <td align="center">Gestion de Clientes:</td>
            <td align="center">Gestion de Cuentas:</td>
            <td align="center">&nbsp;</td>
        </tr>
        
        <tr>
            <td align="center"><a href="ABML Clientes/AltaCliente.jsp" class="badge badge-success">Alta Cliente</a></td>
            <td align="center"><a href="ABML Cuentas/AltaCuenta.jsp" class="badge badge-success">Alta Cuenta</a></td>
            <td align="center"><a href="${pageContext.request.contextPath}/ServletMenu?action=LIST&IraAutorizacion=1" class="badge badge-success">Autorizacion de prestamos</a></td>
        </tr>
        
        <tr>
            <td align="center"><a href="${pageContext.request.contextPath}/ServletCliente?IraListar=1" class="badge badge-primary">Listar Clientes</a></td>
            <td align="center"><a href="${pageContext.request.contextPath}/ServletCuenta?action=LIST&IraListar=1" class="badge badge-primary">Listar Cuentas</a></td>
            <td align="center"><a href="Reportes.jsp" class="badge badge-primary">Reportes</a></td>
        </tr>
        
        </table>
</body>
</html>