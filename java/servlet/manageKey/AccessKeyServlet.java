package servlet.manageKey;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import sources.*;
import sourcesDB.*;

//Primero definimos cual sera la url del servlet
@WebServlet("/accessKey")
public class AccessKeyServlet extends HttpServlet {

    private static  final long serialVersionUID = 1L;

    //constructor autogenerado para servlets
    public AccessKeyServlet() {
        super();
    }
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");

        //Consultamos la Key que nos piden en la Base de Datos
        Key key = KeyDB.getKey(name);

        //referenciamos a la sesion actual
        HttpSession session = request.getSession();
        session.setAttribute(name, key);				//metemos en la sesion otro objeto key pero este es para funcionalidad del controlador
        session.setAttribute("currentKey", key);        //metemos un objeto Key en la sesion con un nombre para poder personalizar la pagina
        //referenciamos al usuario actual de la sesion, si es que lo hay
        User user = (User) session.getAttribute("user");

        //podemos ponerle un campo extra a las Key que sea su codeName, para guardarlas y sacarlas de la sesion y la BD
        String url = "";
        
        //comprobamos si hay un usuario logeado o no, y lo mandamos a un jsp dependiendo de ello
        if (user == null) {
        	url = "/displayKey.jsp";
        } else {
        	url = "/displayKeyUser.jsp";
        }

        //mandamos al usuario a la pagina del juego deseada
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}