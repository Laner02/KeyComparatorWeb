package servlet.manageReview;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import sources.*;
import sourcesDB.*;

//Primero definimos cual sera la url del servlet
@WebServlet("/submitReview")
public class SubmitReviewServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    //constructor autogenerado para servlets
    public SubmitReviewServlet() {
        super();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String keyName = request.getParameter("keyName");
        String title = request.getParameter("reviewTitle");
        String description = request.getParameter("reviewBody");
        Float score = Float.parseFloat(request.getParameter("reviewScore"));

        //referenciamos a la sesion y cogemos el usuario actual.
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");
        
        // hacer aqui un try catch para comprobar que los parametros sean correctos y si no lo son lo mandamos a una pagina de error al crear reseña???
        Review review = new Review(title, description, score, currentUser.getUserName());

        //obtenemos sus identificadores
        int userID = UserDB.getUserID(currentUser.getUserName());
        int keyID = KeyDB.getKeyID(keyName);
        String url = "";

        if (ReviewDB.reviewExists(userID, keyID)) {
        	Key currentKey = (Key) session.getAttribute(keyName);
        	session.setAttribute("key", currentKey);	//metemos en la sesion la key para poder mostrarla
            url = "/displayNewReviewFail.jsp";
        } else {
        	//intertamos la reseña en la Base de Datos
        	ReviewDB.insertReview(userID, keyID, review);
            //referenciamos a la sesion, y añadimos a la lista de reseñas del usuario la nueva
            Key currentKey = (Key) session.getAttribute(keyName);
            currentKey.addReview(review);
            session.setAttribute("key", currentKey);	//metemos en la sesion la key para poder mostrarla
            currentUser.addReview();                    //sumamos 1 al contador de reseñas realizadas por el usuario
            session.setAttribute("user", currentUser);	//actualizamos el usuario en la sesion para que se vea el contador de reviews
            url = "/reviewList.jsp";
        }
        
        //mandamos al usuario a la url
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}