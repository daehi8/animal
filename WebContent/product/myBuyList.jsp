<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "ani.Pboard.MypetDTO" %>
<%@ page import = "ani.Pboard.PetDAO" %>    
<head>
	<link href="/animal/css/style.css" rel="stylesheet">
</head>
<%
	String sessionId = (String)session.getAttribute("memId");
	if(sessionId == null){
		response.sendRedirect("/animal/main/main.jsp");
}
	
	int count = 0;
	List mypetList = null;
	PetDAO dao = PetDAO.getInstance();
	count = dao.getMyBuyCount(sessionId);
	
	if(count > 0){
		mypetList = dao.getMyPet(sessionId);
	}
%>
<jsp:include page="/_comm/_head.jsp"></jsp:include>
<br><br><br><br><br><br><br><br>
<b>내 신청목록(전체 : <%=count %>)</b>
<%
	if(count == 0){
%>
		<form>
			<table>
				<tr>
					<td> 저장된 품목이 없습니다.</td>
				</tr>
			</table>
	<%}else{%>
   	 <b>신청현황</b>
	<table>
		<tr>
			<td>이름</td>
			<td>지역</td>
			<td>상태</td>
			<td>신청시간</td>
		</tr>
	<% 
		for(int i = 0; i < mypetList.size(); i++){
			MypetDTO dto = (MypetDTO)mypetList.get(i); 
	%>
			<tr>
				<td><%=dto.getName() %></td>
				<td><%=dto.getCity() %></td>
				<td><%=dto.getVal() %></td>
				<td><%=dto.getReg() %></td>
		<%}%>
	</table>
</form>
<%}%>