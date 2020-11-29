package animal.board;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;


import java.util.*;

public class Req_boardDBBean {

	private static Req_boardDBBean instance = new Req_boardDBBean();
	
	public static Req_boardDBBean getInstance() {
		return instance;
	}

	private Object writer;
	
	private Req_boardDBBean() {
		
	}
	
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/orcl");
		return ds.getConnection();
	}
	
	// 占쎈��疫뀐옙占쎈�疫뀐옙 - 占쎈선占쎈굡沃��곗�� 揶�占쏙옙��
	public void insertArticle(Request_bDataBean article)
	throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num=article.getNum();
		String writer=article.getWriter();
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
		int number = 0;
		String sql ="";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select max(num) from request_b");
			rs = pstmt.executeQuery();
			
			if(rs.next())
				number=rs.getInt(1)+1;
			else
				number=1;
			if(num!=0) {
				sql="update request_b set type=?, re_step=re_step+1 where  ref=? and re_step > ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, article.getType());
				pstmt.setInt(2, ref);
				pstmt.setInt(3, re_step);
				pstmt.executeUpdate();
				re_step=re_step+1;
				re_level=re_level+1;
			}else {
				ref=number;
				re_step=0;
				re_level=0;
			}
			sql = "insert into request_b (num, type, writer, title, contents, email, phone, passwd, reg_data, ";
			sql+="readcount, ip, ref, re_step, re_level) values(request_b_seq.nextval, ?, ?, ?, ?,?,?,?,sysdate, 0, ?, ?, ?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getType());
			pstmt.setString(2, article.getWriter());
	        pstmt.setString(3, article.getTitle());
	        pstmt.setString(4, article.getContents());
	        pstmt.setString(5, article.getEmail());
	        pstmt.setString(6, article.getPhone());
	        pstmt.setString(7, article.getPasswd());
	        pstmt.setString(8, article.getIp());
	        pstmt.setInt(9, ref);
	        pstmt.setInt(10, re_step);
	        pstmt.setInt(11, re_level);
	        
			pstmt.executeUpdate();
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				if (rs != null)try {rs.close(); }catch(SQLException ex) {}
				if (pstmt != null)try {pstmt.close(); }catch(SQLException ex) {}
				if (conn != null)try {conn.close(); }catch(SQLException ex) {}
				
			}
		}

	public int getArticleCount()
	throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from request_b");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if (rs != null)try {rs.close(); }catch(SQLException ex) {}
			if (pstmt != null)try {pstmt.close(); }catch(SQLException ex) {}
			if (conn != null)try {conn.close(); }catch(SQLException ex) {}
		}
		return x;
	}
	
	
	public int getArticleCount(String col , String condition) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		String [] c = col.split(",");
		System.out.println(c.length);
		if(c.length == 1) {
			sql = "select count(*) from request_b where "+col+" like '%"+condition+"%'";
		}else {
			sql = "select count(*) from request_b where "+c[0]+" like '%"+condition+"%' or "+c[1]+" like '%"+condition+"%'";
		}
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if (rs != null)try {rs.close(); }catch(SQLException ex) {}
			if (pstmt != null)try {pstmt.close(); }catch(SQLException ex) {}
			if (conn != null)try {conn.close(); }catch(SQLException ex) {}
		}
		return x;
	}
	
	// 占쎈�뱄옙��筌�占� 筌ｌ����
	public List getArticles(int start, int end ) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articlesList = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select num, type, writer, title, contents, email, phone, passwd, reg_data, readcount, ip, ref, re_step, re_level, r "+
					"from (select num, type, writer, title, contents, email, phone, passwd, reg_data, readcount, ip, ref, re_step, re_level, rownum r "+
					"from (select * from request_b order by ref desc, re_step asc) order by ref desc, re_step asc) where r >=? and r<=? ");
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				articlesList = new ArrayList(end);
				do {
					Request_bDataBean article = new Request_bDataBean();
					article.setNum(rs.getInt("num"));
					article.setType(rs.getString("type"));
					article.setWriter(rs.getString("writer"));
					article.setTitle(rs.getString("title"));
					article.setContents(rs.getString("contents"));
					article.setEmail(rs.getString("email"));
					article.setPhone(rs.getString("phone"));
					article.setPasswd(rs.getString("passwd"));
					article.setReg_data(rs.getTimestamp("reg_data"));
					article.setReadcount(rs.getInt("readcount"));
					article.setIp(rs.getString("ip"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					articlesList.add(article);
				}while(rs.next());
			}
		
		}catch(Exception ex){
			ex.printStackTrace();
		}finally {
			if (rs != null)try {rs.close(); }catch(SQLException ex) {}
			if (pstmt != null)try {pstmt.close(); }catch(SQLException ex) {}
			if (conn != null)try {conn.close(); }catch(SQLException ex) {}
		}
		return articlesList;
	}
	
	// 野�����疫뀐옙 野�占쏙옙源� 疫꿸���
	public List getArticles(int start, int end , String col , String condition ) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articlesList = null;
		String sql = "";
		String [] c = col.split(",");
		if(c.length == 1) {
			sql = "select num, type, writer, title, contents, email, phone, passwd, reg_data, readcount, ip, ref, re_step, re_level, r "+
					"from (select num, type, writer, title, contents, email, phone, passwd, reg_data, readcount, ip, ref, re_step, re_level, rownum r "+
					"from (select * from request_b where "+col+" like '%"+condition+"%' order by ref desc, re_step asc) order by ref desc, re_step asc) where r >=? and r<=? ";
		}else{
			sql = "select num, type, writer, title, contents, email, phone, passwd, reg_data, readcount, ip, ref, re_step, re_level, r "+
					"from (select num, type, writer, title, contents, email, phone, passwd, reg_data, readcount, ip, ref, re_step, re_level, rownum r "+
					"from (select * from request_b where "+c[0]+" like '%"+condition+"%' or "+c[1]+" like '%"+condition+"%'  order by ref desc, re_step asc) order by ref desc, re_step asc) where r >=? and r<=? ";
		}
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				articlesList = new ArrayList(end);
				do {
					Request_bDataBean article = new Request_bDataBean();
					article.setNum(rs.getInt("num"));
					article.setType(rs.getString("type"));
					article.setWriter(rs.getString("writer"));
					article.setTitle(rs.getString("title"));
					article.setContents(rs.getString("contents"));
					article.setEmail(rs.getString("email"));
					article.setPhone(rs.getString("phone"));
					article.setPasswd(rs.getString("passwd"));
					article.setReg_data(rs.getTimestamp("reg_data"));
					article.setReadcount(rs.getInt("readcount"));
					article.setIp(rs.getString("ip"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					articlesList.add(article);
				}while(rs.next());
			}
		
		}catch(Exception ex){
			ex.printStackTrace();
		}finally {
			if (rs != null)try {rs.close(); }catch(SQLException ex) {}
			if (pstmt != null)try {pstmt.close(); }catch(SQLException ex) {}
			if (conn != null)try {conn.close(); }catch(SQLException ex) {}
		}
		return articlesList;
	}
	
	// 
	public Request_bDataBean getArticle(int num)
		    throws Exception {
		        Connection conn = null;
		        PreparedStatement pstmt = null;
		        ResultSet rs = null;
		        Request_bDataBean article=null;
		        try {
		            conn = getConnection();

		            pstmt = conn.prepareStatement(
		            	"update request_b set readcount=readcount+1 where num = ?");
					pstmt.setInt(1, num);
					pstmt.executeUpdate();

		            pstmt = conn.prepareStatement(
		            	"select * from request_b where num = ?");
		            pstmt.setInt(1, num);
		            rs = pstmt.executeQuery();

		            if (rs.next()) {
		                article = new Request_bDataBean();
		                article.setNum(rs.getInt("num"));
						article.setWriter(rs.getString("writer"));
						article.setTitle(rs.getString("title"));
						article.setContents(rs.getString("contents"));
		                article.setEmail(rs.getString("email"));
		                article.setPhone(rs.getString("phone"));
		                article.setPasswd(rs.getString("passwd"));
					    article.setReg_data(rs.getTimestamp("reg_data"));
						article.setReadcount(rs.getInt("readcount"));
						article.setIp(rs.getString("ip"));   
		                article.setRef(rs.getInt("ref"));
		                article.setRe_step(rs.getInt("re_step"));
						article.setRe_level(rs.getInt("re_level"));
		                
					      
					}
		        } catch(Exception ex) {
		            ex.printStackTrace();
		        } finally {
		            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		        }
				return article;
		    }	
	
	// 疫뀐옙 占쎈��占쎌��  & 占쎈씜占쎈�뀐옙��占쎈��
	public int updateArticle(Request_bDataBean article)
	throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dbwriter="";
		String sql = "";
		int x = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select writer from request_b where num = ?");
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbwriter= rs.getString("writer"); 
				if(dbwriter.equals(article.getWriter())) {
					sql="update request_b set type=?, title=? ,email=?";
					sql+=", contents=? ,phone=? where num=?";
					pstmt = conn.prepareStatement(sql);
				
					pstmt.setString(1, article.getType());
					pstmt.setString(2, article.getTitle());
					pstmt.setString(3, article.getEmail());
					pstmt.setString(4, article.getContents());
					pstmt.setString(5, article.getPhone());
					pstmt.setInt(6, article.getNum());
					pstmt.executeUpdate();
					x = 1;
				}else {
					x = 0;
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if (rs != null)try {rs.close(); }catch(SQLException ex) {}
			if (pstmt != null)try {pstmt.close(); }catch(SQLException ex) {}
			if (conn != null)try {conn.close(); }catch(SQLException ex) {}
		}
		return x;
	}
	
	 public Request_bDataBean updateGetArticle(int num) 
			    throws Exception {
			        Connection conn = null;
			        PreparedStatement pstmt = null;
			        ResultSet rs = null;
			        Request_bDataBean article=null;
			        try {
			            conn = getConnection();

			            pstmt = conn.prepareStatement(
			            	"select * from request_b where num = ?");
			            pstmt.setInt(1, num);
			            rs = pstmt.executeQuery();

			            if (rs.next()) {
			            	article = new Request_bDataBean();
			                article.setNum(rs.getInt("num"));
							article.setType(rs.getString("type"));
							article.setWriter(rs.getString("writer"));
							article.setTitle(rs.getString("title"));
							article.setContents(rs.getString("contents"));
			                article.setEmail(rs.getString("email"));
			                article.setPhone(rs.getString("phone"));
			                article.setPasswd(rs.getString("passwd"));
						    article.setReg_data(rs.getTimestamp("reg_data"));
							article.setReadcount(rs.getInt("readcount"));
							article.setIp(rs.getString("ip"));   
			                article.setRef(rs.getInt("ref"));
			                article.setRe_step(rs.getInt("re_step"));
							article.setRe_level(rs.getInt("re_level"));     
						}
			        } catch(Exception ex) {
			            ex.printStackTrace();
			        } finally {
			            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			        }
					return article;
			    }
			
	//占쎌��占쎄쉐占쎌��筌�占� 疫뀐옙占쎄�占쎌��
	 @SuppressWarnings("resource")
	public int deleteArticle(int num, String writer) 
	throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbwriter="";
		int x = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select writer from request_b where num =?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbwriter = rs.getString("writer");
				if(dbwriter !=null && dbwriter.equals(writer)) 
				{
					pstmt = conn.prepareStatement("delete from request_b where num = ?");
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					x = 1; 
				}
				else
					x=0;
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
	
	// 占쎈선占쎈굡沃��곗�� 疫뀐옙占쎄�占쎌��
	 public int deleteArticle(int num)  throws Exception { 
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs= null;
	        int x=-1;

	        try {
				conn = getConnection();
	            pstmt = conn.prepareStatement(
	            	"delete from request_b where num = ?");
	            pstmt.setInt(1, num);
	            pstmt.executeUpdate();
	            x= 1;
					
	        } catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
	        return x;
	    }

	 // 占쎈릭占쎈���븝옙 野�占쏙옙源�筌∽옙 - 疫뀐옙筌��몄� 揶�占쏙옙議�占쎌�ㅶ묾占�
	public ArrayList<Request_bDataBean> list(String col, String word) {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        List articlesList = null;
        
	    ArrayList<Request_bDataBean> list = new ArrayList<Request_bDataBean>();
	        
	        try {
	            conn = getConnection();
	            StringBuffer sql = new StringBuffer();
	            
	            
	            if (col.equals("none")) {
	                sql.append(" SELECT num,type, writer, title, contents, email,phone, passwd, reg_data, readcount, ip, ref, re_step, re_level ");
	                sql.append(" FROM  (select num, type, writer, title, contents, email, phone, passwd, reg_data, readcount, ip, ref, re_step, re_level, rownum r ");
	                sql.append(" WHERE type LIKE ? OR writer LIKE ?  OR title LIKE ? OR contents LIKE ?");
	                sql.append(" ORDER BY num DESC");
	                pstmt = conn.prepareStatement(sql.toString());
	                pstmt.setString(1, "%" + word + "%");
	                pstmt.setString(2, "%" + word + "%");
	                pstmt.setString(3, "%" + word + "%");
	                pstmt.setString(4, "%" + word + "%");
	                
	                
	            } else if (col.equals("type")) { // �얜��� 占쎌��占쎌��占쎌��嚥∽옙 野�占쏙옙源�
	                sql.append(" SELECT num,type, writer, title, contents, email,phone, passwd, reg_data, readcount, ip, ref, re_step, re_level ");
	                sql.append(" FROM request_b");
	                sql.append(" WHERE type LIKE ?");
	                sql.append(" ORDER BY num DESC");
	                pstmt = conn.prepareStatement(sql.toString());
	                pstmt.setString(1, "%" + word + "%");
	            } else if (col.equals("writer")) { // 占쎌��占쎄쉐占쎌��嚥∽옙 野�占쏙옙源�
	                sql.append(" SELECT num,type, writer, title, contents, email,phone, passwd, reg_data, readcount, ip, ref, re_step, re_level  ");
	                sql.append(" FROM request_b ");
	                sql.append(" WHERE writer LIKE ?");
	                sql.append(" ORDER BY num DESC");
	                pstmt = conn.prepareStatement(sql.toString());
	                pstmt.setString(1, "%" + word + "%");
	            } else if (col.equals("contents")) { // 占쎄땀占쎌��占쎌��嚥∽옙 野�占쏙옙源�
	                sql.append(" SELECT num,type, writer, title, contents, email,phone, passwd, reg_data, readcount, ip, ref, re_step, re_level ");
	                sql.append(" FROM request_b ");
	                sql.append(" WHERE contents LIKE ?");
	                sql.append(" ORDER BY num DESC");
	                pstmt = conn.prepareStatement(sql.toString());
	                pstmt.setString(1, "%" + word + "%");
	            } else if (col.equals("title_contents")) { // 占쎌�ｏ�占�+占쎄땀占쎌��占쎌��嚥∽옙 野�占쏙옙源�
	                sql.append(" SELECT num,type, writer, title, contents, email,phone, passwd, reg_data, readcount, ip, ref, re_step, re_level ");
	                sql.append(" FROM request_b ");
	                sql.append(" WHERE title LIKE ? OR contents LIKE ?");
	                sql.append(" ORDER BY num DESC");
	                pstmt = conn.prepareStatement(sql.toString());
	                pstmt.setString(1, "%" + word + "%");
	                pstmt.setString(2, "%" + word + "%");
	           
	            } else {
	                sql.append(" SELECT num,type, writer, title, contents, email,phone, passwd, reg_data, readcount, ip, ref, re_step, re_level ");
	                sql.append(" FROM request_b ");
	                sql.append(" ORDER BY num DESC");
	                pstmt = conn.prepareStatement(sql.toString());
	            }
	 
	            rs = pstmt.executeQuery(); // SELECT
	 
	            while (rs.next() == true) {
	            	Request_bDataBean vo = new Request_bDataBean();
	 
	                vo.setNum(rs.getInt("num"));
	                vo.setType(rs.getString("type"));
	                vo.setWriter(rs.getString("writer"));
	                vo.setTitle(rs.getString("title"));
	                vo.setContents(rs.getString("contents"));
	                vo.setEmail(rs.getString("email"));
	                vo.setPhone(rs.getString("phone"));
	                vo.setPasswd(rs.getString("passwd"));
	                vo.setReg_data(rs.getTimestamp("reg_data"));
	                vo.setReadcount(rs.getInt("readcount"));
	                vo.setIp(rs.getString("ip"));   
	                vo.setRef(rs.getInt("ref"));
	                vo.setRe_step(rs.getInt("re_step"));
	                vo.setRe_level(rs.getInt("re_level"));     
	 
	                list.add(vo);
	            }
	 
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
	        return list;
	}
	
	// ��湲��� ���� 寃���湲��� ������ �� ����濡�
	 public int notDeleteComment(int num) throws Exception { 
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs= null;
	        
	        int result = 0;
	        try {
				conn = getConnection();
				String sql = 
						" select * from (select * from request_b "
						+ "where ref in (select ref "
						+ "from (select ref, count(ref) "
						+ "from request_b group by ref having count(ref) > '1'))) where num=? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getInt(1);
				}
	        }catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
	        return result;
	    
}
}
	    





















