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

import com.mysql.cj.Session;

import Controles.ValidarSaldos;
import Excepciones.FechaException;
import Excepciones.SaldoNegativoException;
import Negocio.NegocioCliente;
import Negocio.NegocioCuenta;
import Negocio.NegocioMovimiento;
import Negocio.NegocioPrestamo;
import entidades.Cuenta;
import entidades.Movimiento;
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
		if(request.getParameter("Seleccionar")!=null) {
					
					//Carga los datos de nuevo de la pagina
					ArrayList<Cuenta> ac = NegocioCuenta.ObtenerCuentasPorUsuario(request.getSession().getAttribute("DNI").toString());
					request.setAttribute("listaCuentas", ac);
					ArrayList<Prestamo> pre = NegocioPrestamo.ObtenerPrestamosAceptados(request.getSession().getAttribute("DNI").toString());
					request.setAttribute("listaPrestamos", pre);
					//
					
					Prestamo p = NegocioPrestamo.ObtenerPrestamo(request.getParameter("Id"));
					
					request.setAttribute("CantCuotas", p.getCantCuotas());
					request.setAttribute("PrecioCuota", p.getMontoMensual());
					
					request.setAttribute("PrestamoElegido", p);
					
					
					
					
					RequestDispatcher rd = request.getRequestDispatcher("PagoDePrestamos.jsp");
					rd.forward(request, response);
					
				}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
		if(request.getParameter("btnConfirmar")!=null) {
			
			try {
				LocalDate fecha = LocalDate.now();
				
				Prestamo a =  NegocioPrestamo.ObtenerPrestamo((request.getParameter("hiddenId").toString()));
				Cuenta c = NegocioCuenta.ObtenerCuentaConDNI(request.getSession().getAttribute("DNI").toString());
				Double importe = 0.00;
				Double saldo = 0.00;
				
				int CantCuotas = Integer.parseInt(request.getParameter("ddlCuotas").toString());
				if(CantCuotas==a.getCantCuotas()) {
					importe = a.getImporteaPagar();
					a.setImporteaPagar(0);
					a.setCantCuotas(0);
					
				}
				else {
					importe = CantCuotas*a.getMontoMensual();
					a.setImporteaPagar(a.getImporteaPagar()-(CantCuotas*a.getMontoMensual()));
					a.setCantCuotas(a.getCantCuotas()-CantCuotas);
				}
				
				saldo=c.getSaldo()-importe;
				ValidarSaldos.ValidarSaldos(saldo);
				
				Movimiento m = new Movimiento();
				m.setFecha(fecha.getYear()+"-"+fecha.getMonthValue()+"-"+fecha.getDayOfMonth());
				m.setDetalle("Pago de Prestamo");
				m.setImporte(Float.parseFloat(importe.toString()));
				m.setCbuOrigen(Integer.parseInt(request.getParameter("ddlCbu")));
				m.setCbuDestino(Integer.parseInt(request.getParameter("ddlCbu")));
				m.setTipoMovimiento(3);
				
				if(NegocioPrestamo.PagarPrestamo(a) && NegocioMovimiento.AgregarTransferencia(m)) {
					request.setAttribute("Mensaje", "Pago realizado con exito");
					
				}
				else request.setAttribute("Mensaje", "No se pudo realizar el pago");
				
			}catch(SaldoNegativoException e) {
				e.printStackTrace();
				request.setAttribute("Mensaje2", "La operacion excede el saldo disponible");
			}
			
			
			///cargar la pagina de nuevo con los datos
	
			
			
			ArrayList<Prestamo> pre = NegocioPrestamo.ObtenerPrestamosAceptados(request.getSession().getAttribute("DNI").toString());
			request.setAttribute("listaPrestamos", pre);
			ArrayList<Cuenta> ac = NegocioCuenta.ObtenerCuentasPorUsuario(request.getSession().getAttribute("DNI").toString());
			request.setAttribute("listaCuentas", ac);
			
			RequestDispatcher rd = request.getRequestDispatcher("PagoDePrestamos.jsp");
			rd.forward(request, response);
			
		}
		
	}

}
