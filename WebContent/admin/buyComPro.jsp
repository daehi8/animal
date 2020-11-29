<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "ani.Pboard.PetDAO" %> 

<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id ="dto" scope = "page" class ="ani.Pboard.MypetDTO"></jsp:useBean>
<jsp:setProperty name = "dto" property = "*"/>

<% 
	String userId = request.getParameter("id");

	String state = "1";
	String no = request.getParameter("my_no");
	dto.setReg(new Timestamp(System.currentTimeMillis()));
	
	PetDAO dao = PetDAO.getInstance();
	
	dao.buyComUpdate(state,no);
	
	String toEmail = dao.getEmail(userId);
	if(toEmail != null){
		dao.comNaverMailSend(toEmail);
	}else{
	%>
	<script>
	alert("이메일 정보가 잘못되었습니다.");
	history.go(-1);
</script>
	<%}
	// 승인확인시 항목변경 후 네이버 메일 전송
	%>
<script>
	alert("완료되었습니다.");
	location.href="/animal/admin/buyAllList.jsp";
</script>
