import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Singleton class for database connection
 */
public class DBconnection {

    private static class ConnectionHolder {
        private static final DBconnection INSTANCE = new DBconnection();
    }

    private Connection con;

    private DBconnection() {
        try {
            this.con = DriverManager.getConnection("jdbc:mysql://localhost:3306/memoriadb", "root", "HelloAdmin23");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static DBconnection getInstance() {
        return ConnectionHolder.INSTANCE;
    }

    public Connection getConnection() {
        return con;
    }

    public void closeConnection() {
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
