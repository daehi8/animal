package DB;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.SQLException;
//1:1 매핑
public class StatementTest {
	public static void main(String args[])
    {
        Connection conn = null; // DB연결된 상태(세션)을 담은 객체
        Statement stm = null;  // SQL 문을 나타내는 객체
        
        try {
            conn = DBConnection.getConnection();
            stm = conn.createStatement();
           
            String sql = "INSERT INTO MEMBER_REGISTER(mem_id, mem_password, mem_name) VALUES('shiwoo1111', 'animal@1111', '강아지')";
            int success = stm.executeUpdate(sql);
            
            if(success > 0)
                System.out.println("데이터 입력 성공");
            else
                System.out.println("데이터 입력 실패");
 
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }
}

