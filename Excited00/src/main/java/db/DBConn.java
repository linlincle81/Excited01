package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            String url = "jdbc:mariadb://localhost:3306/USERS";
            String user = "root";
            String password = "1234";

            conn = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
