package DB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Connection_Test {
	 public static void main(String args[])
	    {
	        Connection conn = null; // DB연결된 상태(세션)을 담은 객체
	        PreparedStatement pstm = null;  // SQL 문을 나타내는 객체
	        ResultSet rs = null;  // 쿼리문을 날린것에 대한 반환값을 담을 객체
	        
	        try {
	            // SQL 문장을 만들고 만약 문장이 질의어(SELECT문)라면
	            // 그 결과를 담을 ResulSet 객체를 준비한 후 실행시킨다.
	            String sql = "SELECT * FROM MEMBER";
	            //DB에 연결 상태를 conn에 담음
	            conn = DBConnection.getConnection();
	            //prepareStatement(sql)메서드 쿼리문을 담음
	            pstm = conn.prepareStatement(sql);
	            //쿼리를 실행
	            rs = pstm.executeQuery();
	           
	            
	            System.out.println("MEM_ID MEM_PASSWORD MEM_NAME MEM_GENDER MEM_EMAIL MEM_TEL MEM_ZIP_CODE MEM_ADDRESS");
	            System.out.println("============================================");
	            
	            while(rs.next()){//()안은 컨럼 순서, while로 데이터가 없을 때까지 반복
	                String mem_id = rs.getString(1);
	                String mem_password = rs.getString(2);
	                String mem_name = rs.getString(3);
	                String mem_gender = rs.getString(4);
	                String mem_email = rs.getString(5);
	                String mem_tel = rs.getString(6);
	                String mem_zip_code = rs.getString(7);
	                String mem_address = rs.getString(8);
	              
	                
	                String result = mem_id+" "+mem_password+" "+mem_name+" "+mem_gender+""+mem_email+" "+mem_tel+" "+mem_zip_code+" "+mem_address;
	                System.out.println(result);
	            }
	            
	        } catch (SQLException sqle) {
	            System.out.println("SELECT문에서 예외 발생");
	            sqle.printStackTrace();
	            
	        }finally{
	            // DB 연결을 종료한다.
	            try{
	            	if ( rs != null ){rs.close();}   
	                if ( pstm != null ){pstm.close();}   
	                if ( conn != null ){conn.close(); }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	            
	        }
	    }
	}
