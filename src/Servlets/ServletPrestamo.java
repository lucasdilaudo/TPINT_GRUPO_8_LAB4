package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("btnVolver")!=null) {
			RequestDispatcher rd = request.getRequestDispatcher("MenuUsuario.jsp");
			rd.forward(request, response);
		}
		if(request.getParameter("btnSolicitar")!=null)
	    {
			 Date fecha= new Date(); 
			 Cuenta cu = NegocioCuenta.ObtenerCuentaConDNI(request.getParameter("DNI"));
			 Prestamo p = new Prestamo();
		    
			 p.setCBU(cu.getCBU());
			 //p.setFecha(fecha.toString());
			 p.setFecha("2012-12-04");
		     p.setImporteaPagar(Double.parseDouble(request.getParameter("txtImporte"))*1.5);
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
		   //REQUESTDISPACHER
			request.setAttribute("Mensaje", Mensaje);
			RequestDispatcher rd = request.getRequestDispatcher("Prestamos.jsp");
			rd.forward(request, response);
	    }

	}
}
