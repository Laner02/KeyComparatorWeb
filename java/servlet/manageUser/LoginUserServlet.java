package servlet.manageUser;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import sources.*;
import sourcesDB.*;

//Primero definimos cual sera la url del servlet
@WebServlet("/loginUser")
public class LoginUserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    //constructor autogernerado para servlets
    public LoginUserServlet() {
        super();
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        String url = "";

        //comprobamos que el usuario no sea null
        if (!UserDB.userNameExists(userName)) {
            //si no habia usuario lo mandamos a la pagina de relogearse
            url = "/loginFail.jsp";
        } else {
        	User user = UserDB.getUser(userName);
        	//comprobamos que las contraseñas coincidan
            if (user.comparePassword(password)) {
                /*Si los datos coinciden, guardamos el usuario en la sesion actual y lo mandamos a
                 * la pagina principal, donde ve su userName y entiende que se ha logedado con exito*/
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
            	url = "/displayHot.jsp";
            } else {
                url = "/loginFail.jsp";
            }
        }

        //mandamos al usuario a la pagina de inicio o a relogearse si ha ocurrido un error
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}