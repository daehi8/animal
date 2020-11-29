<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="member.MemberDAO" %>
<%@ page import="member.MemberDTO" %>
<html>
<head>
<meta charset="UTF-8">
<!-- 간단한 이메일 체크 폼입니다 -->
<title>checkEmail</title>

	<%
		// 한글 인코딩 처리 
		request.setCharacterEncoding("UTF-8");
	
	%>

<jsp:useBean id="dto" class="member.MemberDTO" />
<jsp:setProperty property="*" name="dto"/>
</head>
<body>
    <%
    	
    	String mem_email = request.getParameter("mem_email");
		MemberDAO dao = new MemberDAO();
    	int check_email = dao.checkEmail(mem_email);
    	
    	// 아이디 유효성 검사(중복검사)
    	if(check_email == 1){
 	%>
    <script>
        alert('이미 사용중인 이메일 입니다.'); 
 		history.go(-1);
 	</script>

 	<%}else{%>
 	<script>
 		alert('사용가능한 이메일 입니다.');
 		history.go(-1);
 	</script>
 	<%}%>
 	
</body>
</html>