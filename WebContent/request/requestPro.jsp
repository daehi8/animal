<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../_comm/_head.jsp" %>
<%@ page import="animal.board.Req_boardDBBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<h1>requestPro 페이지</h1>
</head>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dto" scope="page" class="animal.board.Request_bDataBean">
<jsp:setProperty name="dto" property="*" />
</jsp:useBean>

<%
	String memId = (String)session.getAttribute("memId");
	Req_boardDBBean dao = Req_boardDBBean.getInstance();
	
	dao.insertArticle(dto);
%>

	

	<script>
		alert("등록되었습니다");
		window.location="requestList.jsp";
	</script>
