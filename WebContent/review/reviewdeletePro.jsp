<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ch08.board.BoardDAO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  String writer = (String)session.getAttribute("memId");
  String sessionId = (String)session.getAttribute("memId");


  BoardDAO dbPro = BoardDAO.getInstance();
  if(sessionId !=null && sessionId.equals("admin")){
	  int check = dbPro.deleteArticle(num);%>
	 <script>
	 	alert("삭제 완료");
	 	window.location.href="reviewList.jsp"
	 
	 </script>
  <%}else{int check = dbPro.deleteArticle(num, writer);

  if(check==1){
%>
	
	<meta http-equiv="Refresh" content="0;url=reviewList.jsp?pageNum=<%=pageNum%>" >
	  <script laguage="JavaScript">
	  <!--
	  alert("삭제완료");
	  history.go(-1);
	  -->
	  
	  </script>
<% }else{%>
      
<%
    }
 %>
 <% }%>
  