package servlet.manageMore;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import sources.*;

//Primero definimos cual sera la url del servlet
@WebServlet("/checkUserMore")
public class CheckUserMoreServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    //contructor autogenerado para servlets
    public CheckUserMoreServlet() {
        super();
    }

    @Override
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        //referenciamos la sesion actual y comprobamos si hay un usuario logeado
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        String url = "";

        if (user == null) {
            url = "/more.jsp";
        } else {
            url = "/moreUser.jsp";
        }

        //mandamos al usuario a la pagina corresponiente
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}