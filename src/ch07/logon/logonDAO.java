 package ch07.logon;
 
 import java.sql.*;
 import javax.sql.*;
import javax.naming.*;
 
 public class logonDAO {
    
 	private static logonDAO instance = new logonDAO();
    
 // 싱글톤
    public static logonDAO getInstance() {
        return instance;
    }
    
    private logonDAO() {
    }
    
    //connect
    private Connection getConnection() throws Exception {
      Context initCtx = new InitialContext();
      Context envCtx = (Context) initCtx.lookup("java:comp/env");
      DataSource ds = (DataSource)envCtx.lookup("jdbc/orcl");
      return ds.getConnection();
    }
    //db입력
    public void insertmem(logonDTO mem)
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
            	"insert into mem values (?,?,?,?,?,?)");
            pstmt.setString(1, mem.getId());
            pstmt.setString(2, mem.getPasswd());
            pstmt.setString(3, mem.getName());
            pstmt.setString(4, mem.getBirth());
            pstmt.setString(5, mem.getEmail());
			pstmt.setTimestamp(6, mem.getReg_date());
            pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
    //아이디 비밀번호 확인
	public int userCheck(String id, String passwd) 
	throws Exception {
		Connection conn = null;
        PreparedStatement pstmt = null;
		ResultSet rs= null;
        String dbpasswd="";
		int x=-1;
        
		try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
            	"select passwd from mem where id = ?");
            pstmt.setString(1, id);
            rs= pstmt.executeQuery();

			if(rs.next()){
				dbpasswd= rs.getString("passwd"); 
				if(dbpasswd.equals(passwd))
					x= 1; //인증 성공
				else
					x= 0; //비밀번호 틀림
			}else
				x= -1;//해당 아이디 없음
			
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return x;
	}
	//회원 아이디 유효성 검사
	public int confirmId(String id) 
	throws Exception {
		Connection conn = null;
        PreparedStatement pstmt = null;
		ResultSet rs= null;
        String dbpasswd="";
		int x=-1;
        
		try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
            	"select id from mem where id = ?");
            pstmt.setString(1, id);
            rs= pstmt.executeQuery();

			if(rs.next())
				x= 1; //해당 아이디 있음
			else
				x= -1;//해당 아이디 없음		
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return x;
	}

	//테이블 컬럼 정의
    public logonDTO getmem(String id)
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        logonDTO mem=null;
        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
            	"select * from mem where id = ?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	mem = new logonDTO();
            	mem.setId(rs.getString("id"));
            	mem.setPasswd(rs.getString("pw"));
            	mem.setName(rs.getString("name"));
            	mem.setBirth(rs.getString("birth"));
            	mem.setEmail(rs.getString("email"));
            	mem.setReg_date(rs.getTimestamp("reg_date"));     
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return mem;
    }
    //db 업데이트
    public void updatemem(logonDTO mem)
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
              "update mem set passwd=?,name=?,email=?"+
              "where id=?");
            pstmt.setString(1, mem.getPasswd());
            pstmt.setString(2, mem.getName());
            pstmt.setString(3, mem.getEmail());
            pstmt.setString(4, mem.getId());
            
            pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
    //db 에서 삭제
    public int deletemem(String id, String pw)
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        String dbpasswd="";
        int x=-1;
        try {
			conn = getConnection();

            pstmt = conn.prepareStatement(
            	"select passwd from mem where id = ?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            
			if(rs.next()){
				dbpasswd= rs.getString("pw"); 
				if(dbpasswd.equals(pw)){
					pstmt = conn.prepareStatement(
            	      "delete from mem where id=?");
                    pstmt.setString(1, id);
                    pstmt.executeUpdate();
					x= 1; //회원탈퇴 성공
				}else
					x= 0; //비밀번호 틀림
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return x;
    }
    //db에서 회원정보 검색 및 현재 날짜 시간과 비교
    public boolean selectmem(logonDTO mem,String birth)
    	throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
              "select mem_birthdate from (select substr(mem_birthdate,6,7) mem_birthdate from member where mem_id=?) where mem_birthdate = to_char(sysdate,'mm-dd')");
            pstmt.setString(1, mem.getId());
            rs = pstmt.executeQuery();
            if(rs.next()) {
            	result = true;
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return result;
    }
    //해당접속세션 아이디의 생년월일중 뒤의 mmdd 비교
    public boolean myBirth(String sessionId)
    	    throws Exception {
    	        Connection conn = null;
    	        PreparedStatement pstmt = null;
    	        ResultSet rs = null;
    	        logonDTO mem=null;
    	        boolean birth=false;
    	        try {
    	            conn = getConnection();
    	            
    	            pstmt = conn.prepareStatement(
    	            	"select mem_birthdate from (select substr(mem_birthdate,6,7) mem_birthdate from member where mem_id=?) where mem_birthdate = to_char(sysdate,'mm-dd')");
    	            pstmt.setString(1, sessionId);
    	            rs = pstmt.executeQuery();

    	            if (rs.next()) {
    	            	
    	            	birth=true;
    	            	     
    				}
    	        } catch(Exception ex) {
    	            ex.printStackTrace();
    	        } finally {
    	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
    	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
    	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    	        }
    			return birth;
    	    }
 }