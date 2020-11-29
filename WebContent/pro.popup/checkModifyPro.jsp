<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="member.MemberDAO" %>
<%@ page import="member.MemberDTO" %>

	<%
		request.setCharacterEncoding("UTF-8");
	%>

<jsp:useBean id="dto" class="member.MemberDTO" />
<jsp:setProperty property="*" name="dto"/>
	
	<%

		String id = (String)session.getAttribute("memId");
		dto.setMem_id(id);
		String pw = request.getParameter("mem_password");

		MemberDAO dao = new MemberDAO();
		boolean result = dao.checkLogin(id, pw);
		
		if(result){
		session.setAttribute("matched", "ok");
		
		%>
	    <script>
	        alert('회원정보를 확인하였습니다. 해당 페이지로 이동합니다.'); 
	      	//세션 marched가 ok이면 checkModify.jsp로 ok값을 보냅니다.
			window.location="/animal/form.popup/checkModify.jsp?matched=ok";
	 	</script>

	 	<%}else{%>
	 	<script>
	 		alert('회원정보를 다시 한번 확인해주세요');
	 		history.go(-1);
	 	</script>
	 	<%}%>

    
 