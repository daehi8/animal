<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "ani.Pboard.PetDAO"%>
<% request.setCharacterEncoding("UTF-8");

String sessionId = (String)session.getAttribute("memId");
PetDAO dao = PetDAO.getInstance();
String no = request.getParameter("no");
String pro = request.getParameter("pro");
List noList = null;

// 아이디에 해당하는 관심품목에 있는 
noList = dao.pocketDeleteCheck(sessionId);
if(!"all".equals(pro)){
	if(noList.contains(no)){
		dao.pocketDelete(sessionId, no);	
	%>
	<script>            
		alert("삭제되었습니다.");
		location.href = "/animal/product/myPocketList.jsp";
	</script>
	<%}else{%>
		<script>            
		alert("삭제 실패.");
		history.go(-1);
		</script>
	<%}%>
<%}else{
dao.pocketAllDelete(sessionId);
%>
	<script>            
		alert("삭제되었습니다.");
		location.href = "/animal/product/myPocketList.jsp";
	</script>
<%}%>