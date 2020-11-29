<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "animal.board.Req_boardDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");

  Req_boardDBBean dbPro = Req_boardDBBean.getInstance();
  int check = dbPro.deleteArticle(num);
  if(check==1){
	  response.sendRedirect("requestList.jsp");
%>
 
		<%}else{%>
			<script>      
	          
	         alert("삭제되었습니다.");
	         window.location="../main/login.jsp?";
	      </script>

<%} %>
	  