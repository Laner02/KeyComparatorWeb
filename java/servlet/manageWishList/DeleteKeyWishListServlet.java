package servlet.manageWishList;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import sources.*;
import sourcesDB.*;

//Primero definimos cual sera la url del servlet
@WebServlet("/deleteKeyWishList")
public class DeleteKeyWishListServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    //constructor autogenerado para servlets
    public DeleteKeyWishListServlet() {
        super();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String keyName = request.getParameter("name");

        //referenciamos a la sesion y amacenamos el usuario actual que ha mandado la peticion
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        //Obtenemos los identificadores del usuario y de la key a eliminar
        int userID = UserDB.getUserID(user.getUserName());
        int keyID = KeyDB.getKeyID(keyName);

        //eliminamos la key de la lista del usuario en la sesion
        user.removeKeyFromWishList(keyName);
        
        //eliminamos la key de la lista del usuario en la BD
        KeyDB.removeKeyFromListDataBase(userID, keyID);

        //mandamos al usuario al servlet de checkWishList para que se encargue de reenviar a la lista de guardados
        String url = "/checkWishList";

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}