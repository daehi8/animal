<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import = "animal.board.Notice_DBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<%	request.setCharacterEncoding("UTF-8");
	String sessionId = (String)session.getAttribute("memId");
	int num = Integer.parseInt(request.getParameter("num"));

	String pageNum = request.getParameter("pageNum");
	  

	Notice_DBBean dbPro = Notice_DBBean.getInstance();
	dbPro.deleteArticle(num);
	response.sendRedirect("noticeList.jsp");
%>
	<script>
	alert("삭제되었습니다.");
	window.location="../notice/noticeList.jsp?";
	</script>
	