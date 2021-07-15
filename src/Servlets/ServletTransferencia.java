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

import Controles.ValidarSaldos;
import Excepciones.SaldoNegativoException;
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
		
		LocalDate fecha = LocalDate.now();
		
		if(request.getParameter("btnTransferir")!=null) {
			try {
			
				
				if(request.getParameter("ddlNroDeCuenta").toString().equals("0")) {
					request.setAttribute("Mensaje", "Por favor seleccione una Cuenta");
					ArrayList<Cuenta> ac = NegocioCuenta.ObtenerCuentasPorUsuario(request.getSession().getAttribute("DNI").toString());
			
					request.setAttribute("listaCuentas", ac);
					RequestDispatcher rd = request.getRequestDispatcher("Transferencias.jsp");
					rd.forward(request, response);
				 }
				 if(request.getParameter("Motivo").toString().equals("0")) {
					 request.setAttribute("Mensaje", "Por favor seleccione un Motivo");
					 ArrayList<Cuenta> ac = NegocioCuenta.ObtenerCuentasPorUsuario(request.getSession().getAttribute("DNI").toString());
						request.setAttribute("listaCuentas", ac);
					RequestDispatcher rd = request.getRequestDispatcher("Transferencias.jsp");
					rd.forward(request, response);
				 }
				 
				if(NegocioCuenta.Existe(request.getParameter("txtCbuDestino"))) {
					Double saldo = 0.00;
					Cuenta c = NegocioCuenta.ObtenerCuenta(request.getParameter("ddlNroDeCuenta"));
					saldo = c.getSaldo();
					mov.setFecha(fecha.getYear()+"-"+fecha.getMonthValue()+"-"+fecha.getDayOfMonth());
					mov.setDetalle(request.getParameter("Motivo"));
					mov.setImporte(Float.parseFloat(request.getParameter("txtImporte")));
					mov.setTipoMovimiento(4);
					mov.setCbuOrigen(Integer.parseInt(request.getParameter("ddlNroDeCuenta")));
					mov.setCbuDestino(Integer.parseInt(request.getParameter("txtCbuDestino")));
					
					saldo = saldo - mov.getImporte();
					System.out.println(saldo);
					ValidarSaldos.ValidarSaldos(saldo);
					
					if(NegocioMovimiento.AgregarTransferencia(mov)) request.setAttribute("Mensaje", "Transferencia realizada con exito");
					else request.setAttribute("Mensaje", "No se pudo realizar la transferencia");
				}
				
				else request.setAttribute("Mensaje", "El cbu destinatario no existe");
			}
			catch (SaldoNegativoException e) {
				e.printStackTrace();
				request.setAttribute("Mensaje2", "La operacion excede el saldo disponible");
			}
			 
			
			
				ArrayList<Cuenta> ac = NegocioCuenta.ObtenerCuentasPorUsuario(request.getSession().getAttribute("DNI").toString());
				request.setAttribute("listaCuentas", ac);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("Transferencias.jsp");
			rd.forward(request, response);
		}

	}

}
