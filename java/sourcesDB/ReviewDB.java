package sourcesDB;

import java.sql.*;
import database.*;
import sources.*;

public class ReviewDB {

    //inserta una review en la base de datos con el id de usuario, el de clave, y la review
    public static int insertReview(int userID, int keyID, Review review) {
        //Establecemos conexion con la base de datos a traves de ConnectionPool
        ConnectionPool pool = ConnectionPool.getInstance();

        //Preparamos la consulta
        PreparedStatement ps = null;
        String query="INSERT INTO Resena(u_id, p_id, titulo, descripcion, valoracion) VALUES(?, ?, ?, ?, ?)";

        try {
            Connection connection = pool.getConnection();
            ps = connection.prepareStatement(query);
            ps.setInt(1, userID);
            ps.setInt(2, keyID);
            ps.setString(3, review.getTitle());
            ps.setString(4, review.getDescription());
            ps.setFloat(5, review.getScore());
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

    //SOLO SE PERMITE HACER UNA RESEÑA A UNA KEY POR USUARIO	/ se comprueba si el usuario ya ha escrito una reseña a esa key
    public static boolean reviewExists(int userID, int keyID) {
        //Establecemos conexion con la base de datos
        ConnectionPool pool = ConnectionPool.getInstance();

        //Preparamos la consulta
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query="SELECT * FROM Resena WHERE u_id = ?, p_id = ?";

        try {
            Connection connection = pool.getConnection();
            ps = connection.prepareStatement(query);
            ps.setInt(1, userID);
            ps.setInt(2, keyID);
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

    // Solo se deberia llamar a este metodo si se sabe que existe la clave en la BD
    private static int getReviewID(Review review) {
        //Establecemos conexion con la base de datos
        ConnectionPool pool = ConnectionPool.getInstance();

        //Preparamos la consulta
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query="SELECT * FROM Resena WHERE titulo = ?, descripcion = ?, valoracion = ?";
        int reviewID = -1;

        try {
            Connection connection = pool.getConnection();
            ps = connection.prepareStatement(query);
            ps.setString(1, review.getTitle());
            ps.setString(2, review.getDescription());
            ps.setFloat(3, review.getScore());
            rs = ps.executeQuery();
            // si encuentra 1 resultado igual (rs.next == true), entonces pilla el id
            if (rs.next())
                reviewID = rs.getInt("r_id");
            rs.close();
            ps.close();
            pool.closeConnection(connection);
        } catch (SQLException sqle) {
            //si devuelve un -1 es que ha ocurrido una excepcion en base de datos o que no lo ha encontrado
            sqle.printStackTrace();
        }

        return reviewID;
    }

    /**
     * Método que consulta el identificador del usuario asociado a la reseña correspondiente al
     * identificador de reseña recibido.
     * @param reviewID Identificador de reseña a consultar en la Base de Datos.
     * @return 
     */
    public static int getReviewUserID(int reviewID) {
        //Establecemos conexion con la base de datos
        ConnectionPool pool = ConnectionPool.getInstance();

        //Preparamos la consulta
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query="SELECT u_id FROM Resena WHERE r_id = ?";
        int userID = -1;

        try {
            Connection connection = pool.getConnection();
            ps = connection.prepareStatement(query);
            ps.setInt(1, reviewID);
            rs = ps.executeQuery();
            while (rs.next()) {
                //mientras encuentre el ID de review, devuelve el ID del usuario
                userID = rs.getInt("u_id");
            }
            rs.close();
            ps.close();
            pool.closeConnection(connection);
        } catch (SQLException sqle) {
            //Si devuelve -1, es que no ha encontrado la reseña en la DB, tenerlo en cuenta para el control de errores al llamarla
            sqle.printStackTrace();
        }

        return userID;
    }

    //que solo si el usuario se corresponde con el asociado a la review pueda borrarla
    public static int removeReviewDB(int reviewID) {
        //Establecemos conexion con la base de datos
        ConnectionPool pool = ConnectionPool.getInstance();

        //Preparamos la consulta
        PreparedStatement ps = null;
        String query="DELETE FROM Resena WHERE r_id = ?";

        try {
            Connection connection = pool.getConnection();
            ps = connection.prepareStatement(query);
            ps.setInt(1, reviewID);
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
}
