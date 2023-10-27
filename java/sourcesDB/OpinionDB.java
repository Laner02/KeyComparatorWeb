package sourcesDB;

import java.sql.*;
import java.util.ArrayList;
import sources.*;

import database.*;

public class OpinionDB {

	//inserta una opinion en la base de datos con el id de usuario, el de tienda, y la Opinion
    public static int insertReview(int shopID, int userID, Opinion opinion) {
        //Establecemos conexion con la base de datos a traves de ConnectionPool
        ConnectionPool pool = ConnectionPool.getInstance();

        //Preparamos la consulta
        PreparedStatement ps = null;
        String query="INSERT INTO Opinion(t_id, u_id, descripcion) VALUES(?, ?, ?)";

        try {
            Connection connection = pool.getConnection();
            ps = connection.prepareStatement(query);
            ps.setInt(1, shopID);
            ps.setInt(2, userID);
            ps.setString(3, opinion.getDescription());
            int result = ps.executeUpdate();
            ps.close();
            pool.closeConnection(connection);
            return result;
        } catch (SQLException sqle) {
            //si devuelve un 0 es que ha dado error en la base de datos
            sqle.printStackTrace();
            return 0;
        }
    }
	
    public static boolean OpinionExists(int shopID, int userID) {
        //Establecemos conexion con la base de datos
        ConnectionPool pool = ConnectionPool.getInstance();

        //Preparamos la consulta
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query="SELECT * FROM Opinion WHERE t_id = ?, u_id = ?";

        try {
            Connection connection = pool.getConnection();
            ps = connection.prepareStatement(query);
            ps.setInt(1, shopID);
            ps.setInt(2, userID);
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

    public static ArrayList<Opinion> getOpinions(int shopID) {
        ArrayList<Opinion> opinionsDB = new ArrayList<>();
        //Establecemos conexion con la base de datos
        ConnectionPool pool = ConnectionPool.getInstance();

        //Preparamos la consulta
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query="SELECT * FROM Opinion WHERE t_id = ?";
        int userID = -1;

        try {
            Connection connection = pool.getConnection();
            ps = connection.prepareStatement(query);
            ps.setInt(1, shopID);
            rs = ps.executeQuery();
            //mientras encuentre una opinion para la tienda la inserta en la lista y sigue
            if (rs.next()) {
                userID = rs.getInt("u_id");
                Opinion currentOpinion = new Opinion(
                        UserDB.getUserNameDB(userID),
                        rs.getString("descripcion")
                );
                opinionsDB.add(currentOpinion);
            }
            rs.close();
            ps.close();
            pool.closeConnection(connection);

            return opinionsDB;
        } catch (SQLException sqle) {
            //si devuelve null es que ha ocurrido una excepcion en base de datos o que no lo ha encontrado
            sqle.printStackTrace();
            return null;
        }
    }
}