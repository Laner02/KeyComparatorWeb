package database;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * Clase que implementa un Pool de conexiones a la base de datos para
 * hacer mas eficientes los accesos a la Base de Datos y ahorrar codigo.
 * @author Raul Villa
 */
public class ConnectionPool {
    
    private static ConnectionPool pool;
    private static DataSource dataSource = null;
    
    private ConnectionPool(){
    	try {
    		InitialContext ic = new InitialContext();
    		dataSource = (DataSource) ic.lookup("java:/comp/env/jdbc/MariaDB");
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    }
    
    public static ConnectionPool getInstance() {
        if (pool == null) {
            pool = new ConnectionPool();
        }
        return pool;
    }
    
    public Connection getConnection() throws SQLException {
    	return dataSource.getConnection();
    }
    
    public void closeConnection(Connection connection) throws SQLException {
        connection.close();
    }    
}