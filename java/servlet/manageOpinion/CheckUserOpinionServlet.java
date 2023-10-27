package servlet.manageOpinion;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import sources.*;
import sourcesDB.*;

//primero definimos cual sera la url del servlet
@WebServlet("/checkUserOpinion")
public class CheckUserOpinionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    //constructor autogenerado para servlets
    public CheckUserOpinionServlet() {
        super();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String keyName = request.getParameter("keyName");       //nombre de la clave
        String shopName = request.getParameter("shop");
        int shopType = Integer.parseInt(shopName);

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String url = "";

        //comprobamos si el usuario esta registrado, si no lo mandamos a login
        if (user == null) {
            url = "/login.jsp";
        } else {
            //si esta registrado, almacenamos la key y la pasamos al jsp
            Key key = sourcesDB.KeyDB.getKey(keyName);
            //request.setAttribute("key", key);           //almacenamos la key en el request para el jsp de la vista
            session.setAttribute("key", key);		 	  //almacenamos la key en la sesion
            if (key.getShops().get(shopType).hasOpinions()) {
                //si la tienda tiene opiniones, las mostramos
                url = "/opinionList.jsp";
            } else {
                url = "/opinionListEmpty.jsp";
            }

            //se manda el nombre de la tienda a consultar
            if (shopType == 0)
                session.setAttribute("shopName", "Gamivo");
            else if (shopType == 1)
                session.setAttribute("shopName", "Eneba");
            else
                session.setAttribute("shopName", "InstantGaming");
            
            //se manda el tipo de tienda por request tambien
            session.setAttribute("shopType", shopType);
        }

        //mandamos al usuario a la url corresponiente
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}