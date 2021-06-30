package Servlets;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.Session;

import Dao.CuentaDao;
import Negocio.NegocioCuenta;
import entidades.Cuenta;
import sun.rmi.server.Dispatcher;

/**
 * Servlet implementation class SevletCuenta
 */
@WebServlet("/ServletCuenta")
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
		LocalDate fecha = LocalDate.now();
		
		
		if(request.getParameter("btnGuardarCuenta")!=null)
	    {
		     Cuenta c = new Cuenta();
		     c.setNroCuenta(request.getParameter("txtNrodeCuenta"));
		     c.setCBU(request.getParameter("txtCBU"));
		     c.setTipoDeCuenta(Integer.parseInt(request.getParameter("tipodeCuenta")));
		     c.setDNICliente(request.getParameter("txtDni"));
		     c.setFechaCreacion(fecha.getYear()+"-"+fecha.getMonthValue()+"-"+fecha.getDayOfMonth());
		     c.setSaldo(10000);
		    
		    boolean Agregado = NegocioCuenta.AgregarCuenta(c);
			
			
			
			//REQUESTDISPACHER
			request.setAttribute("Agregado", Agregado);
			RequestDispatcher rd = request.getRequestDispatcher("ABML Cuentas/AltaCuenta.jsp");
			rd.forward(request, response);
	    }
   

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cuenta c = new Cuenta();
		
		if(request.getParameter("ConfirmarBajaSi")!=null){
			
	
			
			boolean Eliminado = NegocioCuenta.EliminarCuenta(request.getParameter("hiddenCBU"),request.getParameter("hiddenNrodeCuenta"));
			
			request.setAttribute("ConfirmarEliminado", Eliminado );	
		
			RequestDispatcher rd = request.getRequestDispatcher("ABML Cuentas/ConfirmarBajaCuenta.jsp");
			rd.forward(request, response);
			
		}
		
		if(request.getParameter("ConfirmarBajaNo")!=null){
			
			

			RequestDispatcher rd = request.getRequestDispatcher("ABML Cuentas/ListarCuenta.jsp");
			rd.forward(request, response);
			
		}
		

		if(request.getParameter("btnModificarCuenta")!=null) {
			
			c.setCBU(request.getParameter("hiddenCBU"));
			c.setNroCuenta(request.getParameter("hiddenNrodeCuenta"));
			c.setDNICliente(request.getParameter("txtDni"));
			c.setTipoDeCuenta( Integer.parseInt(request.getParameter("selectTipodeCuenta")));
			c.setSaldo( Double.parseDouble(request.getParameter("txtSaldo")));
		
			boolean Modificado = NegocioCuenta.ModificarCuenta(c);
			
			
			request.setAttribute("Modificado", Modificado);
			
			RequestDispatcher rd = request.getRequestDispatcher("ABML Cuentas/ModificarCuenta.jsp");
			rd.forward(request, response);
			
		}
		
		
		
		
	}

}
