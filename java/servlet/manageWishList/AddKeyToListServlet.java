package servlet.manageWishList;

import java.io.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import sources.*;
import sourcesDB.*;

//Primero definimos cual sera la url del servlet
@WebServlet("/addKeyToList")
public class AddKeyToListServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    //constructor autogenerado por eclipse para servlets
    public AddKeyToListServlet() {
        super();
    }

    //hacemos un Override a la funcion doGet(), porque usa el metodo get
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	//referenciamos a la sesion actual
    	HttpSession session = request.getSession();
    	
    	//buscamos la clave a añadir en la Base de Datos
    	Key key = KeyDB.getKey(request.getParameter("name"));
        String name = key.getName();
        String image = key.getImage();   //url en el src de la imagen
        String description = key.getDescription();
        float score = key.getScore();
        Platform platform = key.getPlatform();
        ArrayList<Tags> tags = key.getTags();
        ArrayList<Review> reviews = key.getReviews();
        ArrayList<Shop> shops = key.getShops();

        //creamos la Key
        Key newKey = new Key(name, image, description, score, platform, tags, shops);
        newKey.setReviews(reviews);
        newKey.calculatePrice(shops);

        //referenciamos al usuario actual de la sesion
        User user = (User) session.getAttribute("user");

        String url;
        
        //guardamos los identificadores del usuario y de la key a guardar
        int userID = UserDB.getUserID(user.getUserName());
        int keyID = KeyDB.getKeyID(name);
        
        //comprobamos si la Key no estaba en la lista ya
        if (!user.hasKeyInWishList(name)) {
        	//añadimos la clave a la lista del usuario
            user.addKeyToWishList(newKey);
            
            //Con el identificador de usuario y el de la clave, la metemos a la lista del usuario en la Base de Datos
            KeyDB.insertKeyOnWishList(userID, keyID);
            
            //mandamos al usuario a la lista de deseados para que vea el cambio
            url = "/saved.jsp";
        } else {
        	//si la key ya estaba en la lista del usuario, la eliminamos
        	user.removeKeyFromWishList(name);
        	KeyDB.removeKeyFromListDataBase(userID, keyID);
        	
        	//metemos currentKey en la sesion para poder mostrarla
        	session.setAttribute("currentKey", key);
        	
        	//mandamos al usuario a la displayKey de nuevo
        	url = "/displayKeyUser.jsp";
        }

        //mandamos el .jsp (que ahora tendra una estrella, y un popup de que se ha guardado en la lista?)
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}