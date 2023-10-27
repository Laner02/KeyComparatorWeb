package sourcesDB;

import java.sql.*;
import database.*;

public class ShopDB {

    /**
     * Metodo que obtiene el identificador de una tienda en la Base de Datos
     * @param shopName Nombre de la tienda a buscar
     * @return Identificador entero único de la tienda en base de datos.
     */
    public static int getShopID(String shopName) {
        //Establecemos conexion con la base de datos
        ConnectionPool pool = ConnectionPool.getInstance();

        //Preparamos la consulta
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query="SELECT * FROM Tienda WHERE nombre = ?";
        int shopID = -1;

        try {
            Connection connection = pool.getConnection();
            ps = connection.prepareStatement(query);
            ps.setString(1, shopName);
            rs = ps.executeQuery();
            // si encuentra 1 resultado igual (rs.next == true), entonces pilla el id
            if (rs.next())
                shopID = rs.getInt("t_id");
            rs.close();
            ps.close();
            pool.closeConnection(connection);
        } catch (SQLException sqle) {
            //si devuelve un -1 es que ha ocurrido una excepcion en base de datos o que no lo ha encontrado
            sqle.printStackTrace();
        }

        return shopID;
    }
}