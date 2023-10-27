package servlet.searchBar;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import sources.*;
import sourcesDB.*;

//Primero definimos cual sera la url del servlet
@WebServlet("/searchBarServlet")
public class SearchBarServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    //constructor autogenerado para servlets
    public SearchBarServlet() {
        super();
    }

 
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String url="";

        //Se coge el parametro del input con nombre search
        String search=request.getParameter("search");
        
        //Referenciamos a la sesion actual, guardamos en un objeto user el usuario actual
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        Key clave = KeyDB.getKey(search);

        //Si la clave es null quiere decir que no se encuentra o que hubo error de conexion
        
        if(clave==null){
            
        	//comprobamos si el usuario que manda la peticion ha iniciado sesion para elegir el jsp
        	if (user == null) {
        		url = "/keyNotFound.jsp";
        	} else {
        		url="/keyNotFoundUser.jsp"; //Actualizamos la URL al .jsp de que no se ha encontrado la clave
        	}

        }

        //Si no, se ha encontrado la clave
        else{
        	
            url="/accessKey?name=" + search; //Le mandamos la peticion a accessKey

        }


        //Enviamos la respuesta
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }
}