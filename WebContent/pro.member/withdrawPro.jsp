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
    	String reason = request.getParameter("withdraw_reason");
    	String id = session.getAttribute("memId").toString();
    	String password = request.getParameter("mem_password");
   	 	//String withdraw_reason = request.getParameter( "withdraw_reason" );
    	MemberDAO dao = MemberDAO.getInstance();
        boolean result = dao.withdraw(id, password, reason);
    if (result) {
    %>

     <%
  		// 현재 세션을 서버에서 제거
    	session.removeAttribute("memId");
 		// 모든세션정보 삭제
        session.invalidate();
    %>
        <script> 
    	 alert("회원이 탈퇴 되었습니다.");
    	 window.location='/animal/form.member/loginMainForm.jsp';
    	</script>
    <%
    	}else{
    %>
    <script>
    	alert("탈퇴할 수 없습니다 다시 한번 확인해 주세요.");
    	history.go(-1);
    </script>

    <%}%>
	