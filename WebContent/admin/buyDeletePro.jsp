<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ani.Pboard.PetDAO"%>
<%@ page import = "java.sql.Timestamp" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id ="dto" class ="ani.Pboard.MypetDTO"></jsp:useBean>
<jsp:setProperty name = "dto" property = "*"/>


<%
String userId = request.getParameter("id");
String name = request.getParameter("name");
String state = "2";

dto.setReg(new Timestamp(System.currentTimeMillis()));
PetDAO dao = PetDAO.getInstance();

dao.buyDelete(state, userId, name);

String toEmail = dao.getEmail(userId);
if(toEmail != null){
	dao.delNaverMailSend(toEmail);
}else{
%>
	<script>
	alert("이메일 정보가 잘못되었습니다.");
	history.go(-1);
</script>
<%}
// 승인취소시 항목변경 후 네이버 메일 전송
%>
<script>
	alert("취소되었습니다.");
	location.href="/animal/admin/buyAllList.jsp";
</script>
