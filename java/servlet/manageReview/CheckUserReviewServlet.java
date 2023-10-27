package servlet.manageReview;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import sources.*;

//primero definimos cual sera la url del servlet
@WebServlet("/checkUserReview")
public class CheckUserReviewServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    //contructor autogenerado para servlets
    public CheckUserReviewServlet() {
        super();
    }

    //hacemos un override al metodo doGet
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");     //nombre de la clave a guardar en la session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String url = "";

        //comprobamos si el usuario esta registrado, y si no lo esta lo mandamos a logearse
        if (user == null) {
            url = "/login.jsp";
        } else {
            //si esta registrado, almacenamos la key en la session bajo el nombre "key"
            Key key = (Key) session.getAttribute(name);
            session.setAttribute("key", key);
            if (key.hasReviews()) {
            	url = "/reviewList.jsp";
            } else {
            	url = "/reviewListEmpty.jsp";
            }
        }

        //mandamos al usuario a la url
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}