package servlet.manageUser;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import sources.*;
import sourcesDB.*;

//Primero definimos cual sera la url del servlet
@WebServlet("/registerUser")
public class RegisterUserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	//constructor autogenerado por eclipse para servlets
	public RegisterUserServlet() {
		super();
	}
	
    //hacemos un override a la funcion doPost(), para hacer lo que queramos nosotros
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String location = request.getParameter("location");
        int phoneNumber = Integer.parseInt(request.getParameter("phoneNumber"));
        
        User user = new User(userName, password, fullName, email, location, phoneNumber);
        String url = "";
        
        if (UserDB.userNameExists(userName)) {
        	url = "/registerFail.jsp";
        } else {
        	//creamos o referenciamos la sesion, y metemos el usuario como atributo de la misma
        	HttpSession session = request.getSession();
            session.setAttribute("user", user);
            
            //añadimos el usuario a la Base de Datos
            UserDB.insert(user);
            
            //mandamos al usuario a la pagina principal
            url = "/displayHot.jsp";
        }

        //mandamos el .jsp
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}