<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="member.MemberDAO" %>
<%@ page import="member.MemberDTO" %>
<!-- 단순삭제 방식으로 진행됨 -->
    <%
    	// 한글 인코딩 처리 
    	request.setCharacterEncoding("UTF-8");
    %>
    
    <jsp:useBean id="dto" class="member.MemberDTO" />
    <jsp:setProperty property="*" name="dto"/>
    
    
    <%
    	String mem_id = session.getAttribute("memId").toString();
    	String mem_password = request.getParameter("mem_password");
   	 	//String withdraw_reason = request.getParameter( "withdraw_reason" );
    	MemberDAO dao = MemberDAO.getInstance();
        boolean result = dao.delete(mem_id, mem_password);
    if (result) {
    %>
        <script> 
    	 alert("회원이 탈퇴 되었습니다.");
    	 window.location='/animal/form.member/loginMainForm.jsp';
    </script>
    <%
    	}else{
    %>
    <script>
    	alert("아이디나 비밀번호가 존재하지 않습니다.");
    	history.go(-1);
    </script>

    <%}%>
	