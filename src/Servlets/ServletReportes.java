package Servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controles.Validarfecha;
import Dao.ReportesDao;
import Excepciones.FechaException;
import Negocio.NegocioCliente;
import Negocio.NegocioReportes;

/**
 * Servlet implementation class ServletReportes
 */
@WebServlet("/ServletReportes")
public class ServletReportes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletReportes() {
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
		if(request.getParameter("btnBuscar1")!=null) {
			ArrayList<String[]> ar = NegocioReportes.Reportepormeses(Integer.parseInt(request.getParameter("txtAnio").toString()));
			request.setAttribute("Tablamontopormes", ar);
			RequestDispatcher rd = request.getRequestDispatcher("Reportes.jsp");
			rd.forward(request, response);
		}
		
		if(request.getParameter("btnBuscar2")!=null) {
			try {
				String fecha1 = request.getParameter("fechaInicio");
				String fecha2 = request.getParameter("fechaFin");
				Validarfecha.ValidarFecha(fecha1);
				Validarfecha.ValidarFecha(fecha2);
				ArrayList<String[]> ar = NegocioReportes.Clientesquemaspidieron(adaptarfecha(fecha1), adaptarfecha(fecha2));
				request.setAttribute("Tablaclientesquemaspidieron", ar);
			}catch(FechaException e) {
				e.printStackTrace();
				request.setAttribute("Mensaje2", "Ingrese una fecha valida");
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("Reportes.jsp");
			rd.forward(request, response);
			
		}
		
	}
	
	private String adaptarfecha(String fecha) {
		String[] campos = fecha.split("/");
		
		
		
		return campos[2]+"-"+campos[1]+"-"+campos[0];
	}
	
	
}
