<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import = "animal.board.Req_boardDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<%	request.setCharacterEncoding("UTF-8");

	String sessionId = (String)session.getAttribute("memId");
	
  	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	Req_boardDBBean dbPro = Req_boardDBBean.getInstance();
	
	int result = dbPro.notDeleteComment(num);	
	if(result == 0){
		int check = dbPro.deleteArticle(num, sessionId);
		if(check==1){
			response.sendRedirect("requestList.jsp");
		
%>

 
		<%}else{%>
			<script>      
	          
	         alert("작성자만 삭제가 가능합니다.");
	         window.location="../main/login.jsp?";
	      </script>

		<%} %>
	<%}else {%>
	<script>
		alert("답글이 달린 게시글은 삭제가 불가능합니다.");
		window.history.go(-2);
	</script>
	<%} %>
	  

       
