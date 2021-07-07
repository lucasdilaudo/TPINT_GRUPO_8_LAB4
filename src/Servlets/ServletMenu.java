package Servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Negocio.NegocioCliente;
import Negocio.NegocioCuenta;
import Negocio.NegocioPrestamo;
import entidades.Cliente;
import entidades.Prestamo;

/**
 * Servlet implementation class ServletMenu
 */
@WebServlet("/ServletMenu")
public class ServletMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletMenu() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("IraPerfil")!=null) {
			Cliente c = NegocioCliente.ObtenerCliente(request.getSession().getAttribute("DNI").toString());
			request.setAttribute("Cliente", c);
			
			RequestDispatcher rd = request.getRequestDispatcher("Perfil.jsp");
			rd.forward(request, response);
			
		}
		
		if(request.getParameter("IraAutorizacion")!=null) {
			ArrayList<Prestamo> ap = NegocioPrestamo.ObtenerTodo();
			request.setAttribute("Prestamos", ap  );
			
			RequestDispatcher rd = request.getRequestDispatcher("AutorizacionDePrestamos.jsp");
			rd.forward(request, response);
			
		}
		
		if(request.getParameter("IraTransferencias")!=null) {
			int cantcuentas = NegocioCuenta.CantidadCuentas(request.getSession().getAttribute("DNI").toString());
			request.setAttribute("CantCuentas", cantcuentas);
			
			RequestDispatcher rd = request.getRequestDispatcher("Transferencias.jsp");
			rd.forward(request, response);
			
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
