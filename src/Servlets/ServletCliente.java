package Servlets;

import java.io.IOException;
import java.time.LocalDate;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Negocio.NegocioCliente;
import entidades.Cliente;


/**
 * Servlet implementation class ServletCliente
 */
@WebServlet("/ServletCliente")
public class ServletCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCliente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LocalDate fecha = LocalDate.now();
		
		if(request.getParameter("btnguardarCliente")!=null)
	    {
			
			
		     Cliente c = new Cliente();
		     c.setDni(request.getParameter("txtDni"));
		     c.setCUIL(request.getParameter("txtCuil"));
		     c.setNombre(request.getParameter("txtNombre"));
		     c.setApellido(request.getParameter("txtApellido")); 
		     c.setSexo(Integer.parseInt(request.getParameter("ddlSexo")));
		     c.setNacionalidad(request.getParameter("txtNacionalidad"));
		     //c.setFecha(request.getParameter("txtAnio")+"-"+request.getParameter("txtMes")+"-"+request.getParameter("txtDia"));  
		     c.setFecha(request.getParameter("txtAnio")+"-"+ request.getParameter("txtMes")+"-"+request.getParameter("txtDia"));
		     c.setDireccion(request.getParameter("txtDireccion"));
		     c.setLocalidad(request.getParameter("txtLocalidad"));
		     c.setProvincia(request.getParameter("txtProvincia"));
		     c.setCorreo(request.getParameter("txtCorreo"));
		     c.setTelefono(request.getParameter("txtTelefono")); 
		     c.setUsuario(request.getParameter("txtUsuario"));
		     c.setContrasenia(request.getParameter("txtContrasenia"));
		     	     
		     String Mensaje;
		     
		     if(NegocioCliente.Existe(c.getDni())) Mensaje = "Ya existe un usuario con ese DNI";
		     else { 
		    	 if(NegocioCliente.AgregarCliente(c)) Mensaje = "Usuario Agregado con exito";
		    	 else Mensaje = "No se pudo agregar";
		     }
		    
			
			
			
			//REQUESTDISPACHER
			request.setAttribute("Mensaje", Mensaje);
			RequestDispatcher rd = request.getRequestDispatcher("ABML Clientes/AltaCliente.jsp");
			rd.forward(request, response);
	    }
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("ConfirmarSi")!=null){
			
			boolean Eliminado = NegocioCliente.EliminarCliente(request.getParameter("hiddenDNI"));
			request.setAttribute("ConfirmarEliminado", Eliminado );	
			RequestDispatcher rd = request.getRequestDispatcher("ABML Clientes/ConfirmarBajaCliente.jsp");
			rd.forward(request, response);
		}
		
	}

}
