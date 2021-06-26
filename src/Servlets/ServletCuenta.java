package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.Session;

import Negocio.NegocioCuenta;
import entidades.Cuenta;
import sun.rmi.server.Dispatcher;

/**
 * Servlet implementation class SevletCuenta
 */
@WebServlet("/SevletCuenta")
public class ServletCuenta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCuenta() {
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
		Cuenta c = new Cuenta();
		
		if(request.getParameter("ConfirmarSI")!=null){
		}
		
		if(request.getParameter("btnBajaCuenta")!=null) {
			//envia los valores a confirmar baja
			request.getSession().setAttribute("CbuConfimarBaja", "CBU");
			request.getSession().setAttribute("NroCuentaConfirmarBaja", "NroCuenta");
			RequestDispatcher rd = request.getRequestDispatcher("/ConfirmarBaja.jsp");
			rd.forward(request, response);
		}
		

		
		
		
	}

}
