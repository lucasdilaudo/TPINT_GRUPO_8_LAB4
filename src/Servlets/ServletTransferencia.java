package Servlets;

import java.io.IOException;
import java.time.LocalDate;
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
		LocalDate fecha = LocalDate.now();
		
		

//		if(request.getParameter("btnTransferir")!=null) {
//			String NrodeCuenta =  request.getParameter("ddlNroDeCuenta").toString();
//			Cuenta aux = new Cuenta(); //cuenta donde almacenar el valor
//			ArrayList<Cuenta> ac = NegocioCuenta.ObtenerCuentasPorUsuario(request.getSession().getAttribute("DNI").toString());
//			
//			for (Cuenta cuenta : ac) { //buscando la cuenta con el nroelegido
//				if(cuenta.getNroCuenta().equals(NrodeCuenta)) aux = cuenta;
//				
//			}
//			
//			mov.setFecha(fecha.getYear()+"-"+fecha.getMonthValue()+"-"+fecha.getDayOfMonth());
//			mov.setDetalle("varios...");
//			mov.setImporte(Float.parseFloat(request.getParameter("txtImporte")));
//			mov.setTipoMovimiento(4);
//			mov.setCbuOrigen(Integer.parseInt(aux.getCBU()));
//			mov.setCbuDestino(Integer.parseInt(request.getParameter("txtCbuDestino")));
//			
//			negMov.AgregarTransferencia(mov);
//			
//			RequestDispatcher rd = request.getRequestDispatcher("/Transferencias.jsp");
//			rd.forward(request, response);
//			
//		}
		
		if(request.getParameter("btnTransferir")!=null) {

			mov.setFecha(fecha.getYear()+"-"+fecha.getMonthValue()+"-"+fecha.getDayOfMonth());
			mov.setDetalle("varios...");
			mov.setImporte(Float.parseFloat(request.getParameter("txtImporte")));
			mov.setTipoMovimiento(4);
			mov.setCbuOrigen(Integer.parseInt(request.getParameter("ddlNroDeCuenta")));
			mov.setCbuDestino(Integer.parseInt(request.getParameter("txtCbuDestino")));
			
			negMov.AgregarTransferencia(mov);
			
			if(request.getParameter("hiddenDni")!=null) {
				ArrayList<Cuenta> ac = NegocioCuenta.ObtenerCuentasPorUsuario(request.getParameter("hiddenDni"));
				request.setAttribute("listaCuentas", ac);
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("Transferencias.jsp");
			rd.forward(request, response);
		}
		
		if(request.getParameter("btnVolver")!=null) {
			RequestDispatcher rd = request.getRequestDispatcher("MenuUsuario.jsp");
			rd.forward(request, response);
		}
		
		
	}

}
