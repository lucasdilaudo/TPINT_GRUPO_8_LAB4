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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		if(request.getParameter("btnIr")!=null) {
			ArrayList<Cuenta> ac = NegocioCuenta.ObtenerCuentasPorUsuario(request.getSession().getAttribute("DNI").toString());
			request.setAttribute("listaCuentas", ac);
			
			Prestamo p = NegocioPrestamo.ObtenerPrestamo(request.getParameter("selectPrestamos"));
			
			request.setAttribute("CantCuotas", p.getCantCuotas());
			request.setAttribute("PrecioCuota", p.getMontoMensual());
			Prestamo p2 =new Prestamo();
			request.setAttribute("PrestamoElegido", p);
			
			ArrayList<Prestamo> pre = NegocioPrestamo.ObtenerPrestamosAceptados(request.getSession().getAttribute("DNI").toString());
			request.setAttribute("listaPrestamos", pre);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("PagoDePrestamos.jsp");
			rd.forward(request, response);
			
		}
		
		if(request.getParameter("btnConfirmar")!=null) {
			LocalDate fecha = LocalDate.now();
			
			Prestamo a = NegocioPrestamo.ObtenerPrestamo(request.getParameter("hiddenId").toString());
			Double importe = 0.00;
			for(int i=1;i<=a.getCantCuotas();i++) {
				if(request.getParameter("chk"+i)!=null) {
					a.setCantCuotas(a.getCantCuotas()-1);
					a.setImporteaPagar(a.getImporteaPagar() - a.getMontoMensual());
					importe += a.getMontoMensual();
				}
				
				
			}
			Movimiento m = new Movimiento();
			m.setFecha(fecha.getYear()+"-"+fecha.getMonthValue()+"-"+fecha.getDayOfMonth());
			m.setDetalle("Pago de Prestamo");
			m.setImporte(Float.parseFloat(importe.toString()));
			m.setCbuOrigen(Integer.parseInt(request.getParameter("ddlCBU")));
			m.setCbuDestino(Integer.parseInt(request.getParameter("ddlCBU")));
			m.setTipoMovimiento(3);
			NegocioPrestamo.PagarPrestamo(a);
			NegocioMovimiento.AgregarTransferencia(m);
			
			
			///cargar la pagina de nuevo con los datos
	
			
			
			ArrayList<Prestamo> pre = NegocioPrestamo.ObtenerPrestamosAceptados(request.getSession().getAttribute("DNI").toString());
			request.setAttribute("listaPrestamos", pre);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("PagoDePrestamos.jsp");
			rd.forward(request, response);
			
		}
		
	}

}
