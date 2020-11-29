<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ani.Pboard.PetDAO"%>

<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id ="dto" scope = "page" class ="ani.Pboard.PocketDTO"></jsp:useBean>
<jsp:setProperty name = "dto" property = "*"/>


<%
String sessionId = (String)session.getAttribute("memId");
if(sessionId == null){
%>
<script>
	alert("로그인후 사용가능합니다.");
	window.location='/animal/main/login.jsp';
</script>
<% }else{%>
<%String id = request.getParameter("id");
String pb_no = request.getParameter("no");

PetDAO dao = PetDAO.getInstance();
boolean result = dao.PocketCheck(id, pb_no);
if(result){
%>
	<script>
		alert("이미 등록되었습니다.");
		history.go(-1);
	</script>
<%}else{
	dao.PocketInsert(id, pb_no);
%>
	<script>
		alert("등록되었습니다.");
		history.go(-1);
	</script>
<%}

}%>
