package servlet.manageOpinion;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import sources.*;
import sourcesDB.*;

//Primero definimos cual sera la url del servlet
@WebServlet("/submitOpinion")
public class SubmitOpinionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    //constructor autogenerado para servlets
    public SubmitOpinionServlet() {
        super();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String keyName = request.getParameter("keyName");
    	String opinionUserName = request.getParameter("userName");
        String shopName = request.getParameter("shopName");
        String description = request.getParameter("reviewBody");

        //referenciamos a la sesion y cogemos el usuario actual.
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");
        
        Opinion opinion = new Opinion(opinionUserName, description);

        //obtenemos sus identificadores
        int userID = UserDB.getUserID(opinionUserName);
        int shopID = ShopDB.getShopID(shopName);
        String url = "";

        //insertamos la opinion en la base de datos
        OpinionDB.insertReview(shopID, userID, opinion);
        Key currentKey = (Key) session.getAttribute(keyName);
        // falta aqui meter la opinion dentro de la tienda especifica, pero para eso necesitamos el numero de tienda que representa el nombre
        
        session.setAttribute("key", currentKey);	//metemos en la sesion la key para poder mostrarla
        
        
        url = "/opinionList.jsp";
        
        //mandamos al usuario a la url
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}