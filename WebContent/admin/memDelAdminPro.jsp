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
    
    <%--<jsp:useBean id="dto" class="member.MemberDTO" />
    <jsp:setProperty property="*" name="dto"/>--%>
    
    
    <%
    	String reason = "정지";
    	String id = request.getParameter("userId");
    	String password = request.getParameter("password");
    	MemberDAO dao = MemberDAO.getInstance();
        boolean result = dao.withdraw(id, password, reason);
    if (result) {
    %>
        <script> 
    	 alert("회원이 탈퇴 되었습니다.");
    	 location.href="/animal/admin/memAllList.jsp";
    </script>
    <%
    	}else{
    %>
    <script>
    	alert("탈퇴할 수 업습니다 다시 한번 확인해 주세요.");
    	history.go(-1);
    </script>

    <%}%>