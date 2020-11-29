package DB;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
//한번 분석시 재사용 용이 위치홀더는 ?로 표시
public class PreparedStatementTest {
	 public static void main(String args[])
	    {
	        Connection conn = null; // DB연결된 상태(세션)을 담은 객체
	        PreparedStatement pstm = null;  // SQL 문을 나타내는 객체
	        
	        try {
	            
	            String quary = "INSERT INTO MEMBER_REGISTER VALUES(?,?,?,?)";
	            
	            conn = DBConnection.getConnection();
	            pstm = conn.prepareStatement(quary);
	            
	            // 쿼리에 값을 세팅한다.
	            // 여기서 1, 2, 3은 첫번째, 두번째, 세번째 위치홀더 라는 뜻
	            pstm.setString(1, "shiwoo2222");
	            pstm.setString(2, "animal2222");
	            pstm.setString(5, "shiwoo1111@naver.com");
	            pstm.setString(6, "010-2222-1111");
	           
	            
	            int success = pstm.executeUpdate();
	            
	            if(success > 0)
	                System.out.println("데이터 입력 성공");
	            else
	                System.out.println("데이터 입력 실패");
	 
	            
	        } catch (SQLException sqle) {
	            sqle.printStackTrace();
	        }
	    }
	}

