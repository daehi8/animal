package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Project02 { 
    public static Connection getConnection(String server, String id, String pw) {
        Connection conn = null;
        String url = String.format("jdbc:oracle:thin:@masternull.iptime.org:1521:orcl",server);
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(url, "Project02", "project");
            return conn;
        } catch (Exception e) {
            System.out.println("DBUtil.getConnection() : " + e.toString());
        }
        return null;
    }
}

