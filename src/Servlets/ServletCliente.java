package Servlets;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Negocio.NegocioCliente;
import entidades.Cliente;


/**
 * Servlet implementation class ServletCliente
 */
@WebServlet("/ServletCliente")
public class ServletCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCliente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LocalDate fecha = LocalDate.now();
		
		if(request.getParameter("btnguardarCliente")!=null)
	    {
			
			
		     Cliente c = new Cliente();
		     c.setDni(request.getParameter("txtDni"));
		     c.setCUIL(request.getParameter("txtCuil"));
		     c.setNombre(request.getParameter("txtNombre"));
		     c.setApellido(request.getParameter("txtApellido")); 
		     c.setSexo(Integer.parseInt(request.getParameter("ddlSexo")));
		     c.setNacionalidad(request.getParameter("txtNacionalidad"));
		     //c.setFecha(request.getParameter("txtAnio")+"-"+request.getParameter("txtMes")+"-"+request.getParameter("txtDia"));  
		     c.setFecha(fecha.getYear()+"-"+fecha.getMonthValue()+"-"+fecha.getDayOfMonth());
		     c.setDireccion(request.getParameter("txtDireccion"));
		     c.setLocalidad(request.getParameter("txtLocalidad"));
		     c.setProvincia(request.getParameter("txtProvincia"));
		     c.setCorreo(request.getParameter("txtCorreo"));
		     c.setTelefono(request.getParameter("txtTelefono")); 
		     c.setUsuario(request.getParameter("txtUsuario"));
		     c.setContrasenia(request.getParameter("txtContrasenia"));
		     	     
		     
		     
		     
		    boolean Agregado = NegocioCliente.AgregarCliente(c);
			
			
			
			//REQUESTDISPACHER
			request.setAttribute("Agregado", Agregado);
			RequestDispatcher rd = request.getRequestDispatcher("ABML Clientes/AltaCliente.jsp");
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