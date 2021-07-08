package Servlets;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.Date;

import com.mysql.cj.Session;

import Negocio.NegocioCliente;
import Negocio.NegocioCuenta;
import Negocio.NegocioPrestamo;
import entidades.Cliente;
import entidades.Cuenta;
import entidades.Prestamo;

/**
 * Servlet implementation class ServletPrestamo
 */
@WebServlet("/ServletPrestamo")
public class ServletPrestamo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletPrestamo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//if(request.getParameter("btnAceptarPrestamo")!=null) {
		if("btnAceptarPrestamo"!=null) {
			NegocioPrestamo.AceptarPrestamo(1, request.getParameter("Id"));
			 RequestDispatcher rd = request.getRequestDispatcher("ServletMenu?IraAutorizacion=1");
			 rd.forward(request, response);
			
		}
		
		//if(request.getParameter("btnRechazarPrestamo")!=null) {
		if("btnRechazarPrestamo"!=null) {
			NegocioPrestamo.AceptarPrestamo(0, request.getParameter("Id"));
			 RequestDispatcher rd = request.getRequestDispatcher("ServletMenu?IraAutorizacion=1");
			 rd.forward(request, response);		
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		if (request.getParameter("btnVolver")!=null) {
//			RequestDispatcher rd = request.getRequestDispatcher("MenuUsuario.jsp");
//			rd.forward(request, response);
//		}
		
//		if(request.getParameter("btnSolicitar")!=null)
//	    {
//			 LocalDate fecha = LocalDate.now(); 
//			 Cuenta cu = NegocioCuenta.ObtenerCuentaConDNI(request.getParameter("DNI"));
//			 Prestamo p = new Prestamo();
//		     System.out.println(cu);
//			 p.setCBU(cu.getCBU());
//			 //p.setFecha(fecha.toString());
//			 p.setFecha(fecha.getYear()+"-"+fecha.getMonthValue()+"-"+fecha.getDayOfMonth());
//		     p.setImporteaPagar(Double.parseDouble(request.getParameter("txtImporte"))*1.5);
//		     p.setImportePedido(Double.parseDouble(request.getParameter("txtImporte")));
//		     if (Integer.valueOf(request.getParameter("PlazoMeses"))==1) {
//		    	 p.setPlazo(12);
//		     }else {
//		    	 p.setPlazo(24);
//		     }
//		     
//		     p.setMontoMensual(p.getImporteaPagar()/p.getPlazo());
//		     p.setCantCuotas(p.getPlazo());
//		    
//		     
//		     String Mensaje;
//		     
//		     if(NegocioPrestamo.AgregarPrestamo(p)) {
//		    	 Mensaje = "Prestamo en proceso de autorizacion";
//		     }
//		     else { 
//		    	 Mensaje = "Prestamo no disponible por el momento";
//		    	 
//		     }
//		   //REQUESTDISPACHER
//			request.setAttribute("Mensaje", Mensaje);
//			RequestDispatcher rd = request.getRequestDispatcher("Prestamos.jsp");
//			rd.forward(request, response);
//	    }
		if(request.getParameter("btnSolicitar")!=null){
			 LocalDate fecha = LocalDate.now(); 
			 Prestamo p = new Prestamo();
			 
			 p.setCBU(request.getParameter("ddlCBU"));
			 //p.setFecha(fecha.toString());
			 p.setFecha(fecha.getYear()+"-"+fecha.getMonthValue()+"-"+fecha.getDayOfMonth());
//		     p.setImporteaPagar(Double.parseDouble(request.getParameter("txtImporte"))*1.5);
		     p.setImporteaPagar(Double.parseDouble(request.getParameter("txtImporte")));
		     p.setImportePedido(Double.parseDouble(request.getParameter("txtImporte")));
		     if (Integer.valueOf(request.getParameter("PlazoMeses"))==1) {
		    	 p.setPlazo(12);
		     }else {
		    	 p.setPlazo(24);
		     }
		     
		     p.setMontoMensual(p.getImporteaPagar()/p.getPlazo());
		     p.setCantCuotas(p.getPlazo());
		    
		     
		     String Mensaje;
		     
		     if(NegocioPrestamo.AgregarPrestamo(p)) {
		    	 Mensaje = "Prestamo en proceso de autorizacion";
		     }
		     else { 
		    	 Mensaje = "Prestamo no disponible por el momento";
		    	 
		     }
		     
		     if(request.getParameter("hiddenDni")!=null) {
					ArrayList<Cuenta> ac = NegocioCuenta.ObtenerCuentasPorUsuario(request.getParameter("hiddenDni"));
					request.setAttribute("listaCuentas", ac);
				}
		   //REQUESTDISPACHER
			request.setAttribute("Mensaje", Mensaje);
			RequestDispatcher rd = request.getRequestDispatcher("Prestamos.jsp");
			rd.forward(request, response);
	    }
	}
}
