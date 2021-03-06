package Servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controles.Validarfecha;
import Excepciones.FechaException;
import Negocio.NegocioCliente;
import Negocio.NegocioCuenta;
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
		
		if(request.getParameter("IraMod")!=null) {
			Cliente c = NegocioCliente.ObtenerCliente(request.getParameter("DNI"));
			request.setAttribute("Cliente", c);
			RequestDispatcher rd = request.getRequestDispatcher("ABML Clientes/ModificarCliente.jsp");
			rd.forward(request, response);
			
		}
		
		
		if(request.getParameter("IraListar")!=null) {
			ArrayList<Cliente> ac = NegocioCliente.ObtenerTodo();
			request.setAttribute("ListadeClientes", ac);
			RequestDispatcher rd = request.getRequestDispatcher("/ABML Clientes/ListarCliente.jsp");
			rd.forward(request, response);
			
		}
		
		
		
		if(request.getParameter("btnguardarCliente")!=null)
	    {
		     Cliente c = new Cliente();
		     c.setDni(request.getParameter("txtDni"));
		     c.setCUIL(request.getParameter("txtCuil"));
		     c.setNombre(request.getParameter("txtNombre"));
		     c.setApellido(request.getParameter("txtApellido")); 
		     c.setSexo(Integer.parseInt(request.getParameter("ddlSexo")));
		     c.setNacionalidad(request.getParameter("txtNacionalidad"));
		    try {
		    	Validarfecha.ValidarFecha(Integer.parseInt(request.getParameter("txtDia")), Integer.parseInt(request.getParameter("txtMes")), Integer.parseInt(request.getParameter("txtAnio")));
		    	c.setFecha(request.getParameter("txtAnio")+"-"+ request.getParameter("txtMes")+"-"+request.getParameter("txtDia"));
		    } catch (FechaException e) {
				e.printStackTrace();
				request.setAttribute("Mensaje", "Fecha no valida");
				RequestDispatcher rd = request.getRequestDispatcher("ABML Clientes/AltaCliente.jsp");
				rd.forward(request, response);
			}
		     	
		     c.setDireccion(request.getParameter("txtDireccion"));
		     c.setLocalidad(request.getParameter("txtLocalidad"));
		     c.setProvincia(request.getParameter("txtProvincia"));
		     c.setCorreo(request.getParameter("txtCorreo"));
		     c.setTelefono(request.getParameter("txtTelefono")); 
		     c.setUsuario(request.getParameter("txtUsuario"));
		     c.setContrasenia(request.getParameter("txtContrasenia"));
		     c.setTipodeCliente(Integer.parseInt(request.getParameter("ddlTipodeusuario")));
		     	     
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
		Cliente c=new Cliente();
		
		if(request.getParameter("ConfirmarSi")!=null){
			
			boolean Eliminado = NegocioCliente.EliminarCliente(request.getParameter("hiddenDNI"));
			request.setAttribute("ConfirmarEliminado", Eliminado );	
			RequestDispatcher rd = request.getRequestDispatcher("ABML Clientes/ConfirmarBajaCliente.jsp");
			rd.forward(request, response);
		}
		
		
		if(request.getParameter("btnModCliente")!=null) {
			
			c.setDni(request.getParameter("hiddenDniCliente"));
			c.setNombre(request.getParameter("txtNombre"));
			c.setApellido(request.getParameter("txtApellido"));
			c.setCUIL(request.getParameter("txtCuil"));
			c.setDireccion(request.getParameter("txtDireccion"));
			c.setLocalidad(request.getParameter("txtLocalidad"));
			c.setCorreo(request.getParameter("txtCorreo"));
		
			String Mensaje;
		    
			if(NegocioCliente.ModificarCliente(c)) {
				Mensaje = "Cuenta modificada con exito";
			}else Mensaje = "No se pudo modificar";
			
			
			request.setAttribute("Mensaje", Mensaje);
			
			RequestDispatcher rd = request.getRequestDispatcher("ABML Clientes/ModificarCliente.jsp");
			rd.forward(request, response);
			
		}
		
	}

}
