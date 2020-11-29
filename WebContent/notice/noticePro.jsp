<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../_comm/_head.jsp" %>
<%@ page import="animal.board.Notice_DBBean" %>
<%@ page import="animal.board.Notice_DataBean" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>

	<title>공지사항</title>
	<h1>공지사항 페이지</h1>
	</head>
	
	<% 
	String memId = (String)session.getAttribute("memId");
	
	String save = request.getRealPath("save");
	int size = 1024*1024*10;
	String enc = "UTF-8";
	
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request, save, size, enc, dp);
	Notice_DataBean dto = new Notice_DataBean();
	
	dto.setTitle(mr.getParameter("title"));
	dto.setWriter("memId");  // 세션 아이디 입력 
	dto.setContents(mr.getParameter("contents"));
	dto.setImg(mr.getFilesystemName("img"));

	%>
	
	<% 
		Notice_DBBean dao = Notice_DBBean.getInstance();
		dao.insertArticle(dto);
	%>
	
	<script>
		alert("등록되었습니다");
		window.location="noticeList.jsp";
	</script>