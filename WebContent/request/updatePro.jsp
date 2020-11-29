<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "animal.board.Req_boardDBBean" %>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id = "dto" scope="page" class="animal.board.Request_bDataBean">
<jsp:setProperty name="dto" property="*" />
</jsp:useBean>

<%
	String memId = (String)session.getAttribute("memId");
	String pageNum = request.getParameter("pageNum");
	Req_boardDBBean dbPro = Req_boardDBBean.getInstance();
	int check = dbPro.updateArticle(dto);
	
	if(check==1){
		response.sendRedirect("requestList.jsp");
%>

<% }else{%>
  
     <script>
		alert("수정되었습니다.");
		window.location="content.jsp?num=<%=dto.getNum()%>";
	</script>
<%
    }
 %>  

 