<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO" %>
<%@ page import="member.MemberDTO" %> 
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>   
<% 
// 한글인코딩 처리
request.setCharacterEncoding("UTF-8");

// DB에서 아이디, 비밀번호 확인
MemberDAO dao = MemberDAO.getInstance();
// URL 및 로그인관련 전달 메시지
String msg = "";  
String db_flag = (String) session.getAttribute("db_flag");
            
if ("0".equals(db_flag) ) {
               
	msg = "/animal/form.member/loginAdminForm.jsp"; //mem_flag가 0면 어드민
            
} else if ("1".equals(db_flag) ) {
                
	msg = "/animal/form.member/loginMemberForm.jsp"; //mem_flag가 1면 일반회원
			
} else if ("2".equals(db_flag) ) {
                
	msg = "/animal/form.member/loginEnterpriseForm.jsp"; //mem_flag가 2면 기업회원
			
} else {
               
	msg = "/animal/form.member/loginMainForm.jsp"; //mem_flag가 3면 신고,탈퇴회원
            
}
response.sendRedirect(msg);
%>