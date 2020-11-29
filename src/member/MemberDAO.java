package member;

import java.sql.*;
import javax.sql.*;
import org.apache.tomcat.jni.Mmap;
import DB.DBConnection;
import javax.naming.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

/*
	import java.sql.Connection;         // DB 연결 객체
	import java.sql.PreparedStatement;  // 쿼리 실행
	import java.sql.ResultSet;          // SELECT 쿼리 실행 결과 저장
	import java.sql.SQLException;       // SQL 실행 에러 정보 제공
	import java.util.Vector;            // 객체 목록
	import javax.activation.DataSource; // 이메일 인증 등 
	import javax.naming.Context;        // 네임 서비스에 액세스하기 위한 클래스 및 인터페이스를 제공
	import javax.naming.InitialContext;	
 */


/* 
	String sql  = " SQL문 "; 에서
	   
	sql = new StringBuffer();
    sql.append(" SQL문 ");
	System.out.println("SQL: " + sql.toString());
	pstmt = con.prepareStatement(sql.toString()); 으로 변경
	
	pstmt.setString(5, dto.get());      getter메소드를 호출	   
*/
/*
 * RuntimeException
 * ArithmeticException : 0으로 나누는 경우
 * NullPointerException : ref가 NULL이 되는 경우
 * NegativeArraySizeException : 배열 크기를 음수로 지정
 * ArrayIndexOutOfBoundExcetion : 배열의 Index 범위를 넘어서 참조
 * ClassCastException : Cast연산자 사용시 타입오류
 * NumberFormalExcetion : 숫자변환 시 문자가 포함
 * */

	
	public class MemberDAO {
	
	public Connection conn = null;         // DB연결
	public PreparedStatement pstmt = null; // 코드 가독성
	public ResultSet rs = null;            // SELECT 결과 저장 객체
	StringBuffer sql = null;               // 쿼리 저장
	boolean returnValue = false;           // 리턴값 저장
	
	// 싱글턴 패턴 --자원절약을 위해 하나의 인스턴스만 생성하여 사용합니다.
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	
	
	// 디비풀 커넥션 --Printout때문에 DB에 있는 Connection도 사용합니다
	private Connection getConnection() throws Exception{
	      Context initCtx = new InitialContext();
	      Context envCtx = (Context) initCtx.lookup("java:comp/env");
	      DataSource ds = (DataSource)envCtx.lookup("jdbc/orcl");
	      return ds.getConnection();		
	}
	
	
	// 세션정보와 비밀번호 비교확인(SELECT * FROM MEMBER WHERE)(checkModifyPro)
	public boolean checkLogin (String mem_id, String mem_password) throws Exception {
		boolean result = false;
		int cnt= 0;
		try {
			conn = getConnection();
			String sql = "SELECT * FROM MEMBER WHERE mem_id =? AND mem_password =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(++cnt, mem_id);
			pstmt.setString(++cnt, mem_password);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeAll(); //자원반납 메소드 활용
		}
		return result;
	}
	
	
	// 아이디 중복 체크(SELECT * FROM MEMBER WHERE)(checkIdPro)
	public int checkID (String mem_id)throws Exception {

		int x = -1;
		try {
			conn = getConnection();
			String sql = "SELECT * FROM MEMBER WHERE mem_id =? and mem_flag !='3'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
			if(rs.next()) 
				x = 1 ; //중복
			else
				x = -1; //중복X
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return x;
	}
	
	
	// 정보 이름, 이메일 정보로 아이디찾기(SELECT * FROM MEMBER WHERE) (findIdPro1) 
	public String findID1(String mem_name, String mem_email)throws Exception {
		String mem_id = null;
		try {
			conn = getConnection();
			String sql = "SELECT mem_id FROM MEMBER WHERE mem_name=? AND mem_email=? AND mem_flag != '3'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_name);
			pstmt.setString(2, mem_email);
			rs = pstmt.executeQuery();
			while(rs.next())
		      {  
		       mem_id = rs.getString("mem_id");
	      }
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			closeAll();
		}
		return mem_id;
	}
		

	// 정보 이름, 전화번호 정보로 아이디찾기(SELECT * FROM MEMBER WHERE) (findIdPro2)
	public String findID2 (String mem_name, String mem_tel)throws Exception {
		String mem_id = null;
		try {
			conn = getConnection();
			String sql = "SELECT mem_id FROM MEMBER WHERE mem_name=? AND mem_email=? AND mem_flag != '3'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_name);
			pstmt.setString(2, mem_tel);
			rs = pstmt.executeQuery();
			while(rs.next())
			   {  
			    mem_id = rs.getString("mem_id");
			   }
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			closeAll(); //자원반납 메소드 활용
		}
		return mem_id;
	}
	
	
	// 정보 이름, 전화번호 정보로 패스워드찾기(SELECT * FROM MEMBER WHERE) (findIdPro2)
		public String findPassword (String mem_id, String mem_tel, String mem_email)throws Exception {
			String mem_password = null;
			try {
				conn = getConnection();
				String sql = "SELECT mem_password FROM MEMBER WHERE mem_id=? AND mem_email=? AND mem_tel=? AND mem_flag != '3'";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mem_id);
				pstmt.setString(2, mem_tel);
				pstmt.setString(3, mem_email);
				rs = pstmt.executeQuery();
				while(rs.next())
				   {  
				    mem_password = rs.getString("mem_password");
				   }
			} catch (Exception ex) {
				ex.printStackTrace();
			}finally {
				closeAll(); //자원반납 메소드 활용
			}
			return mem_password;
		}
	
		
	// 닉네임 중복 체크(SELECT * FROM MEMBER WHERE)
	public int checkNicname (String mem_nickname)throws Exception {
		
		int x = -1;
		try {
			conn = getConnection();
			String sql = "SELECT * FROM MEMBER WHERE mem_nickname=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_nickname);
			rs = pstmt.executeQuery();
			if(rs.next()) 
				x = 1 ; //중복됨
			else
				x = -1; //중복되지 않으면
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return x;
	}
	
	
	// 이메일 중복 체크(SELECT * FROM MEMBER WHERE)
	public int checkEmail (String mem_email)throws Exception {
		
		//boolean result = false; boolean --> int
		int x = -1;
		try {
			conn = getConnection();
			String sql = "SELECT * FROM MEMBER WHERE mem_nicaname=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_email);
			rs = pstmt.executeQuery();
			if(rs.next()) 
				x = 1 ; //중복됨
			else
				x = -1; //중복되지 않으면
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return x;
	}
	
	
	// 비밀번호 체크(SELECT * FROM MEMBER WHERE) 
	// 응용 그 전 비밀번호와 동일하면 변경 및 사용할 수 없다.
	public int checkPassword(String mem_password)throws Exception {
		
		int x = -1;
		try {
			conn = getConnection();
			String sql = "SELECT mem_password =? FROM MEMBER WHERE mem_password =? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_password);
			rs = pstmt.executeQuery();
			if(rs.next()) 
				x = 1 ; //중복됨
			else
				x = -1; //중복되지 않으면
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return x;
	}
	
	
	// 로그인 체크(SELECT * FROM MEMBER WHERE)
	public int checkLogin2(String mem_id, String mem_password, HttpServletRequest req ) 
    {
       
        String db_password = ""; // db에서 꺼낸 비밀번호를 담을 변수
        String db_flag = "";    //db에서 꺼낸 플래그 담을 변수
        int x = -1;
 
        try {
            // 쿼리 - 먼저 입력된 아이디로 DB에서 비밀번호를 조회한다.
            StringBuffer sql = new StringBuffer();
            sql.append("SELECT mem_password, mem_flag FROM MEMBER WHERE mem_id=? and mem_flag != '3' ");
            //sql.append("AND mem_flag ='Y'");
            conn = getConnection();
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, mem_id);
            rs = pstmt.executeQuery();
 
            if (rs.next()) // 입력된 아이디에 해당하는 비번 있을경우
            {
            	db_password = rs.getString("mem_password"); // 비번을 변수에 넣는다.
            	db_flag = rs.getString("mem_flag");
            	//System.out.println("db_flag:" + db_flag);
            	req.getSession().setAttribute("db_flag", db_flag);
                if (db_password.equals(mem_password)) 
                    x = 1; // 넘겨받은 비번과 꺼내온 배번 비교. 같으면 인증성공
                else                  
                    x = 0; // DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패
                
            } else {
                x = -1; // 해당 아이디가 없을 경우
            }
            
 
            return x;
 
        } catch (Exception sql) {
            throw new RuntimeException(sql.getMessage());
        } finally {
            try{
            	closeAll();
            }catch(Exception e){
                throw new RuntimeException(e.getMessage()); 
            }
        }
    }
	
	
	// 로그인 성공시 Main화면에 보이는 프로필 정보 (SELECT * FROM MEMBER WHERE)(profileViewPro)
	public MemberDTO memberViewProfile(String mem_id)throws Exception{
		
		MemberDTO dto = null;
		try {//커넥션
			conn = getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT * FROM MEMBER WHERE mem_id=?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, mem_id);
            rs = pstmt.executeQuery();
            if(rs.next())
            {  
            	dto = new MemberDTO();
            	dto.setMem_id(rs.getString("mem_id"));
                dto.setMem_name(rs.getString("mem_name"));
                dto.setMem_nickname(rs.getString("mem_nickname"));
                dto.setMem_email(rs.getString("mem_email"));
                dto.setMem_intro(rs.getString("mem_intro"));
            }
            return dto;
 
        } catch (Exception sql) {
            throw new RuntimeException(sql.getMessage());
        } finally {
            try{
            	closeAll();
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
	}
	// 로그인 성공시 Main화면에 보이는 프로필 정보 (SELECT * FROM MEMBER WHERE)(profileViewPro)
		public MemberDTO adminViewProfile(String mem_id)throws Exception{
			
			MemberDTO dto = null;
			try {//커넥션
				conn = getConnection();
				StringBuffer sql = new StringBuffer();
				sql.append("SELECT * FROM MEMBER WHERE mem_id=?");
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(1, mem_id);
	            rs = pstmt.executeQuery();
	            if(rs.next())
	            {  
	            	dto = new MemberDTO();
	            	dto.setMem_id(rs.getString("mem_id"));
	                dto.setMem_name(rs.getString("mem_name"));
	                dto.setMem_nickname(rs.getString("mem_nickname"));
	                dto.setMem_email(rs.getString("mem_email"));
	                dto.setMem_intro(rs.getString("mem_intro"));
	            }
	            return dto;
	 
	        } catch (Exception sql) {
	            throw new RuntimeException(sql.getMessage());
	        } finally {
	            try{
	            	closeAll();
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	        }
		}
	
	// 일반회원 개인정보 수정시  DB에 나오는 데이터를 보여줍니다 
	//(SELECT * FROM MEMBER WHERE) (modifyMemberInfoForm)
	public MemberDTO memberViewInfo(String mem_id){
		MemberDTO dto = null;
	
		try {//커넥션
			conn = getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT * FROM MEMBER WHERE mem_id=? AND mem_flag='1'");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, mem_id);
	        rs = pstmt.executeQuery();
	        if(rs.next())
	        { 
	            dto = new MemberDTO();
	            dto.setMem_id(rs.getString("mem_id"));
	            dto.setMem_nickname(rs.getString("mem_nickname"));
	            dto.setMem_password(rs.getString("mem_password"));
	            dto.setMem_name(rs.getString("mem_name"));
	            dto.setMem_email(rs.getString("mem_email"));
	            dto.setMem_gender(rs.getString("mem_gender"));
	            dto.setMem_tel(rs.getString("mem_tel"));
	            dto.setMem_land_tel(rs.getString("mem_land_tel"));
	            dto.setMem_zip_code(rs.getString("mem_zip_code"));
	            dto.setMem_address(rs.getString("mem_address"));
	            dto.setMem_birthdate(rs.getString("mem_birthdate"));
	            dto.setTerms_sns(rs.getString("terms_sns"));
	            dto.setTerms_email(rs.getString("terms_email"));
	        }
	        
	  } catch (Exception sql) {
	     sql.addSuppressed(sql);
	  } finally {
	      try {
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
	    }return dto;
	}
	// 어드민회원 개인정보 수정시  DB에 나오는 데이터를 보여줍니다 
		//(SELECT * FROM MEMBER WHERE) (modifyMemberInfoForm)
		public MemberDTO adminViewInfo(String mem_id){
			MemberDTO dto = null;
		
			try {//커넥션
				conn = getConnection();
				StringBuffer sql = new StringBuffer();
				sql.append("SELECT * FROM MEMBER WHERE mem_id=? AND mem_flag='0'");
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(1, mem_id);
		        rs = pstmt.executeQuery();
		        if(rs.next())
		        { 
		            dto = new MemberDTO();
		            dto.setMem_id(rs.getString("mem_id"));
		            dto.setMem_nickname(rs.getString("mem_nickname"));
		            dto.setMem_password(rs.getString("mem_password"));
		            dto.setMem_name(rs.getString("mem_name"));
		            dto.setMem_email(rs.getString("mem_email"));
		            dto.setMem_tel(rs.getString("mem_tel"));
		            dto.setMem_gender(rs.getString("mem_gender"));
		            dto.setMem_land_tel(rs.getString("mem_land_tel"));
		            dto.setMem_zip_code(rs.getString("mem_zip_code"));
		            dto.setMem_address(rs.getString("mem_address"));
		            dto.setMem_birthdate(rs.getString("mem_birthdate"));
		            dto.setTerms_sns(rs.getString("terms_sns"));
		            dto.setTerms_email(rs.getString("terms_email"));
		        }
		        
		  } catch (Exception sql) {
		     sql.addSuppressed(sql);
		  } finally {
		      try {
				closeAll();
			} catch (Exception e) {
				e.printStackTrace();
			}
		    }return dto;
		}
	
	
	// 기업회원이 개인정보 수정시  DB에 나오는 데이터를 보여줍니다 
	//(SELECT * FROM MEMBER WHERE) (modifyEnterpriseInfoForm)
		public MemberDTO enterpriseViewInfo(String mem_id){
			MemberDTO dto = null;
		
			try {//커넥션
				conn = getConnection();
				StringBuffer sql = new StringBuffer();
				sql.append("SELECT * FROM MEMBER WHERE mem_id=? AND mem_flag='2'");
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(1, mem_id);
		        rs = pstmt.executeQuery();
		        if(rs.next())
		        { 
		            dto = new MemberDTO();
		            dto.setMem_id(rs.getString("mem_id"));
		            dto.setMem_nickname(rs.getString("mem_nickname"));
		            dto.setMem_password(rs.getString("mem_password"));
		            dto.setEp_name(rs.getString("ep_name"));
		            dto.setMem_name(rs.getString("mem_name"));
		            dto.setEp_type(rs.getString("ep_type"));
		            dto.setMem_email(rs.getString("mem_email"));
		            dto.setMem_tel(rs.getString("mem_tel"));
		            dto.setMem_land_tel(rs.getString("mem_land_tel"));
		            dto.setMem_zip_code(rs.getString("mem_zip_code"));
		            dto.setMem_address(rs.getString("mem_address"));
		            //dto.setEp_map(rs.getString("ep_map"));
		            dto.setEp_reg_no(rs.getString("ep_reg_no"));
		            dto.setEp_biz_no(rs.getString("ep_biz_no"));
		            dto.setMem_birthdate(rs.getString("mem_birthdate"));
		            dto.setTerms_sns(rs.getString("terms_sns"));
		            dto.setTerms_email(rs.getString("terms_email"));
		        }
		        
		  } catch (Exception sql) {
		     sql.addSuppressed(sql);
		  } finally {
		      try {
				closeAll();
			} catch (Exception e) {
				e.printStackTrace();
			}
		    }return dto;
	}
	
		
	// 일반 회원가입(INSERT INTO MEMBER VALUES)(registermemberPro) 
	public void registerMember(MemberDTO dto)throws Exception{
		try {//커넥션
			conn = getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append(" INSERT INTO MEMBER ");
			sql.append("( mem_num, mem_id, mem_password, mem_name, mem_gender, mem_email, mem_tel, mem_land_tel, ");
			sql.append("mem_zip_code, mem_address, mem_birthdate, mem_interested, mem_purpose, mem_regdate, terms_use,terms_privacy,terms_sns,terms_email)"); 
			sql.append("VALUES(MEMBER_SEQ.nextval,?,?,?,?,?,?,?,?,?,?,?,?,sysdate,?,?,?,?)");
			
			pstmt = conn.prepareStatement(sql.toString());
		
			pstmt.setString(1, dto.getMem_id());
			pstmt.setString(2, dto.getMem_password());
			pstmt.setString(3, dto.getMem_name());
			pstmt.setString(4, dto.getMem_gender());
			pstmt.setString(5, dto.getEmail1()+"@"+dto.getEmail2());
			pstmt.setString(6, dto.getTel1()+"-"+dto.getTel2()+"-"+dto.getTel3());
			pstmt.setString(7, dto.getLtel1()+"-"+dto.getLtel2()+"-"+dto.getLtel3());
			pstmt.setString(8, dto.getMem_zip_code());
			pstmt.setString(9, dto.getAddress1()+";"+dto.getAddress2());
			pstmt.setString(10, dto.getMem_birthdate());
			
			String in = "";
			String [] interested = dto.getMem_interested();
			for(int i = 0 ; i <interested.length; i++) {
				in += interested[i]+",";
			}
			pstmt.setString(11, in);
			pstmt.setString(12, dto.getMem_purpose());
			pstmt.setString(13, dto.getTerms_use());
			pstmt.setString(14, dto.getTerms_privacy());
			pstmt.setString(15, dto.getTerms_sns());
			pstmt.setString(16, dto.getTerms_email());
			//pstmt.setString(17, dto.getMem_nickname());
			pstmt.executeUpdate();
			} catch (Exception ex) {
				ex.printStackTrace();
			}finally {
				closeAll();
			}
	}
	
	
	//기업 회원가입(INSERT INTO MEMBER VALUES)
	public void registerEnterprise(MemberDTO dto)throws Exception{
		try {//커넥션
			conn = getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO MEMBER(mem_num, mem_id, mem_password, mem_name, ep_name, ep_type, mem_email, "
					+ "mem_tel, mem_land_tel, mem_zip_code, mem_address, ep_reg_no, "
					+ "ep_biz_no, mem_birthdate, mem_interested, mem_purpose, mem_regdate, "
					+ "terms_use, terms_privacy, terms_email, terms_sns, mem_flag) "
					+ "VALUES(MEMBER_SEQ.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate,?,?,?,?,'2') ");
				
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, dto.getMem_id());
			pstmt.setString(2, dto.getMem_password());
			pstmt.setString(3, dto.getMem_name());
			pstmt.setString(4, dto.getEp_name());
			pstmt.setString(5, dto.getEp_type());
			pstmt.setString(6, dto.getEmail1()+"@"+dto.getEmail2());
			pstmt.setString(7, dto.getTel1()+"-"+dto.getTel2()+"-"+dto.getTel3());
			pstmt.setString(8, dto.getLtel1()+"-"+dto.getLtel2()+"-"+dto.getLtel3());
			pstmt.setString(9, dto.getMem_zip_code());
			pstmt.setString(10, dto.getAddress1()+";"+dto.getAddress2());
			//pstmt.setString(11, dto.getEp_map());
			pstmt.setString(11, dto.getReg_no1()+"-"+dto.getReg_no2()+"-"+dto.getReg_no3());
			pstmt.setString(12, dto.getBiz_no1()+"-"+dto.getBiz_no2()+"-"+dto.getBiz_no3()+"-"+dto.getBiz_no4());
			pstmt.setString(13, dto.getMem_birthdate());
			String in = "";
			String [] interested = dto.getMem_interested();
			for(int i = 0 ; i <interested.length; i++) {
				in += interested[i]+",";
			}
			pstmt.setString(14, in);
			pstmt.setString(15, dto.getMem_purpose());
			pstmt.setString(16, dto.getTerms_use());
			pstmt.setString(17, dto.getTerms_privacy());
			pstmt.setString(18, dto.getTerms_email());
			pstmt.setString(19, dto.getTerms_sns());
				
			pstmt.executeUpdate();
			} catch (Exception ex) {
				ex.printStackTrace();
			}finally {
				closeAll();
			}
	}	
	
	
	//Admin  일반회원 전체 리스트 조회
	public ArrayList<MemberDTO> viewMemberList(){
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		try {

			//String sql = "select * from ";
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT * FROM MEMBER WHERE mem_flag='1' ORDER BY mem_num ASC");
			conn = getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while(rs.next()){
				MemberDTO dto =  new MemberDTO();
				dto.setMem_id(rs.getString("mem_id"));
				dto.setMem_name(rs.getString("mem_name"));
				dto.setMem_password(rs.getString("mem_password"));
				dto.setMem_nickname(rs.getString("mem_nickname"));
				dto.setMem_email(rs.getString("mem_email"));
				dto.setMem_tel(rs.getString("mem_tel"));
				dto.setMem_land_tel(rs.getString("mem_land_id"));
				dto.setMem_zip_code(rs.getString("mem_zip_code"));
				dto.setMem_address(rs.getString("mem_address"));
				dto.setMem_gender(rs.getString("mem_gender"));
				dto.setMem_birthdate(rs.getString("mem_birthdate"));
				dto.setMem_flag(rs.getString("mem_flag"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getMemberAll err : ");
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}

	
	//Admin 기업회원목록 조회하기(SELECT FROM MEMBER)
	public ArrayList<MemberDTO> viewEnterpriseList(){
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT * FROM MEMBER WHERE mem_flag='1' ORDER BY mem_num ASC");
			conn = getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while(rs.next()){
				MemberDTO dto =  new MemberDTO();
			sql.append("(mem_num, mem_id, mem_password, mem_name, mem_gender, mem_email, mem_tel, mem_land_tel,");
			sql.append("mem_zip_code, mem_address, mem_, mem_interested, mem_purpose, mem_flag, mem_regdate)");
			sql.append("mem_nickname, mem_img, mem_intro)");
			sql.append("FROM MEMBER");
			sql.append("(MEM_SEQ.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)");
			sql.append("WHERE ep_type='F' AND ep_name='F AND ep_reg_no='F AND ep_biz_no='F'");
			sql.append("ORDER BY mem_num ASC");
			pstmt = conn.prepareStatement(sql.toString());
	        rs = pstmt.executeQuery(); 
	        while(rs.next() == true) {
	        	String mem_id = rs.getString("mem_id");
	        	dto.setMem_id(mem_id);
	        	String mem_name = rs.getString("mem_nickname");
	        	dto.setMem_name(mem_name);
	        	dto.setMem_password(rs.getString("mem_password"));
	        	dto.setMem_name(rs.getString("mem_name"));
	        	dto.setMem_gender(rs.getString("mem_gender"));
	        	dto.setMem_email(rs.getString("mem_email"));
	        	dto.setMem_tel(rs.getString("mem_tel"));
	        	dto.setMem_land_tel(rs.getString("mem_land_tel"));		
	        	dto.setMem_zip_code(rs.getString("mem_zip_code"));
	        	dto.setMem_birthdate(rs.getString("mem_birthdate").toString());
	        	dto.setMem_interested(rs.getString("mem_interested").split(","));		
	        	dto.setMem_password(rs.getString("mem_password"));
				dto.setMem_flag(rs.getString("mem_flag"));
				list.add(dto);
	        }}
		} catch (Exception e) {
			System.out.println("getMemberAll err : ");
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}

	
	
	//일반회원목록(SELECT FROM MEMBER)
	public void Member_Listtt(MemberDTO dto)throws Exception{
		try {//커넥션
			conn = getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT");
			sql.append("(mem_num, mem_id, mem_password, mem_name, mem_gender, mem_email, mem_tel, mem_land_tel,");
			sql.append("mem_zip_code, mem_address, mem_, mem_interested, mem_purpose, mem_flag, mem_regdate)");
			sql.append("mem_nicname, mem_img, mem_intro)");
			sql.append("FROM MEMBER");
			sql.append("(MEM_SEQ.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)");
			sql.append("WHERE ep_type='F' AND ep_name='F AND ep_reg_no='F AND ep_biz_no='F'");
			sql.append("ORDER BY mem_num ASC");
			pstmt = conn.prepareStatement(sql.toString());
		    rs = pstmt.executeQuery(); 
		    while(rs.next() == true) {
		        String mem_id = rs.getString("mem_id");
		        dto.setMem_id(mem_id);
		        String mem_name = rs.getString("mem_nickname");
		        dto.setMem_name(mem_name);
		        	dto.setMem_password(rs.getString("mem_password"));
		        	dto.setMem_name(rs.getString("mem_name"));
		        	dto.setMem_gender(rs.getString("mem_gender"));
		        	dto.setMem_email(rs.getString("mem_email"));
		        	dto.setMem_tel(rs.getString("mem_tel"));
		        	dto.setMem_land_tel(rs.getString("mem_land_tel"));		
		        	dto.setMem_zip_code(rs.getString("mem_zip_code"));
		        	dto.setMem_birthdate(rs.getString("mem_birthdate").toString());
		        	dto.setMem_interested(rs.getString("mem_interested").split(","));		
		        	dto.setMem_password(rs.getString("mem_password"));
		        	dto.setMem_purpose(rs.getString("mem_purpose"));	
		        	dto.setMem_regdate(rs.getDate("reg_date"));		
		        	}
				pstmt.executeUpdate();
				} catch (Exception ex) {
					ex.printStackTrace();
				}finally {
					closeAll();
			 }
		}
	
	
	// Admin 간단일반회원목록(SELECT FROM MEMBER)
	public void Enterprise_List(MemberDTO dto)throws Exception{
		try {//커넥션
			conn = getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT");
			sql.append("(mem_num, mem_id, mem_password, mem_name, mem_gender, mem_email, mem_tel, mem_land_tel,");
			sql.append("mem_zip_code, mem_address, mem_, mem_interested, mem_purpose, mem_flag, mem_regdate,");
			sql.append("mem_nicname, mem_img, mem_intro,ep_type, ep_name, ep_reg_no)");
			sql.append("FROM MEMBER");
			sql.append("(MEM_SEQ.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)");
			sql.append("WHERE ep_type='F' AND ep_name='F AND ep_reg_no='F AND ep_biz_no='F'");
			sql.append("ORDER BY mem_num ASC");
			pstmt = conn.prepareStatement(sql.toString());
		    rs = pstmt.executeQuery(); 
		    while(rs.next() == true) {
		        String mem_id = rs.getString("mem_id");
		        dto.setMem_id(mem_id);
		        String mem_name = rs.getString("mem_nickname");
		        dto.setMem_name(mem_name);
		        dto.setMem_password(rs.getString("mem_password"));
		        dto.setMem_name(rs.getString("mem_name"));
		        dto.setMem_gender(rs.getString("mem_gender"));
		        dto.setMem_email(rs.getString("mem_email"));
		        dto.setMem_tel(rs.getString("mem_tel"));
		        dto.setMem_land_tel(rs.getString("mem_land_tel"));		
		        dto.setMem_zip_code(rs.getString("mem_zip_code"));
		        dto.setMem_birthdate(rs.getString("mem_birthdate"));
		        dto.setMem_interested(rs.getString("mem_interested").split(","));		
		        dto.setMem_password(rs.getString("mem_password"));
		        dto.setMem_purpose(rs.getString("mem_purpose"));	
		        dto.setMem_regdate(rs.getDate("reg_date"));		
		        }
			pstmt.executeUpdate();
			} catch (Exception ex) {
					ex.printStackTrace();
		}finally {
					closeAll();
		}
	}
	
	
	//회원정보 삭제1 (DELETE FROM WHERE)(단순삭제)
	 public boolean delete(String mem_id, String mem_password) throws SQLException{
	        StringBuffer sql = null;
	        boolean returnValue = false;
	        try {
		       conn = getConnection();
		        sql = new StringBuffer();
		        sql.append("DELETE FROM MEMBER WHERE mem_id=? AND mem_password=?");
		        pstmt = conn.prepareStatement(sql.toString());
		        pstmt.setString(1, mem_id); 
		        pstmt.setString(2, mem_password); 
		        int count = pstmt.executeUpdate(); // 쿼리 실행
		        if(count == 1){ 
		            returnValue = true;
		        }else{
		            returnValue = false;
		        }             
		       
	        }catch(Exception e) {
	        	e.printStackTrace();
	        }finally {
				try {
					closeAll();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        }
	        return returnValue;
	    }
	 
	 
	//회원정보 삭제2 (UPDATE SET MEMBER WHERE)(보관삭제)
	 public boolean withdraw(String id, String password, String reason) throws SQLException{
	        StringBuffer sql = null;
	        boolean returnValue = false;
	        try {
		        conn = getConnection();
		        sql = new StringBuffer();
		        sql.append("UPDATE MEMBER SET mem_flag='3', withdraw_reason=?, terms_withdraw='Y' WHERE mem_id =? and mem_password=?");
		        //, mem_expirydate=?
		        pstmt = conn.prepareStatement(sql.toString());
		        pstmt.setString(1, reason);
		        //pstmt.setDate(2, dto.getMem_expirydate()); 
		        pstmt.setString(2, id); 
		        pstmt.setString(3, password); 		    
		        pstmt.executeUpdate(); // 쿼리 실행
		        returnValue = true;		       
	        }catch(Exception e) {
	        	e.printStackTrace();
	        }finally {
				try {
					closeAll();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        }
	        return returnValue;
	    }
	 
	 
	//회원정보 수정 (UPDATE SET WHERE)(modifyInfoPro)
	public void modifyMemberInfo(MemberDTO dto)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {//커넥션
			
			StringBuffer sql = new StringBuffer();
			conn = getConnection();
			sql.append("UPDATE MEMBER SET "); 
			sql.append("mem_nickname=?, mem_password=?, mem_name=?, mem_gender=?, mem_email=?, mem_tel=?, mem_land_tel=?, "
					+ "mem_zip_code=?, mem_address=?, mem_birthdate=?, terms_sns=?, terms_email=? ");
			sql.append("WHERE mem_id=?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getMem_nickname());
			pstmt.setString(2, dto.getMem_password());
			pstmt.setString(3, dto.getMem_name());
			pstmt.setString(4, dto.getMem_gender());
			pstmt.setString(5, dto.getEmail1()+"@"+dto.getEmail2());
			pstmt.setString(6, dto.getTel1()+"-"+dto.getTel2()+"-"+dto.getTel3());
			pstmt.setString(7, dto.getLtel1()+"-"+dto.getLtel2()+"-"+dto.getLtel3());
			pstmt.setString(8, dto.getMem_zip_code());
			pstmt.setString(9, dto.getAddress1()+";"+dto.getAddress2());
			pstmt.setString(10, dto.getMem_birthdate());
			pstmt.setString(11, dto.getTerms_sns());
			pstmt.setString(12, dto.getTerms_email());	 
			pstmt.setString(13, dto.getMem_id());
			pstmt.executeUpdate(); //완료시 커밋
		 } catch (Exception sql) {
	            sql.printStackTrace();
	       } finally {
	    	   		closeAll();
	       }
	 }
	
	//회원정보 수정 (UPDATE SET WHERE)(modifyInfoPro)
		public void modifyEnterpriseInfo(MemberDTO dto)throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {//커넥션
				
				StringBuffer sql = new StringBuffer();
				conn = getConnection();
				sql.append("UPDATE MEMBER SET "); 
				sql.append("mem_nickname=?, mem_password=?, mem_name=?, mem_gender=?, mem_email=?, mem_tel=?, mem_land_tel=?, "
						+ "mem_zip_code=?, mem_address=?, mem_birthdate=?, terms_sns=?, terms_email=? ");
				sql.append("WHERE mem_id=?");
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(1, dto.getMem_nickname());
				pstmt.setString(2, dto.getMem_password());
				pstmt.setString(3, dto.getMem_name());
				pstmt.setString(4, dto.getMem_gender());
				pstmt.setString(5, dto.getEmail1()+"@"+dto.getEmail2());
				pstmt.setString(6, dto.getTel1()+"-"+dto.getTel2()+"-"+dto.getTel3());
				pstmt.setString(7, dto.getLtel1()+"-"+dto.getLtel2()+"-"+dto.getLtel3());
				pstmt.setString(8, dto.getMem_zip_code());
				pstmt.setString(9, dto.getAddress1()+";"+dto.getAddress2());
				pstmt.setString(10, dto.getMem_birthdate());
				pstmt.setString(11, dto.getTerms_sns());
				pstmt.setString(12, dto.getTerms_email());	 
				pstmt.setString(13, dto.getMem_id());
				pstmt.executeUpdate(); //완료시 커밋
			 } catch (Exception sql) {
		            sql.printStackTrace();
		       } finally {
		    	   		closeAll();
		       }
		 }
	
	// 프로필 수정 (UPDATE MEMBER SET)(modifyProfilePro) 
	public void modifyMemberProfile(MemberDTO dto)throws Exception{
		try {//커넥션
			conn = getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE MEMBER SET ");
			sql.append("mem_nickname=?, mem_img=?, mem_intro=? ");
			sql.append("WHERE mem_id=?");
			pstmt = conn.prepareStatement(sql.toString());
		    pstmt.setString(1, dto.getMem_nickname());
			pstmt.setString(2, dto.getMem_img());
			pstmt.setString(3, dto.getMem_intro());
			pstmt.setString(4, dto.getMem_id());
		    pstmt.executeUpdate();
			} catch (Exception sql) {
				sql.printStackTrace();
			}finally {
				closeAll();
		}
	}

	
	//자원 반납
	public void closeAll() throws Exception{

		if(rs !=null) {try{rs.close();} catch(SQLException s ) {}}
		if(pstmt !=null) {try{pstmt.close();} catch(SQLException s ) {}}
		if(conn !=null) {try{conn.close();} catch(SQLException s ) {}}
	}
}  