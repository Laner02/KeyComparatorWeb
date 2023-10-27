package servlet.manageUser;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import sources.*;

//primero definimos cual sera la url del servlet
@WebServlet("/checkUser")
public class CheckUserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    //constructor autogenerado para servlets
    public CheckUserServlet() {
        super();
    }

    //hacemos un override al metodo doGet()
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");     //nombre de la Key a guardar
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String url = "";

        //ponemos una url distinta dependiendo de si esta registrado o no
        if (user == null) {
            //si no hay un usuario en la sesion, lo mandamos a iniciar sesion
            url = "/login.jsp";
        } else {
            //si esta registrado, lo mandamos al servlet que guarda la key en la wishList, junto con un campo con el nombre de la key, para que la busque en la sesion
            url = "/addKeyToList?name=" + name;
        }

        //mandamos al usuario a la url
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}