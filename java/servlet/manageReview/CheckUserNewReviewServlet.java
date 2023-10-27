package servlet.manageReview;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import sources.*;

//primero definimos la url del servlet
@WebServlet("/checkUserNewReview")
public class CheckUserNewReviewServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    //constructor autogenerado para servlets
    public CheckUserNewReviewServlet() {
        super();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String keyName = request.getParameter("keyName");
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");
        String url = "";

        //comprobamos si el usuario esta registrado para poder hacer una nueva review
        if (currentUser == null) {
            url = "/login.jsp";
        } else {
            //si esta registrado, almacenamos la key en la sesion bajo el nombre "key"
            Key key = (Key) session.getAttribute(keyName);
            session.setAttribute("key", key);
            url = "/displayNewReview.jsp";
        }

        //mandamos al usuario a la url
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}