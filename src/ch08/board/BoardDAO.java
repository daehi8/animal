package ch08.board;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.*;

public class BoardDAO {
	private static BoardDAO instance = new BoardDAO();
	
	//싱글톤
	public static BoardDAO getInstance() {
		return instance;
		
	}
	private BoardDAO() {
    }
	//connection
	 private Connection getConnection() throws Exception {
	      Context initCtx = new InitialContext();
	      Context envCtx = (Context) initCtx.lookup("java:comp/env");
	      DataSource ds = (DataSource)envCtx.lookup("jdbc/orcl");
	      return ds.getConnection();
	    }
	 
	 //db 저장 및 업데이트
	 public void insertArticle(BoardDTO article) 
			    throws Exception {
			        Connection conn = null;
			        PreparedStatement pstmt = null;
					ResultSet rs = null;

					int num=article.getNum();
					int number=0;
			        String sql="";

			        try {
			            conn = getConnection();

			            pstmt = conn.prepareStatement("select max(num) from review");
						rs = pstmt.executeQuery();
						
						if (rs.next())
					      number=rs.getInt(1)+1;
					    else
					      number=1;  
			            // 쿼리를 작성
			            sql = "insert into review(num,writer,email,subject,passwd,reg_date,";
					    sql+="content,ip,img) values(review_seq.nextval,?,?,?,?,?,?,?,?)";

			            pstmt = conn.prepareStatement(sql);
			            pstmt.setString(1, article.getWriter());
			            pstmt.setString(2, article.getEmail());
			            pstmt.setString(3, article.getSubject());
			            pstmt.setString(4, article.getPasswd());
						pstmt.setTimestamp(5, article.getReg_date());
						pstmt.setString(6, article.getContent());
						pstmt.setString(7, article.getIp());
						pstmt.setString(8, article.getImg());
						
			            pstmt.executeUpdate();
			        } catch(Exception ex) {
			            ex.printStackTrace();
			        } finally {
						if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			        }
			    }
			    //ㄱ
				public int getArticleCount()
			    throws Exception {
			        Connection conn = null;
			        PreparedStatement pstmt = null;
			        ResultSet rs = null;

			        int x=0;

			        try {
			            conn = getConnection();           
			            pstmt = conn.prepareStatement("select count(*) from review");
			            rs = pstmt.executeQuery();

			            if (rs.next()) {
			               x= rs.getInt(1);
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

				public List getArticles(int start, int end)
			    throws Exception {
			        Connection conn = null;
			        PreparedStatement pstmt = null;
			        ResultSet rs = null;
			        List articleList=null;
			        try {
			            conn = getConnection();
			            
			            pstmt = conn.prepareStatement(
			            		"select num,writer,email,subject,passwd,reg_date,content,ip,readcount,img,r" + 
			            		"        					from (select num,writer,email,subject,passwd,reg_date,content,ip,readcount,img,rownum r" + 
			            		"        					from (select num,writer,email,subject,passwd,reg_date,content,ip,readcount,img " + 
			            		"        					from review order by reg_date desc)) where r >= ? and r <= ? ");
			            pstmt.setInt(1, start);
						pstmt.setInt(2, end);
			            rs = pstmt.executeQuery();

			            if (rs.next()) {
			                articleList = new ArrayList(end);
			                do{
			                	BoardDTO article= new BoardDTO();
							  article.setNum(rs.getInt("num"));
							  article.setWriter(rs.getString("writer"));
			                  article.setEmail(rs.getString("email"));
			                  article.setSubject(rs.getString("subject"));
			                  article.setPasswd(rs.getString("passwd"));
						      article.setReg_date(rs.getTimestamp("reg_date"));
							  article.setReadcount(rs.getInt("readcount"));
			                  article.setContent(rs.getString("content"));
						      article.setIp(rs.getString("ip"));
						      article.setImg(rs.getString("img"));
							  
			                  articleList.add(article);
						    }while(rs.next());
						}
			        } catch(Exception ex) {
			            ex.printStackTrace();
			        } finally {
			            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			        }
					return articleList;
			    }
			 
			    public BoardDTO getArticle(int num)
			    throws Exception {
			        Connection conn = null;
			        PreparedStatement pstmt = null;
			        ResultSet rs = null;
			        BoardDTO article=null;
			        try {
			            conn = getConnection();

			            pstmt = conn.prepareStatement(
			            	"update review set readcount=readcount+1 where num = ?");
						pstmt.setInt(1, num);
						pstmt.executeUpdate();

			            pstmt = conn.prepareStatement(
			            	"select * from review where num = ?");
			            pstmt.setInt(1, num);
			            rs = pstmt.executeQuery();

			            if (rs.next()) {
			                article = new BoardDTO();
			                article.setNum(rs.getInt("num"));
							article.setWriter(rs.getString("writer"));
			                article.setEmail(rs.getString("email"));
			                article.setSubject(rs.getString("subject"));
			                article.setPasswd(rs.getString("passwd"));
						    article.setReg_date(rs.getTimestamp("reg_date"));
							article.setReadcount(rs.getInt("readcount"));
			                article.setContent(rs.getString("content"));
						    article.setIp(rs.getString("ip"));
						    article.setImg(rs.getString("img"));
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

			    public BoardDTO updateGetArticle(int num)
			    throws Exception {
			        Connection conn = null;
			        PreparedStatement pstmt = null;
			        ResultSet rs = null;
			        BoardDTO article=null;
			        try {
			            conn = getConnection();

			            pstmt = conn.prepareStatement(
			            	"select * from review where num = ?");
			            pstmt.setInt(1, num);
			            rs = pstmt.executeQuery();

			            if (rs.next()) {
			                article = new BoardDTO();
			                article.setNum(rs.getInt("num"));
							article.setWriter(rs.getString("writer"));
			                article.setEmail(rs.getString("email"));
			                article.setSubject(rs.getString("subject"));
			                article.setPasswd(rs.getString("passwd"));
						    article.setReg_date(rs.getTimestamp("reg_date"));
							article.setReadcount(rs.getInt("readcount"));
			                article.setContent(rs.getString("content"));
						    article.setIp(rs.getString("ip"));
						    article.setImg(rs.getString("img"));
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

			    public void updateArticle(BoardDTO article)
			    throws Exception {
			        Connection conn = null;
			        PreparedStatement pstmt = null;
			        ResultSet rs= null;

			        String dbwriter="";
			        String sql="";
					int x=-1;
			        try {
			            conn = getConnection();
			            
						//이미지 빠져있음 이미지 넣을것
			          
			                sql="update review set writer=?,email=?,subject=?,passwd=?";
						    sql+=",content=?,img=? where num=?";
			                pstmt = conn.prepareStatement(sql);

			                pstmt.setString(1, article.getWriter());
			                pstmt.setString(2, article.getEmail());
			                pstmt.setString(3, article.getSubject());
			                pstmt.setString(4, article.getPasswd());
			                pstmt.setString(5, article.getContent());
			                pstmt.setString(6, article.getImg());
						    pstmt.setInt(7, article.getNum());
			                pstmt.executeUpdate();
							

			        } catch(Exception ex) {
			            ex.printStackTrace();
			        } finally {
						if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			        }
					
			    }
			    
			    public int deleteArticle(int num, String writer)
			    throws Exception {
			        Connection conn = null;
			        PreparedStatement pstmt = null;
			        ResultSet rs= null;
			        String dbwriter="";
			        int x=-1;
			        try {
						conn = getConnection();

			            pstmt = conn.prepareStatement(
			            	"select writer from review where num = ?");
			            pstmt.setInt(1, num);
			            rs = pstmt.executeQuery();
			            
						if(rs.next()){
							dbwriter= rs.getString("writer"); 
							if(dbwriter.equals(writer)){
								pstmt = conn.prepareStatement(
			            	      "delete from review where num = ? ");
			                    pstmt.setInt(1, num);
			                    pstmt.executeUpdate();
								x= 1; //글삭제 성공
							}else
								x= 0; //글삭 실패
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
			    //관리자 글삭제
			    public int deleteArticle(int num)
			    	    throws Exception {
			    	        Connection conn = null;
			    	        PreparedStatement pstmt = null;
			    	        ResultSet rs= null;
			    	        int x=-1;
			    	        try {
			    				conn = getConnection();
			    	            pstmt = conn.prepareStatement("delete from review where num=?");
			    	                    pstmt.setInt(1, num);
			    	                    pstmt.executeUpdate();
			    						x= 1; //글삭제 성공
			    					
			    	        } catch(Exception ex) {
			    	            ex.printStackTrace();
			    	        } finally {
			    	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			    	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			    	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			    	        }
			    			return x;
			    	    }
			    
			    public int getArticleCount(String writer)
			    	    throws Exception {
			    	        Connection conn = null;
			    	        PreparedStatement pstmt = null;
			    	        ResultSet rs = null;

			    	        int x=0;

			    	        try {
			    	            conn = getConnection();
			    	            
			    	            pstmt = conn.prepareStatement("select count(*) from review where writer=?");
			    	            rs = pstmt.executeQuery();

			    	            if (rs.next()) {
			    	               x= rs.getInt(1);
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
			    
			    public List getArticles(int start, int end,String wrieter)
			    	    throws Exception {
			    	        Connection conn = null;
			    	        PreparedStatement pstmt = null;
			    	        ResultSet rs = null;
			    	        List articleList=null;
			    	        try {
			    	            conn = getConnection();
			    	            
			    	            pstmt = conn.prepareStatement(
			    	            		"select num,writer,email,subject,passwd,reg_date,content,ip,img,readcount,r "+
			    	        					"from (select num,writer,email,subject,passwd,reg_date,content,ip,img,readcount,rownum r " +
			    	        					"from (select num,writer,email,subject,passwd,reg_date,content,ip,img,readcount ");
			    	            pstmt.setString(1, wrieter);
			    	            pstmt.setInt(2, start);
			    				pstmt.setInt(3, end);
			    	            rs = pstmt.executeQuery();

			    	            if (rs.next()) {
			    	                articleList = new ArrayList(end);
			    	                do{
			    	                	BoardDTO article= new BoardDTO();
			    					  article.setNum(rs.getInt("num"));
			    					  article.setWriter(rs.getString("writer"));
			    	                  article.setEmail(rs.getString("email"));
			    	                  article.setSubject(rs.getString("subject"));
			    	                  article.setPasswd(rs.getString("passwd"));
			    				      article.setReg_date(rs.getTimestamp("reg_date"));
			    					  article.setReadcount(rs.getInt("readcount"));
			    	                  article.setContent(rs.getString("content"));
			    				      article.setIp(rs.getString("ip")); 
			    				      article.setImg(rs.getString("img"));
			    					  
			    	                  articleList.add(article);
			    				    }while(rs.next());
			    				}
			    	        } catch(Exception ex) {
			    	            ex.printStackTrace();
			    	        } finally {
			    	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			    	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			    	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			    	        }
			    			return articleList;
			    	    }
			    
			    
}

	