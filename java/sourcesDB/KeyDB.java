package sourcesDB;

import java.sql.*;
import java.util.ArrayList;
import database.*;
import sources.*;

/**
 * Clase que permite la funcionalidad y conexi�n a la Base de Datos con las Keys a trav�s
 * de metodos que conectan a ella.
 * @author Raul Villa
 *
 */
public class KeyDB {

	/**
	 * Inserta una Key en la lista personal del usuario que manda la peticion de guardar la key.
	 * @param userID Identificador del usuario que pide guardar la key.
	 * @param keyID Identificador de la key a guardar en la lista del usuario.
	 * @return Un valor entero positivo si la consulta se lleva a cabo, 0 si ha ocutiido algun error.
	 */
	public static int insertKeyOnWishList(int userID, int keyID) {
        //Establecemos conexion con la base de datos
        ConnectionPool pool = ConnectionPool.getInstance();

        //Preparamos la consulta
        PreparedStatement ps = null;
        String query="INSERT INTO Lista(u_id, p_id) VALUES(?, ?)";

        try {
            Connection connection = pool.getConnection();
            ps = connection.prepareStatement(query);
            ps.setInt(1, userID);
            ps.setInt(2, keyID);
            int result = ps.executeUpdate();
            ps.close();
            pool.closeConnection(connection);
            return result;
        } catch (SQLException sqle) {
            //si devuelve un 0 es que ha dado error en base de datos
            sqle.printStackTrace();
            return 0;
        }
    }
	
	/**
	 * Elimina una Key de la lista personal del usuario que manda la peticion de eliminarla.
	 * La key deber� estar en la lista para poder eliminarla.
	 * @param userID Identificador del usuario que pide eliminar la key.
	 * @param keyID Identificador de la key a eliminar en la lista del usuario.
	 * @return Un valor entero positivo si la consulta se lleva a cabo, 0 si ha ocutiido algun error.
	 */
	public static int removeKeyFromListDataBase(int userID, int keyID) {
        //Establecemos conexion con la base de datos
        ConnectionPool pool = ConnectionPool.getInstance();

        //Preparamos la consulta
        PreparedStatement ps = null;
        String query="DELETE FROM Lista WHERE u_id=? AND p_id=?";		//se usa un AND para que se cumplan ambas condiciones

        try {
            Connection connection = pool.getConnection();
            ps = connection.prepareStatement(query);
            ps.setInt(1, userID);
            ps.setInt(2, keyID);
            int result = ps.executeUpdate();
            ps.close();
            pool.closeConnection(connection);
            return result;
        } catch (SQLException sqle) {
            //si el borrado retorna 0, es que ha fallado
            sqle.printStackTrace();
            return 0;
        }
    }
	
	/**
	 * Comprueba si la key existe en la base de datos de keys de la aplicaci�n web.
	 * @param name Nombre de la key a buscar en la base de datos.
	 * @return True si se encuentra la key, false si no.
	 */
    public static boolean keyExists(String name) {
        //Establecemos conexion con la base de datos
        ConnectionPool pool = ConnectionPool.getInstance();

        //Preparamos la consulta
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT nombre FROM Producto WHERE nombre = ?";

        try {
        	Connection connection = pool.getConnection();
            ps = connection.prepareStatement(query);
            ps.setString(1, name);
            rs = ps.executeQuery();
            boolean result = rs.next();
            rs.close();
            ps.close();
            pool.closeConnection(connection);
            return result;
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            return false;
        }
    }
    
    /**
     * Obtiene una key de la base de datos por el nombre de la misma.
     * La key deber� estar en la base de datos para poder devolverla.
     * @param name Nombre de la key a obtener.
     * @return Un objeto Key con la key buscada.
     */
    public static Key getKey(String name) {
        //Establecemos conexion con la base de datos a traves de ConnectionPool
        ConnectionPool pool = ConnectionPool.getInstance();

        //Preparamos la consulta
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM Producto WHERE nombre = ?";

        try {
        	Connection connection = pool.getConnection();
            ps = connection.prepareStatement(query);
            ps.setString(1, name);
            rs = ps.executeQuery();
            Key key = null;
            int keyID = -1;
            if (rs.next()) {
                keyID = rs.getInt("p_id");
            	
                ArrayList<Tags> tags = new ArrayList<>();
                ArrayList<Shop> shops = addKeyShops(keyID);
                key = new Key(
                		rs.getString("nombre"),
                        rs.getString("imagen"),
                        rs.getString("descripcion"),
                        rs.getFloat("valoracion"),
                        Platform.valueOf(rs.getString("plataforma").toUpperCase()),
                        tags,
                        shops
                );
            }
            rs.close();
            ps.close();
            pool.closeConnection(connection);
            
            if (key != null) {
            	ArrayList<Tags> tags = addKeyTags(keyID);
            	key.setTags(tags);
            }
            
            if (key != null) {
            	ArrayList<Review> reviews = addKeyReviews(keyID);
            	key.setReviews(reviews);
            }
            
            return key;
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            return null;
        }
    }
    
    /**
     * Obtiene una key de la base de datos por el identificador de la misma.
     * La key deber� estar en la base de datos para poder devolverla.
     * @param keyID Identificador �nico de la key a devolver.
     * @return Un objeto Key con la key buscada.
     */
    public static Key getKeyByIndex(int keyID) {
    	//Establecemos conexion con la base de datos
    	ConnectionPool pool = ConnectionPool.getInstance();
    	
    	//Preparamos la consulta
    	PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM Producto WHERE p_id = ?";
        
        try {
        	Connection connection = pool.getConnection();
        	ps = connection.prepareStatement(query);
        	ps.setInt(1, keyID);
        	rs = ps.executeQuery();
        	Key key = null;
        	if (rs.next()) {
        		keyID = rs.getInt("p_id");
            	
                ArrayList<Tags> tags = new ArrayList<>();
                ArrayList<Shop> shops = addKeyShops(keyID);
        		//si lo encuentra, lo creamos y lo devolvemos
        		key = new Key(
        				rs.getString("nombre"),
        				rs.getString("imagen"),
        				rs.getString("descripcion"),
        				rs.getFloat("valoracion"),
        				Platform.valueOf(rs.getString("plataforma").toUpperCase()),
        				tags,
        				shops
        				);
        	}
        	rs.close();
        	ps.close();
        	pool.closeConnection(connection);
        	
        	if (key != null) {
        		ArrayList<Tags> tags = addKeyTags(keyID);
        		key.setTags(tags);
        	}
        	
        	if (key != null) {
        		ArrayList<Review> reviews = addKeyReviews(keyID);
        		key.setReviews(reviews);
        	}
        	
        	return key;
        } catch (SQLException sqle) {
        	//si devuelve null es o que no ha encontrado la key o que ha ocurrido un error con la BD
        	sqle.printStackTrace();
        	return null;
        }
    }
    
    /**
     * Obtiene el identificador �nico de una key por su nombre.
     * La key deber� estar en la base de datos para poder devolverla.
     * @param keyName Nombre de la key de la que se quiere encontrar el identificador.
     * @return Un entero con el identificador de la key buscada.
     */
    public static int getKeyID(String keyName) {
        //Establecemos conexion con la base de datos
        ConnectionPool pool = ConnectionPool.getInstance();

        //Preparamos la consulta
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query="SELECT * FROM Producto WHERE nombre = ?";
        int keyID = -1;

        try {
            Connection connection = pool.getConnection();
            ps = connection.prepareStatement(query);
            ps.setString(1, keyName);
            rs = ps.executeQuery();
            if(rs.next())
            	keyID = rs.getInt("p_id");
            rs.close();
            ps.close();
            pool.closeConnection(connection);
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }

        return keyID;
    }
    
    /**
     * Obtiene una lista con las etiquetas de una clave, buscada por su identificador.
     * El identificador de la clave deber� existir en la tabla de Etiquetas.
     * @param keyID Identificador de la key de la que se obtendr�n las etiquetas.
     * @return ArrayList con la lista de etiquetas que tiene asociada esa key.
     */
    private static ArrayList<Tags> addKeyTags(int keyID) {
    	ArrayList<Tags> tagsDB = new ArrayList<>();
    	
    	//Establecemos conexion con la base de datos
    	ConnectionPool pool = ConnectionPool.getInstance();
    	
    	//preparamos la consulta
    	PreparedStatement ps = null;
    	ResultSet rs = null;
    	String query="SELECT * FROM Etiqueta WHERE p_id = ?";
    	
    	try {
    		Connection connection = pool.getConnection();
    		ps = connection.prepareStatement(query);
    		ps.setInt(1, keyID);
    		rs = ps.executeQuery();
    		while (rs.next()) {
    			//mientras encuentre una etiqueta asociada a la key, la inserta en la lista de tags
    			tagsDB.add(Tags.valueOf(rs.getString("tipo").toUpperCase()));
    		}
    		rs.close();
    		ps.close();
    		pool.closeConnection(connection);
    		
    		return tagsDB;
    	} catch (SQLException sqle) {
    		//si devuelve null es que ha ocurrido un error en la base de datos
    		sqle.printStackTrace();
    		return null;
    	}
    }
    
    /**
     * M�todo privado que obtiene una lista con las rese�as de una clave, buscada por su identificador.
     * El identificador de la clave deber� existir en la tabla de Resenas,
     * @param keyID Identificador de la key de la que se obtendr�n las rese�as.
     * @return ArrayList con la lista de rese�as que tiene asociadas esa key.
     */
    private static ArrayList<Review> addKeyReviews(int keyID) {
    	ArrayList<Review> reviewsDB = new ArrayList<>();
    	
    	//Establecemos conexion con la base de datos
    	ConnectionPool pool = ConnectionPool.getInstance();
    	
    	//preparamos la consulta
    	PreparedStatement ps = null;
    	ResultSet rs = null;
    	String query="SELECT * FROM Resena WHERE p_id = ?";
    	
    	try {
    		Connection connection = pool.getConnection();
    		ps = connection.prepareStatement(query);
    		ps.setInt(1, keyID);
    		rs = ps.executeQuery();
    		while (rs.next()) {
    			int userID = rs.getInt("u_id");				//recibimos el identiificador de usuario tambien
    			
    			//mientras encuentre una rese�a para la key, la inserta en la lista
    			Review currentReview = new Review(
    					rs.getString("titulo"),
    					rs.getString("descripcion"),
    					rs.getFloat("valoracion"),
    					UserDB.getUserNameDB(userID)	//metemos el userName del usuario asociado
    					);
    			
    			reviewsDB.add(currentReview);
    		}
    		rs.close();
    		ps.close();
    		pool.closeConnection(connection);
    		
    		return reviewsDB;
    	} catch (SQLException sqle) {
    		//si devuelve null es que ha ocurrido un error en base de datos (si no la enceuntra devuelve arriba un arraylist vacio)
    		sqle.printStackTrace();
    		return null;
    	}
    }
    
    //TODO javadoc hacer
    private static ArrayList<Shop> addKeyShops(int keyID) {
        ArrayList<Shop> shopsDB = new ArrayList<>();

        //Establecemos conexion con la base de datos
        ConnectionPool pool = ConnectionPool.getInstance();

        //preparamos la consulta
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query="SELECT * FROM Tienda WHERE p_id = ?";

        try {
            Connection connection = pool.getConnection();
            ps = connection.prepareStatement(query);
            ps.setInt(1, keyID);
            rs = ps.executeQuery();
            while (rs.next()) {
            	int shopID = rs.getInt("t_id");
            	
                ArrayList<Opinion> opinions = OpinionDB.getOpinions(shopID);
                //mientras encuentre una tienda asociada a la key, la inserta en la lista y sigue
                Shop currentShop = new Shop(
                        rs.getString("nombre"),
                        rs.getString("enlace"),
                        rs.getDouble("precio"),
                        rs.getString("imagen"),
                        opinions
                );

                shopsDB.add(currentShop);
            }
            rs.close();
            ps.close();
            pool.closeConnection(connection);

            return shopsDB;
        } catch (SQLException sqle) {
            //si devuelve null en la lista es que ha ocurrido error en base de datos, si esta vacia es que no ha encontrado tiendas
            sqle.printStackTrace();
            return null;
        }
    }
}