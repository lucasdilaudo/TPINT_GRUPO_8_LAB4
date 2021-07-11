package Servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Negocio.NegocioCuenta;
import Negocio.NegocioPrestamo;
import entidades.Cuenta;
import entidades.Prestamo;

/**
 * Servlet implementation class ServletPagoPrestamo
 */
@WebServlet("/ServletPagoPrestamo")
public class ServletPagoPrestamo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletPagoPrestamo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("btnIr")!=null) {
			Prestamo p =new Prestamo();
			
			if(request.getParameter("hiddenDni")!=null) {
				ArrayList<Prestamo> pre = NegocioPrestamo.ObtenerTodo();
				request.setAttribute("listaPrestamos", pre);
				;
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("PagoDePrestamos.jsp");
			rd.forward(request, response);
		}
		
		
		
		
	}

}
