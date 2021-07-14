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
import Negocio.NegocioMovimiento;
import entidades.Cuenta;
import entidades.Movimiento;

/**
 * Servlet implementation class ServletMovimiento
 */
@WebServlet("/ServletMovimiento")
public class ServletMovimiento extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletMovimiento() {
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
		  if(request.getParameter("hiddenDni")!=null) {
				ArrayList<Cuenta> ac = NegocioCuenta.ObtenerCuentasPorUsuario(request.getParameter("hiddenDni"));
				request.setAttribute("listaCbu", ac);
			}
		  
		  if(request.getParameter("btnFiltrar")!=null) {
			  ArrayList<Movimiento> am = NegocioMovimiento.ObtenerMovPorCBU(request.getParameter("ddlCbu"));
			  request.setAttribute("Movimientos", am);
		  }
		  
		  if(request.getParameter("btnMostrarTodo")!=null) {
			  ArrayList<Movimiento> m = NegocioMovimiento.ObtenerMovPorDNI(request.getParameter("hiddenDni"));
			request.setAttribute("Movimientos", m);
		  }
		  
		  
		  
			RequestDispatcher rd = request.getRequestDispatcher("Movimientos.jsp");
			rd.forward(request, response);
	}

}
