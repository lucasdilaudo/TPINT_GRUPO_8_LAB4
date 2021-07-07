package Servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.Session;

import Dao.CuentaDao;
import Negocio.NegocioCliente;
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
		
		if(request.getParameter("IraListar")!=null) {
			ArrayList<Cuenta> ac =	NegocioCuenta.ObtenerTodo();
			ArrayList<Cuenta> nuevo = new ArrayList<>(); //este obtendra los que no tienen cliente con baja
			String[] Nombres = new String[ac.size()];
			for (Cuenta cuenta : ac) {
				
			
				if(NegocioCliente.ObtenerCliente(cuenta.getDNICliente()).getEstado()) {
					nuevo.add(cuenta);
					Nombres[ac.indexOf(cuenta)] = NegocioCliente.ObtenerCliente(cuenta.getDNICliente()).getUsuario();
				}
				
				
				
			}
			request.setAttribute("Nombres", Nombres);
			
			request.setAttribute("ListadeCuentas", nuevo);
			
			RequestDispatcher rd = request.getRequestDispatcher("ABML Cuentas/ListarCuenta.jsp");
			rd.forward(request, response);
			
		}
		
		
		if(request.getParameter("IraMod")!=null) {
			Cuenta c = NegocioCuenta.ObtenerCuenta(request.getParameter("CBU"), request.getParameter("NrodeCuenta"));
			request.setAttribute("Cuenta", c );
			RequestDispatcher rd = request.getRequestDispatcher("/ABML Cuentas/ModificarCuenta.jsp");
			rd.forward(request, response);
			
		}
		
		
		
		
		if(request.getParameter("btnGuardarCuenta")!=null)
	    {
		     Cuenta c = new Cuenta();
		     c.setNroCuenta(request.getParameter("txtNrodeCuenta"));
		     c.setCBU(request.getParameter("txtCBU"));
		     c.setTipoDeCuenta(Integer.parseInt(request.getParameter("tipodeCuenta")));
		     c.setDNICliente(request.getParameter("txtDni"));
		     c.setFechaCreacion(fecha.getYear()+"-"+fecha.getMonthValue()+"-"+fecha.getDayOfMonth());
		     c.setSaldo(10000);
		    
		   String Mensaje;
		    if(!NegocioCliente.Existe(c.getDNICliente())) {
		      Mensaje = "No existe un cliente con el DNI ingresado";
		    }
		    else {
			   if(NegocioCuenta.Existe(c.getCBU(), c.getNroCuenta())) {
				   Mensaje = "Ya existe una cuenta con el CBU y Numero de Cuenta Ingresados";
				  
			   }
			   else {
				   if(NegocioCuenta.CantidadCuentas(c.getDNICliente())==3) {
					   	Mensaje = "El cliente con el nuevo DNI ingresado ya posee el limite de cuentas permitido(3)";
				   }
				   else {
					   if	(NegocioCuenta.AgregarCuenta(c)){
					   Mensaje = "Cuenta agregada con exito";
					   }
					   else Mensaje = "No se pudo agregar";
				   }
				}
			
		    }
			
			
			
			//REQUESTDISPACHER
			request.setAttribute("Mensaje", Mensaje);
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
			String dniantiguo = request.getParameter("hiddenDniAntiguo");
			c.setCBU(request.getParameter("hiddenCBU"));
			c.setNroCuenta(request.getParameter("hiddenNrodeCuenta"));
			c.setDNICliente(request.getParameter("txtDni"));
			c.setTipoDeCuenta( Integer.parseInt(request.getParameter("selectTipodeCuenta")));
			c.setSaldo( Double.parseDouble(request.getParameter("txtSaldo")));
			String Mensaje;
		    if(!NegocioCliente.Existe(c.getDNICliente())) {
			      Mensaje = "No existe un cliente con el DNI ingresado";
			}
		    else {
		    	if(!dniantiguo.equals(c.getDNICliente())) {
					if(NegocioCuenta.CantidadCuentas(c.getDNICliente())==3) {
					   	Mensaje = "El cliente excedio la cantidad permitida de cuentas (3)";
					}
					else {
						   if	(NegocioCuenta.ModificarCuenta(c)){
							   Mensaje = "Cuenta modificada con exito";
							   }
							   else Mensaje = "No se pudo modificar";
						   
						
					}
					
					
		    	}
				else {
				   if	(NegocioCuenta.ModificarCuenta(c)){
					   Mensaje = "Cuenta modificada con exito";
					   }
					   else Mensaje = "No se pudo modificar";
						
				}
		    }
			
			request.setAttribute("Mensaje", Mensaje);
			
			RequestDispatcher rd = request.getRequestDispatcher("ABML Cuentas/ModificarCuenta.jsp");
			rd.forward(request, response);
			
		}
		
		
		
		
	}

}
