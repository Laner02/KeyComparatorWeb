package servlet.manageWishList;

import java.io.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import sources.*;

//Primero definimos cual sera la url del servlet
@WebServlet("/checkWishList")
public class CheckWishListServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    //constructor autogenerado para servlets
    public CheckWishListServlet() {
        super();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        ArrayList<Key> wishList = user.getWishList();

        String url = "";

        //comprobamos si la wishList esta vacia o no
        if (wishList.isEmpty()) {
            url = "/savedEmpty.jsp";
        } else {
            url = "/saved.jsp";
        }

        //mandamos al usuario a una de las 2 posibles paginas jsp, dependiendo de la lista
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}