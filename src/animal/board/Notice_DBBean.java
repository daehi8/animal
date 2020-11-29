package animal.board;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import java.util.*;

public class Notice_DBBean {
	
	private static Notice_DBBean instance = new Notice_DBBean();
	
	public static Notice_DBBean getInstance() {
		return instance;
	}
	
	private Notice_DBBean() {
		
	}
	
	private Connection getConnection()
	throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/orcl");
		return ds.getConnection();
	}
	
	public void insertArticle(Notice_DataBean article) // 글작성
	throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
					"insert into notice (num, title, writer, contents, img, reg_data) values (notice_seq.nextval, ?,?,?,?, sysdate)");
		
			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getWriter());
			pstmt.setString(3, article.getContents());
			pstmt.setString(4, article.getImg());
			
			pstmt.executeUpdate();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if (rs != null)try {rs.close(); }catch(SQLException ex) {}
			if (pstmt != null)try {pstmt.close(); }catch(SQLException ex) {}
			if (conn != null)try {conn.close(); }catch(SQLException ex) {}		
		}
	}
	public int getArticleCount() // 글 조회수
	throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from notice");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {	if (rs != null)try {rs.close(); }catch(SQLException ex) {}
			if (pstmt != null)try {pstmt.close(); }catch(SQLException ex) {}
			if (conn != null)try {conn.close(); }catch(SQLException ex) {}			}
		return x;
	}
	
	// 리스트		
	public List getArticles(int start, int end ) throws Exception{ 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articlesList = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select num, title, writer, contents, img, reg_data, readcount, ref, re_step, re_level, r "+
					"from (select num, title, writer, contents, img, reg_data, readcount, ref, re_step, re_level, rownum r "+
					"from (select * from notice order by ref desc, re_step asc) order by reg_data desc) where r >=? and r <=? ");
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
					
			if(rs.next()) {
				articlesList = new ArrayList(end);
				do {
					Notice_DataBean article = new Notice_DataBean();
					article.setNum(rs.getInt("num"));
					article.setTitle(rs.getString("title"));
					article.setWriter(rs.getString("writer"));
					article.setContents(rs.getString("contents"));
					article.setImg(rs.getString("img"));
					article.setReg_data(rs.getTimestamp("reg_data"));
					article.setReadcount(rs.getInt("readcount"));
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
	
	public Notice_DataBean getArticle(int num) throws Exception { 
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
		Notice_DataBean article=null;
			try {
			conn = getConnection();

			pstmt = conn.prepareStatement(
				 	"update notice set readcount=readcount+1 where num = ?");
					pstmt.setInt(1, num);
					pstmt.executeUpdate();

				    pstmt = conn.prepareStatement(
				        "select * from notice where num = ?");
				    pstmt.setInt(1, num);
				    rs = pstmt.executeQuery();

				    if (rs.next()) {
				    article = new Notice_DataBean();
				    article.setNum(rs.getInt("num"));
				    article.setTitle(rs.getString("title"));
					article.setWriter(rs.getString("writer"));
					article.setContents(rs.getString("contents"));
					article.setReg_data(rs.getTimestamp("reg_data"));
					article.setReadcount(rs.getInt("readcount"));
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
	
	public void updateArticle(Notice_DataBean article)
	throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(
					"update notice set writer=?, title=?, contents=? where num=?");
			
			
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getTitle());
			pstmt.setString(3, article.getContents());
			pstmt.setInt(4, article.getNum());
			pstmt.executeUpdate();

		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if (rs != null)try {rs.close(); }catch(SQLException ex) {}
			if (pstmt != null)try {pstmt.close(); }catch(SQLException ex) {}
			if (conn != null)try {conn.close(); }catch(SQLException ex) {}
		}

	}
	
	 public Notice_DataBean updateGetArticle(int num) // 게시글 수정
			    throws Exception {
			        Connection conn = null;
			        PreparedStatement pstmt = null;
			        ResultSet rs = null;
			        Notice_DataBean article=null;
			        try {
			            conn = getConnection();

			            pstmt = conn.prepareStatement(
			            	"select * from notice where num = ?");
			            pstmt.setInt(1, num);
			            rs = pstmt.executeQuery();

			            if (rs.next()) {
			            	article = new Notice_DataBean();
			                article.setNum(rs.getInt("num"));
							article.setWriter(rs.getString("writer"));
							article.setTitle(rs.getString("title"));
							article.setContents(rs.getString("contents"));
						    article.setReg_data(rs.getTimestamp("reg_data"));
							article.setReadcount(rs.getInt("readcount"));
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
					
	public void deleteArticle(int num) // 게시글 삭제
	throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
							"delete from notice where num = ? ");
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
			
			} catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
	    }
			
		}


