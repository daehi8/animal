<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="member.MemberDAO" %>
<%@ page import="member.MemberDTO" %>

	<% 
		// 한글 인코딩 처리 
		request.setCharacterEncoding("UTF-8");
	%>
<jsp:useBean id="dto" class="member.MemberDTO" />
<jsp:setProperty property="*" name="dto"/>
    <%
    	String mem_nickname = request.getParameter("mem_nickname");
		MemberDAO dao = new MemberDAO();
    	int check_nickname = dao.checkNicname(mem_nickname);
    	
    	// 아이디 유효성 검사(중복검사)
    	if(check_nickname == 1){
 	%>
    <script>
        alert('이미 사용중인 닉네임 입니다.'); 
 		history.go(-1);
 	</script>

 	<%}else{%>
 	<script>
 		alert('사용가능한 닉네임 입니다.');
 		history.go(-1);
 	</script>
 	<%}%>
 	
    
   