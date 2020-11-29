<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "ani.Pboard.PocketDTO" %>
<%@ page import = "ani.Pboard.PboardDTO" %>
<%@ page import = "ani.Pboard.PetDAO" %>
<head>
	<link href="/animal/css/style.css" rel="stylesheet">
</head>
<jsp:include page="/_comm/_head.jsp"></jsp:include>    
<%
	String sessionId = (String)session.getAttribute("memId");
	if(sessionId == null){
		response.sendRedirect("/animal/main/main.jsp");
	}

	int count = 0;
	List pocketList = null;
	PetDAO dao = PetDAO.getInstance();	
	count = dao.getMyPocketCount(sessionId);
	
	if(count > 0){
		pocketList = dao.getPocket(sessionId);
	}
	
%>
<br>
<br>
<br>
<br>
<br>
<br>
<br><br>


<b>내 관심목록(전체 : <%=count %>)</b>
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
	<table>
		<tr>
			<td>이름</td>
			<td>사진</td>
			<td>지역</td>
			<td>종류</td>
			<td>메뉴</td>
		</tr>
<% 
	for(int i = 0; i <pocketList.size(); i++){
		PboardDTO dto = (PboardDTO)pocketList.get(i);
%>
		<tr>
			<td><%=dto.getName() %></td>
			<td><img alt = "" src = "/animal/save/<%=dto.getImg() %>" height="80" width="100"/></td>
			<td><%=dto.getCity() %></td>
			<td><%=dto.getKind() %></td>
			<td>
			<input type="button" value="삭제" 
				onclick="document.location.href='/animal/product/pocketDeletPro.jsp?no=<%=dto.getNo()%>&pro=<%="not"%>'">
			<input type = "button" value = "분양신청"
				onclick="document.location.href='/animal/product/buyPro.jsp?city=<%=dto.getCity()%>&name=<%=dto.getName()%>&id=<%=sessionId%>&no=<%=dto.getNo()%>'">	
	  		</td>
		</tr>
	<%}%>
	</table>
	<input type = "button" value = "전체삭제"
		onclick="document.location.href='/animal/product/pocketDeletPro.jsp?pro=<%="all"%>'"> 
</form>
<%}%>
