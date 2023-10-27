package servlet.manageUser;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

//primero definimos cual sera la url del servlet
@WebServlet("/logout")
public class LogOutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    //constructor autogenerado para sevlets
    public LogOutServlet() {
        super();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //referenciamos a la sesion actual
        HttpSession session = request.getSession();
        session.invalidate();

        //mandamos al usuario de vuelta al index sin registrar
        String url = "/index.jsp";

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}