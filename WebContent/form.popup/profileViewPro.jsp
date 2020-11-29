<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO" %>
<%@ page import="member.MemberDTO" %>

    <%
    	// 한글 인코딩 처리 
    	request.setCharacterEncoding("UTF-8");
    %>
    
    <jsp:useBean id="dto" class="member.MemberDTO" />
    <jsp:setProperty property="*" name="dto"/>
    
    
    <%
    	String id= session.getAttribute("memId").toString();
    	//dto.setMem_id(id);
    	MemberDAO dao = MemberDAO.getInstance();
        dao.memberViewProfile(dto.getMem_id());
		
    %> 
 	<script> 
	window.alert("로그인 되었습니다.");
	</script>