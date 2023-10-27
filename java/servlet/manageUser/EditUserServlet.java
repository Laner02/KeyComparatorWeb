package servlet.manageUser;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import sources.*;
import sourcesDB.*;

//primero definimos cual sera la url del servlet
@WebServlet("/editUser")
public class EditUserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    //contructor autogenerado para servlets
    public EditUserServlet() {
        super();
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //recibe los parametros de la request de modificar el perfil
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String location = request.getParameter("location");
        int phoneNumber = Integer.parseInt(request.getParameter("phoneNumber"));

        //referenciamos a la sesion actual y guardamos el usuario actual
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        //guardamos el ID del usuario actual
        int userID = UserDB.getUserID(user.getUserName());

        //cambiamos los atributos del usuario por los nuevos
        user.setFullName(fullName);
        user.setEmail(email);
        user.setUserName(userName);
        user.setPassword(password);
        user.setLocation(location);
        user.setPhoneNumber(phoneNumber);

        //modificamos la entrada del usuario en la base de datos
        UserDB.updateUser(userID, user);
        
        //metemos al nuevo usuario en la sesion (reemplazando el anterior objeto user)
        session.setAttribute("user", user);

        String url = "/profile.jsp";

        //mandamos al usuario a la pagina de perfil para que vea los cambios
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}