package sourcesDB;

import java.sql.*;
import java.util.ArrayList;
import database.*;
import sources.*;

public class UserDB {

    //metodo para insertar un usuario en la DB, solo inserta un usuario en la tabla de usuarios, no las listas
    public static int insert(User user) {
        //Establecemos conexion con la base de datos a traves de ConnectionPool
        ConnectionPool pool = ConnectionPool.getInstance();
    	
        //Preparamos la consulta
        PreparedStatement ps = null;
        //en la consulta para insertar un usuario no ahce falta el identificador de la primera col, se incrementa solo
        String query="INSERT INTO UsuarioRegistrado(nombreCompleto, email, usuario, contrasena, localizacion, telefono, admin) VALUES(?,?,?,?,?,?,?)";

        try {
        	//referenciamos la conexion desde la instancia de ConnectionPool, dentro de try catch
        	Connection connection = pool.getConnection();
            ps = connection.prepareStatement(query);
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getUserName());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getLocation());
            ps.setInt(6, user.getPhoneNumber());
            ps.setBoolean(7, user.isAdmin());
            int result = ps.executeUpdate();
            ps.close();
            pool.closeConnection(connection);
            return result;
        } catch (SQLException e) {
        	//Si devuelve 0 es que ha fallado la base de datos ojo
            e.printStackTrace();
            return 0;
        }
    }

    public static boolean userNameExists(String userName) {
        //Establecemos conexion con la base de datos
        ConnectionPool pool = ConnectionPool.getInstance();
    	
        //Preparamos la consulta
        PreparedStatement ps = null;
        ResultSet rs = null;        //resultado de la peticion
        String query="SELECT usuario FROM UsuarioRegistrado WHERE usuario = ?";

        try {
        	Connection connection = pool.getConnection();
            ps = connection.prepareStatement(query);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            boolean result = rs.next();
            rs.close();
            ps.close();
            pool.closeConnection(connection);
            return result;
        } catch (SQLException e) {
        	//si devuelve false es que no ha encontrado el usuario o que ha habido error en BD
            e.printStackTrace();
            return false;
        }
    }

    public static User getUser(String userName) {
        //Establecemos conexion con la base de datos
        ConnectionPool pool = ConnectionPool.getInstance();
    	
        //Preparamos la consulta
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query="SELECT * FROM UsuarioRegistrado WHERE usuario = ?";

        try {
        	Connection connection = pool.getConnection();
            ps = connection.prepareStatement(query);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            User user = null;
            int userID = -1;		//inicializamos a -1, porque no habra ese indice en la BD
            if (rs.next()) {
                //Creamos el usuario encontrado
            	user = new User(
                        rs.getString("usuario"),
                        rs.getString("contrasena"),
                        rs.getString("nombreCompleto"),
                        rs.getString("email"),
                        rs.getString("localizacion"),
                        rs.getInt("telefono")
                );
                //guardamos el int que nos dice el identificador del usuario
            	userID = rs.getInt("u_id");
            	//ahora tenemos que buscar la lista que corresponde a ese u_id
            }
            rs.close();
            ps.close();
            pool.closeConnection(connection);
            
            //si ha encontrado un usuario, le buscamos la lista de guardados, y se la ponemos
            if (user != null) {
            	ArrayList<Key> wishList = addUserWishList(userID);
            	user.setWishList(wishList);
            }
            
            return user;
        } catch (SQLException e) {
        	//si devuelve null es que no lo ha encontrado o que ha ocurrido un error con la BD
            e.printStackTrace();
            return null;
        }
    }
    
    public static int getUserID(String userName) {
    	//Establecemos conexion con la base de datos
    	ConnectionPool pool = ConnectionPool.getInstance();
    	
    	//preparamos la consulta
    	PreparedStatement ps = null;
    	ResultSet rs = null;
    	String query="SELECT * FROM UsuarioRegistrado WHERE usuario = ?";
    	int userID = -1;
    	
    	try {
    		Connection connection = pool.getConnection();
    		ps = connection.prepareStatement(query);
    		ps.setString(1, userName);
    		rs = ps.executeQuery();
    		if (rs.next())						//si esta el usuario
    			userID = rs.getInt("u_id");		//se puede hacer haciendo que rs sea el int directamente buscando en la col u_id?
    		rs.close();
    		ps.close();
    		pool.closeConnection(connection);
        	return userID;
    	} catch (SQLException sqle) {
    		sqle.printStackTrace();
    		return -1;
    	}

    }
    
    //metodo para obtener el nombre de usuario del id de usuario recibido.
    public static String getUserNameDB(int userID) {
    	//Establecemos conexion con la base de datos
    	ConnectionPool pool = ConnectionPool.getInstance();
    	
    	//Preparamos la consulta
    	PreparedStatement ps = null;
    	ResultSet rs = null;
    	String query="SELECT * FROM UsuarioRegistrado WHERE u_id=?";
    	String userNameDB = null;
    	
    	try {
    		Connection connection = pool.getConnection();
    		ps = connection.prepareStatement(query);
    		ps.setInt(1, userID);
    		rs = ps.executeQuery();
    		if (rs.next())
    			userNameDB = rs.getString("usuario");
    		rs.close();
    		ps.close();
    		pool.closeConnection(connection);
    	} catch (SQLException sqle) {
    		sqle.printStackTrace();
    		//Si devuelve null es que ha habido error en base de datos o no lo ha encontrado
    	}
    	
    	return userNameDB;
    }
    
    public static int updateUser(int userID, User user) {
    	//Establecemos conexion con la base de datos
    	ConnectionPool pool = ConnectionPool.getInstance();
    	
    	//preparamos la consulta
    	PreparedStatement ps = null;
    	String query="UPDATE UsuarioRegistrado SET nombreCompleto=?, email=?, usuario=?, contrasena=?, localizacion=?, telefono=? WHERE u_id = ?";
    	
    	try {
    		Connection connection = pool.getConnection();
    		ps = connection.prepareStatement(query);
    		ps.setString(1, user.getFullName());
    		ps.setString(2, user.getEmail());
    		ps.setString(3, user.getUserName());
    		ps.setString(4, user.getPassword());
    		ps.setString(5, user.getLocation());
    		ps.setInt(6, user.getPhoneNumber());
    		ps.setInt(7, userID);
    		int result = ps.executeUpdate();
    		ps.close();
    		pool.closeConnection(connection);
    		return result;
    	} catch (SQLException sqle) {
    		//si devuelve 0 es que ha fallado en la base de datos
    		sqle.printStackTrace();
    		return 0;
    	}
    }
    
    private static ArrayList<Key> addUserWishList(int userID) {
    	ArrayList<Key> wishListDB = new ArrayList<>();
    	
    	//Establecemos conexion con la base de datos
    	ConnectionPool pool = ConnectionPool.getInstance();
    	
    	//preparamos la consulta
    	PreparedStatement ps = null;
    	ResultSet rs = null;
    	String query="SELECT p_id FROM Lista WHERE u_id = ?";
    	
    	try {
    		Connection connection = pool.getConnection();
    		ps = connection.prepareStatement(query);
    		ps.setInt(1, userID);
    		rs = ps.executeQuery();
    		while (rs.next()) {
    			//mientras encuentre un producto asociado a ese usuario, lo añade a la lista
    			wishListDB.add(KeyDB.getKeyByIndex(rs.getInt("p_id")));
    		}
    		rs.close();
    		ps.close();
    		pool.closeConnection(connection);
    		
    		return wishListDB;
    	} catch (SQLException sqle) {
    		//si devuelve null es que ha ocurrido un error en la Base de Datos
    		sqle.printStackTrace();
    		return null;
    	}
    }
}