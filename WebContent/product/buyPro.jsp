<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "ani.Pboard.PetDAO" %> 

<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id ="dto" scope = "page" class ="ani.Pboard.MypetDTO"></jsp:useBean>
<jsp:setProperty name = "dto" property = "*"/>

<% 
	String no = request.getParameter("no");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String city = request.getParameter("city");
	String sessionId = (String)session.getAttribute("memId");
	if(sessionId == null){%>
	<script>
		alert('로그인후 사용가능합니다.');
		window.location='/animal/main/login.jsp';
	</script>
	<%}else{ %>
<% 	
	PetDAO dao = PetDAO.getInstance();
	//구매리스트 중복체크
	boolean result = dao.BuyCheck(name);
	if(result){
%>		
		<script>
			alert("분양이 완료된 동물입니다.");
			history.go(-1);
		</script>
	<%}else{	
		dao.buyInsert(id, name, city);
		dao.pocketDelete(id, no);
	%>
		<script>
			alert("신청되었습니다.");
			location.href = "/animal/product/myBuyList.jsp";
		</script>
	<%}%>
	<%}%>