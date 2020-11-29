<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<meta charset="UTF-8">
<!-- 아이디 체크 폼입니다 -->
<title>checkEmail</title>
<%@ page import="member.MemberDAO" %>
<%@ page import="member.MemberDTO" %>

	<%
		// 한글 인코딩 처리 
		request.setCharacterEncoding("UTF-8");
	%>
<jsp:useBean id="dto" class="member.MemberDTO" />
<jsp:setProperty property="*" name="dto"/>

    <%
    	String mem_id = request.getParameter("mem_id");
		MemberDAO dao = new MemberDAO();
    	int check_id = dao.checkID(mem_id);
    	
   
    	// 아이디 유효성 검사(중복검사)
    	if(check_id == 1){
 	%>
    <script>
        alert('이미 사용중인 아이디 입니다.'); 
 		history.go(-1);
 	</script>

 	<%}else{%>
 	<script>
 		alert('사용가능한 아이디 입니다.');
 		history.go(-1);
 	</script>
 	<%}%>
 	
    
   