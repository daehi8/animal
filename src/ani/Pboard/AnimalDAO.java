package ani.Pboard;

import java.sql.*;
import javax.sql.*; 
import javax.naming.*;
import java.util.*;


public class AnimalDAO {
	private static AnimalDAO instance = new AnimalDAO();
	
	public static AnimalDAO getInstance() { //dao 를 생성하기 위한 메서드
		return instance;
	}
	private AnimalDAO() {
		
	}
	private Connection getConnection() throws Exception{ 
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/orcl");
		return ds.getConnection();
	}
	public void delete(String no)throws Exception{ //리스트에서 게시물을 지우기 위한 메서드
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("delete from animals where no=?");
			pstmt.setString(1, no);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs !=null) {try{rs.close();} catch(SQLException s ) {}}
			if(pstmt !=null) {try{pstmt.close();} catch(SQLException s ) {}}
			if(conn !=null) {try{conn.close();} catch(SQLException s ) {}}
		}
	}
	
	
	public void insert(PboardDTO dto)throws Exception{// 게시물을 쓰기위한 메서드
		Connection conn =null;
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("insert into animals(no,name,img,city,kind,menual,reg) values(animals_seq.nextval,?,?,?,?,?,sysdate)");
			
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getImg());
			pstmt.setString(3, dto.getCity());
			pstmt.setString(4, dto.getKind());
			pstmt.setString(5, dto.getMenual());
			
			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs !=null) {try{rs.close();} catch(SQLException s ) {}}
			if(pstmt !=null) {try{pstmt.close();} catch(SQLException s ) {}}
			if(conn !=null) {try{conn.close();} catch(SQLException s ) {}}
		}
				
	}
	public int upload(String img) throws Exception{ //게시물 업로드시 이미지를올리기위한 메서드
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt.getConnection().prepareStatement("insert into animals(img) values=?");
			pstmt.setString(1, img);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs !=null) {try{rs.close();} catch(SQLException s ) {}}
			if(pstmt !=null) {try{pstmt.close();} catch(SQLException s ) {}}
			if(conn !=null) {try{conn.close();} catch(SQLException s ) {}}
		}
		return -1;
	}
	
	public ArrayList selectAll(String readcount,  String city, String kind, String np,String nb) throws Exception{ //모든 데이터를 리스트에 뽑을수있게 해주는 메서드
		ArrayList list = new ArrayList();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
			int lpp = 21; //화면에 보여줄 게시물수
			int ppb = 5;//페이징처리에 보여줄 페이지 개수
			String where = "";
			if (!"".equals(kind)) where += " and kind = '" + kind +"' ";//"" 안에 값이 들어가서 매치되면 쿼리 웨어절이 추가
			if (!"".equals(city)) where += " and city = '" + city +"' ";
			
			
			
			if ("".equals(np)) np = "1"; 
			if ("".equals(nb)) nb = "1";
			
			
			
			conn = getConnection();
			String qry = "select count(1) as tCnt from (select * from animals where no not in (select no from (select * from animals join mypet on animals.name = mypet.name where state != 2))) where 1=1 " + where;
			pstmt = conn.prepareStatement(qry);
			rs = pstmt.executeQuery();
			rs.next();
			
			int tCnt = Integer.parseInt(rs.getNString("tCnt"));
			int tPage = (int)Math.ceil(tCnt / lpp) + 1; 
			
			int tBlock = (int)Math.ceil(tCnt / lpp / ppb) + 1;
			if (tCnt%lpp == 0) tPage = tCnt/lpp;
		      else tPage = tCnt/lpp + 1;
		      
		      if (tPage%ppb == 0) tBlock = tPage/ppb;
		      else tBlock = tPage/ppb + 1;
			
			
			
			PboardDTO dto1 = new PboardDTO(); 
			dto1.settCnt(String.valueOf(tCnt));
			dto1.settPage(String.valueOf(tPage));
			dto1.settBlock(String.valueOf(tBlock));
			list.add(dto1);
			
			if (tCnt > 0) {
			
				qry = "select * from ( " 
					+ "select rownum rn, name,img,no,city,readcount,reg "
					+ "from animals "
					+ "where 1=1 " + where
					+ "and no not in (select no from (select * from animals join mypet on animals.name = mypet.name where state != 2))) z "
					+ "where rn > ("+nb+" - 1) * "+ppb+" + "+lpp+" * ("+np+" -1) and rn <= ("+nb+" - 1) * "+ppb+" + "+lpp+" * ("+np+") "
					+ "order by reg desc , readcount desc "; 
				pstmt = conn.prepareStatement(qry);
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					PboardDTO dto = new PboardDTO();
					dto.setNo(rs.getNString("no"));
					dto.setName(rs.getString("name"));
					dto.setImg(rs.getString("img"));
					dto.setCity(rs.getNString("city"));
					dto.setReadcount(rs.getNString("Readcount"));
					dto.setReg(rs.getTimestamp("reg"));
					
					list.add(dto);
					
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs !=null) {try{rs.close();} catch(SQLException s ) {}}
			if(pstmt !=null) {try{pstmt.close();} catch(SQLException s ) {}}
			if(conn !=null) {try{conn.close();} catch(SQLException s ) {}}
		}
		return list;
	}
	//상세페이지에서 정보들을 볼수있게 불러오는 메서드
	public PboardDTO getanimal(String no)throws Exception{
		PboardDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from animals where no=?");
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new PboardDTO();
				dto.setNo(rs.getString("no"));
				dto.setName(rs.getString("name"));
				dto.setImg(rs.getString("img"));
				dto.setMenual(rs.getString("menual"));
				dto.setCity(rs.getString("city"));
				dto.setKind(rs.getString("kind"));
				dto.setReadcount(rs.getString("readcount"));
				dto.setReg(rs.getTimestamp("reg"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs !=null) {try{rs.close();} catch(SQLException s ) {}}
			if(pstmt !=null) {try{pstmt.close();} catch(SQLException s ) {}}
			if(conn !=null) {try{conn.close();} catch(SQLException s ) {}}
		}
		return dto;
	}
	
	
	public String selectImg(String no)throws Exception { //이미지 업로드시 사진을 선택하기위한 메서드
		String img = null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement("select img from animals where no=?");
			pstmt.setString(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				img = rs.getString("img");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs !=null) {try{rs.close();} catch(SQLException s ) {}}
			if(pstmt !=null) {try{pstmt.close();} catch(SQLException s ) {}}
			if(conn !=null) {try{conn.close();} catch(SQLException s ) {}}
		}
		return img;
	}
	
	
	
	
	public void Update(PboardDTO dto)throws Exception{ // 게시물정보수정할떄 쓰는 메서드
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update animals set name=?,img=?,menual=?,city=?,kind=? where no=?");
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getImg());
			pstmt.setString(3, dto.getMenual());
			pstmt.setString(4, dto.getCity());
			pstmt.setString(5, dto.getKind());
			pstmt.setString(6, dto.getNo());
			pstmt.executeUpdate();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			
			if(pstmt !=null) {try{pstmt.close();} catch(SQLException s ) {}}
			if(conn !=null) {try{conn.close();} catch(SQLException s ) {}}
		}
		
	}
	
	public PboardDTO info(String no) throws Exception{ //게시물정보 수정을 위해 데이터값을 불러주는 메서드
		PboardDTO dto = new PboardDTO();
		Connection conn= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select no,name,img,menual,city,kind from animals where no=?");
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getString("no"));
				dto.setName(rs.getNString("name"));
				dto.setImg(rs.getNString("img"));
				dto.setMenual(rs.getNString("menual"));
				dto.setCity(rs.getNString("city"));
				dto.setKind(rs.getNString("kind"));
				
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs !=null) {try{rs.close();} catch(SQLException s ) {}}
			if(pstmt !=null) {try{pstmt.close();} catch(SQLException s ) {}}
			if(conn !=null) {try{conn.close();} catch(SQLException s ) {}}
		}
		return dto;
	}
	
	public PboardDTO getReadcount(String no)throws Exception {// 조회수를 측정하기위한 메서드
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		PboardDTO dto = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update animals set readcount = nvl(readcount,0) + 1 where no=?");
			pstmt.setString(1, no);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("select readcount from animals where no = ?");
			
			pstmt.setString(1, no);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new PboardDTO();
				
				
				dto.setReadcount(rs.getString("readcount"));
				
				
				
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return dto;
	}
	
	public ArrayList getadmin(int start, int end) throws Exception{ //어드민 페이지에서 보호하고있는 동물들 리스트를 뽑아주는 메서드
		PboardDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		ArrayList list = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select no,name,city,kind,readcount,reg,r " +
					"from(select no,name,city,kind,readcount,reg,rownum r " + 
					"from(select * from animals) ) where r >= ? and r <= ? "
					);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			list = new ArrayList(end);
			while(rs.next()) {
				dto = new PboardDTO();
				dto.setNo(rs.getString("no"));
				dto.setName(rs.getString("name"));
				dto.setCity(rs.getString("city"));
				dto.setKind(rs.getString("kind"));
				dto.setReadcount(rs.getString("readcount"));
				dto.setReg(rs.getTimestamp("reg"));
				list.add(dto);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs !=null) {try{rs.close();} catch(SQLException s ) {}}
			if(pstmt !=null) {try{pstmt.close();} catch(SQLException s ) {}}
			if(conn !=null) {try{conn.close();} catch(SQLException s ) {}}
		}
		return list;
	}
	public int gettcnt() throws Exception{ //어드민페이지에서 전체게시물수만큼 리스트를 뽑아줄수있게 전체 게시물 개수를 불러다주는 메서드
		int x=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(1) as tCnt from animals where 1=1");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs !=null) {try{rs.close();} catch(SQLException s ) {}}
			if(pstmt !=null) {try{pstmt.close();} catch(SQLException s ) {}}
			if(conn !=null) {try{conn.close();} catch(SQLException s ) {}}
		}
		return x;
	}
	public ArrayList selectpix(String readcount,  String city, String kind, String np,String nb) throws Exception{//메인 페이지에서 새로 들어온 동물들 사진을 몇개만 보여주는 메서드
		ArrayList list = new ArrayList();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
			int lpp = 5;
			int ppb = 5;
			String where = "";
			if (!"".equals(kind)) where += " and kind = '" + kind +"' ";
			if (!"".equals(city)) where += " and city = '" + city +"' ";
			
			
			
			if ("".equals(np)) np = "1";
			if ("".equals(nb)) nb = "1";
			
			
			
			conn = getConnection();
			String qry = "select count(1) as tCnt from animals where 1=1 " + where 
					+ "and no not in (select no from (select * from animals join mypet on animals.name = mypet.name where state != 2)) ";
			pstmt = conn.prepareStatement(qry);
			rs = pstmt.executeQuery();
			rs.next();
			
			int tCnt = Integer.parseInt(rs.getNString("tCnt"));
			int tPage = (int)Math.ceil(tCnt / lpp) + 1; 
			
			int tBlock = (int)Math.ceil(tCnt / lpp / ppb) + 1;
			if (tCnt%lpp == 0) tPage = tCnt/lpp;
		      else tPage = tCnt/lpp + 1;
		      // 珥� 釉붾윮�닔
		      if (tPage%ppb == 0) tBlock = tPage/ppb;
		      else tBlock = tPage/ppb + 1;
			
			
			
			PboardDTO dto1 = new PboardDTO(); 
			dto1.settCnt(String.valueOf(tCnt));
			dto1.settPage(String.valueOf(tPage));
			dto1.settBlock(String.valueOf(tBlock));
			list.add(dto1);
			
			if (tCnt > 0) {
			
				qry =	"SELECT * FROM ("
						+"SELECT * FROM ANIMALS "
						+"ORDER BY reg DESC)"
						+"WHERE rownum <=7"
						+"and no not in (select no from (select * from animals join mypet on animals.name = mypet.name where state != 2))";
				pstmt = conn.prepareStatement(qry);
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					PboardDTO dto = new PboardDTO();
					dto.setNo(rs.getNString("no"));
					dto.setName(rs.getString("name"));
					dto.setImg(rs.getString("img"));
					dto.setCity(rs.getNString("city"));
					dto.setReadcount(rs.getNString("Readcount"));
					dto.setReg(rs.getTimestamp("reg"));
					
					list.add(dto);
					
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs !=null) {try{rs.close();} catch(SQLException s ) {}}
			if(pstmt !=null) {try{pstmt.close();} catch(SQLException s ) {}}
			if(conn !=null) {try{conn.close();} catch(SQLException s ) {}}
		}
		return list;
	}
}



