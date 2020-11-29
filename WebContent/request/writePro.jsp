<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import = "animal.board.Req_boardDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="article" scope="page" class="animal.board.Request_bDataBean">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
 
<%
    article.setReg_data(new Timestamp(System.currentTimeMillis()) );
	article.setIp(request.getRemoteAddr());
	
	Req_boardDBBean dbPro = Req_boardDBBean.getInstance();
    dbPro.insertArticle(article);

    response.sendRedirect("requestList.jsp");
%>
