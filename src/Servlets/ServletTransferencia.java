package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Negocio.NegocioMovimiento;

import entidades.Movimiento;

/**
 * Servlet implementation class ServletTransferencia
 */
@WebServlet("/ServletTransferencia")
public class ServletTransferencia extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletTransferencia() {
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
		Movimiento mov=new Movimiento();
		NegocioMovimiento negMov= new NegocioMovimiento();
		

		if(request.getParameter("btnTransferir")!=null) {

			mov.setFecha("2021-06-06");
			mov.setDetalle("varios...");
			mov.setImporte(Float.parseFloat(request.getParameter("txtImporte")));
			mov.setTipoMovimiento(4);
			mov.setCbuOrigen(Integer.parseInt(request.getParameter("ddlNroDeCuenta")));
			mov.setCbuDestino(Integer.parseInt(request.getParameter("txtCbuDestino")));
			
			negMov.AgregarTransferencia(mov);
			
			RequestDispatcher rd = request.getRequestDispatcher("/Transferencias.jsp");
			rd.forward(request, response);
			
		}
		
		
	}

}
