package ani.Pboard;
import javax.mail.*;
import javax.mail.internet.*;
import javax.naming.*;
import javax.servlet.http.HttpServletRequest;

import java.util.*;
import java.sql.*;
import javax.sql.*;
import ani.Pboard.MypetDTO;
import ani.Pboard.PboardDTO;
import ani.Pboard.PocketDTO;
import ani.Pboard.VisitDTO;
import animal.board.Request_bDataBean;
import member.MemberDTO;

public class PetDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private static PetDAO instance = new PetDAO();
	
	// singleton
	public static PetDAO getInstance() {
		return instance;
	}
	
	// connect
	private Connection getConnection() throws Exception{
	      Context initCtx = new InitialContext();
	      Context envCtx = (Context) initCtx.lookup("java:comp/env");
	      DataSource ds = (DataSource)envCtx.lookup("jdbc/orcl");
	      return ds.getConnection();		
	}
	
	// ����ǰ�� �ߺ���� üũ
	public boolean PocketCheck(String id,String pb_no) {
		boolean result = false;
		try {
			conn = getConnection();
			String sql = "select * from pocket where id = ? and pb_no =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pb_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return result;
	}
	
	// ���Ž�û�� �ߺ� üũ
	public boolean BuyCheck(String name) {
		boolean result = false;
		try {
			conn = getConnection();
			String sql = "select * from mypet where name =? and state <='1'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return result;
	}
	
	// ����ǰ�� �߰�
	public void PocketInsert(String id, String pb_no) {
		try {
			conn = getConnection();
			String sql = "insert into pocket values(pocket_seq.nextval,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pb_no);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeAll();
		}
	}
	
	// ���� ����ǰ�� List
	public List getPocket(String id) {
		List pocketList = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select animals.no, animals.name, animals.img, animals.city, " +
					"animals.kind, pocket.no, pocket.id, pocket.pb_no " + 
					"from animals join pocket on animals.no = pocket.pb_no where id =? ");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			pocketList = new ArrayList();
			
			while(rs.next()) {
				PboardDTO dto = new PboardDTO();
				dto.setNo(rs.getString("no"));
				dto.setName(rs.getString("name"));
				dto.setImg(rs.getString("img"));
				dto.setCity(rs.getString("city"));
				dto.setKind(rs.getString("kind"));
				pocketList.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return pocketList;
	}
	
	// ���� ����ǰ�� ���� Ȯ��
	public int getMyPocketCount(String id) throws Exception{
        int x=0;
		try {
			 conn = getConnection();
			 pstmt = conn.prepareStatement("select count(*) from pocket where id=? ");
	         pstmt.setString(1, id);
			 rs = pstmt.executeQuery();
	         
	         
	         if(rs.next()) {
	        	 x = rs.getInt(1);
	         }
		}catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	closeAll();
        }
		return x;
	}
	
	// ���� ���Ž�û ���� Ȯ��
	public int getMyBuyCount(String id) throws Exception{
        int x=0;
		try {
			 conn = getConnection();
			 pstmt = conn.prepareStatement("select count(*) from mypet where id=? ");
	         pstmt.setString(1, id);
			 rs = pstmt.executeQuery();
	         
	         
	         if(rs.next()) {
	        	 x = rs.getInt(1);
	         }
		}catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	closeAll();
        }
		return x;
	}
	
	// ���ſϷ� ��ü���� Ȯ��
	public int getComCount() throws Exception{
        int x=0;
		try {
			 conn = getConnection();
			 pstmt = conn.prepareStatement("select count(*) from mypet where state='1'");
			 rs = pstmt.executeQuery();
	         
	         
	         if(rs.next()) {
	        	 x = rs.getInt(1);
	         }
		}catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	closeAll();
        }
		return x;
	}

	// ������� ��ü ���� Ȯ��
	public int getBuyDelCount() throws Exception{
        int x=0;
		try {
			 conn = getConnection();
			 pstmt = conn.prepareStatement("select count(*) from mypet where state='2'");
			 rs = pstmt.executeQuery();
	         
	         
	         if(rs.next()) {
	        	 x = rs.getInt(1);
	         }
		}catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	closeAll();
        }
		return x;
	}
	
	// ���Ž�û ��ü���� Ȯ��
	public int getBuyCount() throws Exception{
        int x=0;
		try {
			 conn = getConnection();
			 pstmt = conn.prepareStatement("select count(*) from mypet where state='0'");
			 rs = pstmt.executeQuery();
	         
	         
	         if(rs.next()) {
	        	 x = rs.getInt(1);
	         }
		}catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	closeAll();
        }
		return x;
	}
	
	// ����ǰ�� ����ǰ��Ȯ��
	public List pocketDeleteCheck(String id) {
		List noList = null;
		try {
			conn = getConnection();
			String sql = "select pb_no from pocket where id =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			noList = new ArrayList();
			while(rs.next()) {
				noList.add(rs.getString("pb_no"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return noList;
	}
	
	// ����ǰ�� ����
	public void pocketDelete(String id, String no) {
		try {
			conn = getConnection();
			String sql = "delete from pocket where id=? and pb_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, no);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
	}
	
	// ����ǰ�� ��ü����
	public void pocketAllDelete(String id) {
		try {
			conn = getConnection();
			String sql = "delete from pocket where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
	}
	
	// ���ŵ�� 
	public void buyInsert(String id, String name, String city) {
		try {
			conn = getConnection();
			String sql = "insert into mypet(my_no,id,name,city,reg) values(mypet_seq.nextval,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, city);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeAll();
		}
	}
	
	// ���� �� ���ŵ�� Ȯ��
	public List getMyPet(String id) {
		List mypetList = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from "
					+ "(select mypet.name,mypet.city,mypet.reg,state,state.val from "
					+ "mypet natural join state where id = ?)"
					+ "order by reg desc");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			mypetList = new ArrayList();
			while(rs.next()) {
				MypetDTO dto = new MypetDTO();
				dto.setName(rs.getString("name"));
				dto.setCity(rs.getString("city"));
				dto.setReg(rs.getTimestamp("reg"));
				dto.setState(rs.getString("state"));
				dto.setVal(rs.getString("val"));
				mypetList.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return mypetList;
	}
	
	// ��� ���Ž�û��� Ȯ��
	public List getBuyAllList(int start, int end) {
		List buyAllList = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select my_no,id,name,city,reg,r " +
					"from(select my_no,id,name,city,reg,rownum r " + 
					"from(select * from mypet where state = '0') ) where r >= ? and r <= ? ");
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			buyAllList = new ArrayList(end);
			while(rs.next()) {
				MypetDTO dto = new MypetDTO();
				dto.setMy_no(rs.getString("my_no"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setCity(rs.getString("city"));
				dto.setReg(rs.getTimestamp("reg"));
				buyAllList.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return buyAllList;
	}
	
	// ���ſϷ���·� ����
	public void buyComUpdate(String state, String my_no) {
		try {
			conn = getConnection();
			String sql = "update mypet set state=? where my_no=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, state);
			pstmt.setString(2, my_no);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeAll();
		}
	}
	
	// ���ſϷ�� ǰ�� ��� ����
	public List getbuyComAllList(int start, int end) {
		List buyComAllList = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select id,name,city,reg,r "+
					"from(select my_no,id,name,city,reg,rownum r " +
					"from (select * from mypet where state = '1' order by reg desc) ) where r >= ? and r <= ? ");
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			buyComAllList = new ArrayList(end);
			while(rs.next()) {
				MypetDTO dto = new MypetDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setCity(rs.getString("city"));
				dto.setReg(rs.getTimestamp("reg"));
				buyComAllList.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return buyComAllList;
	}

	// ������ҵ� ǰ�� ��� ����
	public List getBuyDelAllList(int start, int end) {
		List buyDelAllList = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select id,name,city,reg,r "+
					"from(select my_no,id,name,city,reg,rownum r " +
					"from (select * from mypet where state = '2' order by reg desc) ) where r >= ? and r <= ? ");
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			buyDelAllList = new ArrayList(end);
			while(rs.next()) {
				MypetDTO dto = new MypetDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setCity(rs.getString("city"));
				dto.setReg(rs.getTimestamp("reg"));
				buyDelAllList.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return buyDelAllList;
	}
	
	// ���Ž�û ���
	public void buyDelete(String state, String id, String name) {
		try {
			conn = getConnection();
			String sql = "update mypet set state=? where id=? and name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, state);
			pstmt.setString(2, id);
			pstmt.setString(3, name);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
	}
	
	// �湮�� �� ī����
	public void visitInsert(String ip) {
		try {
			conn = getConnection();
			String sql = "insert into visit(reg,ip) values (sysdate,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ip);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeAll();
		}
	}
	
	// ��ü �湮�� ��
	public int getAllVisit() throws Exception{
        int allCount=0;
		try {
			 conn = getConnection();
			 pstmt = conn.prepareStatement("select count(*) from visit");
			 rs = pstmt.executeQuery();
	         
	         
	         if(rs.next()) {
	        	 allCount = rs.getInt(1);
	         }
		}catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	closeAll();
        }
		return allCount;
	}
	
	// ���� �湮�� ��
	public int getDayVisit() throws Exception{
        int dayCount=0;
		try {
			 conn = getConnection();
			 pstmt = conn.prepareStatement(
					 "select count(*) from visit "+
					 "where to_date(reg,'YYYY-MM-DD') = to_date(sysdate,'YYYY-MM-DD') ");
			 rs = pstmt.executeQuery();
	         	    
	         if(rs.next()) {
	        	 dayCount = rs.getInt(1);
	         }
		}catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	closeAll();
        }
		return dayCount;
	}
	
	// ����ǰ�� ���� ����� ������ ����
	public List getPocketPopularList(int start, int end) {
		List PocketPopularList = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select result.*, rownum from "
					+ "(select no, name,city,kind,count(no) from "
					+ "(select animals.no, animals.name, animals.city, animals.kind from animals,pocket where animals.no = pocket.pb_no )"
					+ "group by no, name,city,kind order by count(no) desc) result where rownum >=? and rownum <=? ");
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			PocketPopularList = new ArrayList(end);
			while(rs.next()) {
				PboardDTO dto = new PboardDTO();
				dto.setNo(rs.getString("no"));
				dto.setName(rs.getString("name"));
				dto.setCity(rs.getString("city"));
				dto.setKind(rs.getString("kind"));
				PocketPopularList.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return PocketPopularList;
	}
	
	// ����ǰ�� ��ٱ��� ��ϰ��� Ȯ��
	public int getPocketPapolarCount(String no) throws Exception{
        int x=0;
		try {
			 conn = getConnection();
			 pstmt = conn.prepareStatement("select count(pb_no) from pocket where pb_no=? ");
	         pstmt.setString(1, no);
			 rs = pstmt.executeQuery();
	         
	         
	         if(rs.next()) {
	        	 x = rs.getInt(1);
	         }
		}catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	closeAll();
        }
		return x;
	}
	
	// ����ǰ�� �α������ �Խñۼ�
	public int getPocketPopularCount() throws Exception{
        int x=0;
		try {
			 conn = getConnection();
			 pstmt = conn.prepareStatement(
					 "select count(*) from animals,pocket where animals.no = pocket.pb_no" );
			 rs = pstmt.executeQuery();
	         	    
	         if(rs.next()) {
	        	 x = rs.getInt(1);
	         }
		}catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	closeAll();
        }
		return x;
	}
	
	// ���ν� ���̹� ���� ������
	public void comNaverMailSend(String toEmail) {
		String host = "smtp.naver.com";
		String user = "";
		String password = "";
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", "true");
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator(){
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			message.setSubject("�о� ��û�� ���εǾ����ϴ�.");
			message.setText("good!");
			Transport.send(message);
		}catch(MessagingException e) {
			e.printStackTrace();
		}
	}
	
	// ��ҽ� ���̹� ���� ������
	public void delNaverMailSend(String toEmail) {
		String host = "smtp.naver.com";
		String user = "";
		String password = "";
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", "true");
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator(){
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			message.setSubject("�о� ��û�� ��ҵǾ����ϴ�.");
			message.setText("sorry");
			Transport.send(message);
		}catch(MessagingException e) {
			e.printStackTrace();
		}
	}
	// ���� ���� ���̵� Ȯ��
	public String getEmail(String id) {
		String email = null;
		try {
			conn = getConnection();
			String sql = "select mem_email from member where mem_id =? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				email = rs.getString("mem_email");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return email;
	}
	
	// �湮�� �ֱ������ڼ� ����
	public List getVisitList(int start, int end) {
		List visitList = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select ip, reg, r from "+ 
					"(select ip, reg, rownum r from "+ 
					"(select ip, reg from visit order by reg desc)) "+ 
					"where r >= ? and r <= ? ");
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			visitList = new ArrayList(end);
			while(rs.next()) {
				VisitDTO dto = new VisitDTO();
				dto.setIp(rs.getString("ip"));
				dto.setReg(rs.getTimestamp("reg"));
				visitList.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return visitList;
	}
	
	// 1:1 ���� �亯 �ȴ޸� �۸� ����
	public List getRequestNewList() {
		List RequestNewList = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
				"select * from request_b where ref not in "
				+ "(select ref from (select ref, count(*) "
				+ "from request_b group by ref having count(*) > '1')) "
				+ "order by reg_data desc");
			rs = pstmt.executeQuery();
			RequestNewList = new ArrayList();
			while(rs.next()) {
				Request_bDataBean dto = new Request_bDataBean();
				dto.setNum(rs.getInt("num"));
				dto.setType(rs.getString("type"));
				dto.setTitle(rs.getString("title"));
				dto.setReg_data(rs.getTimestamp("reg_data"));
				RequestNewList.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return RequestNewList;
	}
	
	//����ȸ�� ��� ����
	public List getMemAllList(int start, int end) {
		List memAllList = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select result.* from(select member.*,rownum r from member where mem_flag = '1')result where r >= ? and r <= ? ");
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			memAllList = new ArrayList(end);
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setMem_id(rs.getString("mem_id"));
				dto.setMem_password(rs.getString("mem_password"));
				dto.setMem_name(rs.getString("mem_name"));
				dto.setMem_gender(rs.getString("mem_gender"));
				dto.setMem_email(rs.getString("mem_email"));
				dto.setMem_tel(rs.getString("mem_tel"));
				dto.setMem_birthdate(rs.getString("mem_birthdate"));
				dto.setMem_flag(rs.getString("mem_flag"));
				dto.setMem_nickname(rs.getString("mem_nickname"));
				dto.setMem_img(rs.getString("mem_img"));
				dto.setMem_intro(rs.getString("mem_intro"));				
				memAllList.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return memAllList;
	}
	
	// ����ȸ�� �� Ȯ��
		public int getMemAllCount() throws Exception{
	        int x=0;
			try {
				 conn = getConnection();
				 pstmt = conn.prepareStatement("select count(*) from member where mem_flag = '1'");
				 rs = pstmt.executeQuery();
		         
		         
		         if(rs.next()) {
		        	 x = rs.getInt(1);
		         }
			}catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
	        	closeAll();
	        }
			return x;
		}
	//	Ż��, ����ȸ�� ����Ʈ
		public List getMemDelList(int start, int end) {
			List memDelList = null;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(
						"select result.* from(select member.*,rownum r from member where mem_flag = '3')result where r >= ? and r <= ?");
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();
				memDelList = new ArrayList(end);
				while(rs.next()) {
					MemberDTO dto = new MemberDTO();
					dto.setMem_id(rs.getString("mem_id"));
					dto.setWithdraw_reason(rs.getString("withdraw_reason"));
					dto.setTerms_withdraw(rs.getString("terms_withdraw"));
					memDelList.add(dto);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				closeAll();
			}
			return memDelList;
		}		
		// Ż��,����ȸ�� �� Ȯ��
		public int getMemDelCount() throws Exception{
	        int x=0;
			try {
				 conn = getConnection();
				 pstmt = conn.prepareStatement("select count(*) from member where mem_flag = '3'");
				 rs = pstmt.executeQuery();
		         
		         
		         if(rs.next()) {
		        	 x = rs.getInt(1);
		         }
			}catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
	        	closeAll();
	        }
			return x;
		}		
		
	private void closeAll() {
		if(rs != null) {try {rs.close();}catch(SQLException s) {}}
		if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
		if(conn != null) {try {conn.close();}catch(SQLException s) {}}
	}
	
}
