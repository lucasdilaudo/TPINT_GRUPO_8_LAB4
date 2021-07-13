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
import Negocio.NegocioMovimiento;
import Negocio.NegocioPrestamo;
import entidades.Cliente;
import entidades.Cuenta;
import entidades.Movimiento;
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
		if (request.getParameter("IraMovimientos")!=null) {
			Cuenta c = NegocioCuenta.ObtenerCuentaConDNI(request.getSession().getAttribute("DNI").toString());
			ArrayList<Movimiento> m = NegocioMovimiento.ObtenerMovPorCBU(c.getCBU());
			request.setAttribute("Movimientos", m);
			System.out.println(m);
			RequestDispatcher rd = request.getRequestDispatcher("Movimientos.jsp");
			rd.forward(request, response);
		}
		
		if(request.getParameter("IraAutorizacion")!=null) {
			ArrayList<Prestamo> ap = NegocioPrestamo.ObtenerTodo();
			request.setAttribute("Prestamos", ap  );
			
			RequestDispatcher rd = request.getRequestDispatcher("AutorizacionDePrestamos.jsp");
			rd.forward(request, response);
			
		}
		
//		if(request.getParameter("IraTransferencias")!=null) {
//			int cantcuentas = NegocioCuenta.CantidadCuentas(request.getSession().getAttribute("DNI").toString());
//			request.setAttribute("CantCuentas", cantcuentas);
//			
//			RequestDispatcher rd = request.getRequestDispatcher("Transferencias.jsp");
//			rd.forward(request, response);
//			
//		}
		
		if(request.getParameter("IraTransferencia")!=null) {
			ArrayList<Cuenta> ac = NegocioCuenta.ObtenerCuentasPorUsuario(request.getParameter("IraTransferencia"));
			request.setAttribute("listaCuentas", ac  );
			
			RequestDispatcher rd = request.getRequestDispatcher("/Transferencias.jsp");
			rd.forward(request, response);
			
		}
		
		if(request.getParameter("IraPrestamos")!=null) {
			ArrayList<Cuenta> ac = NegocioCuenta.ObtenerCuentasPorUsuario(request.getParameter("IraPrestamos"));
			request.setAttribute("listaCuentas", ac);
			
			RequestDispatcher rd = request.getRequestDispatcher("/Prestamos.jsp");
			rd.forward(request, response);
			
		}
		
		
		if(request.getParameter("IraPago")!=null) {
			Prestamo p =new Prestamo();
			
		
			ArrayList<Prestamo> pre = NegocioPrestamo.ObtenerPrestamosAceptados(request.getSession().getAttribute("DNI").toString());
			request.setAttribute("listaPrestamos", pre);
		
			
			
			RequestDispatcher rd = request.getRequestDispatcher("PagoDePrestamos.jsp");
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
