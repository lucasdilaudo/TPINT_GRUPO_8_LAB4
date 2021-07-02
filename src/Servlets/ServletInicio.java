package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Negocio.NegocioCliente;
import entidades.Cliente;

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
		
		
		String Mensaje;
		
		
		if(request.getParameter("btnIngresar")!=null)
	    {
			if(NegocioCliente.Saber_TipodeUsuario(request.getParameter("txtUsuario"), request.getParameter("txtConstraseña")) == 0) {
				Mensaje="El usuario no existe.";
				request.setAttribute("Mensaje", Mensaje);
				RequestDispatcher rd = request.getRequestDispatcher("Inicio.jsp");
				rd.forward(request, response);
			}
			else {
				if(NegocioCliente.Saber_TipodeUsuario(request.getParameter("txtUsuario"), request.getParameter("txtConstraseña")) == 2) {
					RequestDispatcher rd = request.getRequestDispatcher("MenuUsuario.jsp");
					rd.forward(request, response);
				}
				else {
					if(NegocioCliente.Saber_TipodeUsuario(request.getParameter("txtUsuario"), request.getParameter("txtConstraseña")) == 1) {
						RequestDispatcher rd = request.getRequestDispatcher("MenuAdmin.jsp");
						rd.forward(request, response);
					}
					else {
						if(NegocioCliente.Saber_TipodeUsuario(request.getParameter("txtUsuario"), request.getParameter("txtConstraseña")) == 3) {
							Mensaje="El usuario no es ni admin ni cliente - ERROR";
							request.setAttribute("Mensaje", Mensaje);
							RequestDispatcher rd = request.getRequestDispatcher("Inicio.jsp");
							rd.forward(request, response);
						}
					}
				}
			}
	    }
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
