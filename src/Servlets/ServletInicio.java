package Servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Negocio.NegocioCliente;
import Negocio.NegocioCuenta;
import entidades.Cliente;
import entidades.Cuenta;

/**
 * Servlet implementation class ServletInicio
 */
@WebServlet("/ServletInicio")
public class ServletInicio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletInicio() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Cliente c;
		String Mensaje;
		String Nombre;
	
		String dni = request.getParameter("txtDNI");
		String usuario=request.getParameter("txtUsuario");
		String clave=  request.getParameter("txtContrasena");
		String direccion;
		if(request.getParameter("btnIngresar")!=null)
	    {
				
				if(NegocioCliente.Existe(request.getParameter("txtDNI"))) {
					c=NegocioCliente.ObtenerCliente((request.getParameter("txtDNI")));
					if( (c.getUsuario().equals(usuario) && (c.getContrasenia().equals(clave)))) {
						Mensaje="Log ok";
						if(c.getTipodeCliente()==1)direccion="MenuAdmin.jsp";
						else { direccion="MenuUsuario.jsp";
								ArrayList<Cuenta> ac = NegocioCuenta.ObtenerCuentasPorUsuario(c.getDni());
								request.setAttribute("Cuentas", ac);
						}
						
						
					}
					else {
						Mensaje="Datos erroneos.";
						request.setAttribute("Mensaje", Mensaje);
						direccion="Inicio.jsp";
						
					}
			}
			else{
				Mensaje="DNI no registrado";
				request.setAttribute("Mensaje", Mensaje);
				direccion="Inicio.jsp";
				
			}
				HttpSession session = request.getSession();
				session.setAttribute("Usuario", request.getParameter("txtUsuario"));
				session.setAttribute("DNI", request.getParameter("txtDNI"));
				RequestDispatcher rd = request.getRequestDispatcher(direccion);
				rd.forward(request, response);
		}
	}

}
