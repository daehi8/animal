<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch08.board.BoardDAO" %>
<%@ page import = "ch08.board.BoardDTO" %>
<%@ page import = "java.sql.Timestamp" %>
<%@page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import = "com.oreilly.servlet.MultipartRequest" %>

<% request.setCharacterEncoding("UTF-8");%>

<%
	request.setCharacterEncoding("UTF-8");
	String save = request.getRealPath("save");
	int size = 1024*1024*10; //10mb
	String enc = "UTF-8";
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request,save,size,enc,dp);
	String writer = (String)session.getAttribute("memId");
	BoardDTO article = new BoardDTO();
	
	article.setWriter(writer);
	article.setSubject(mr.getParameter("subject"));
	article.setContent (mr.getParameter("content"));
	article.setImg (mr.getFilesystemName("img"));
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
	article.setIp(mr.getParameter("ip"));
	
%>
 
<%

	BoardDAO dbPro = BoardDAO.getInstance();
    dbPro.insertArticle(article);

    response.sendRedirect("reviewList.jsp");
%>
