<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "ani.Pboard.PboardDTO" %>
<%@ page import = "ani.Pboard.PetDAO" %>
<jsp:include page="/_comm/_headAdmin.jsp"></jsp:include>  
<head>
	<link href="/animal/css/style.css" rel="stylesheet">
</head>
<%--

number =  list 글번호
count = 게시글 총 갯수
pageSize = 게시글에 표시할 게시글 수
currenPage = 현재 페이지
startRow = 시작 글번호
endRow = 마지막 글번호

--%>
<%
List PocketPopularList = null;
PetDAO dao = PetDAO.getInstance();	

String pageNum = request.getParameter("pageNum");
if (pageNum == null){
	pageNum = "1";
}
int pageSize = 10;
int count = 0;	
int number = 0;

int currentPage = Integer.parseInt(pageNum);		
int startRow = (currentPage - 1) * pageSize + 1;	
int endRow = currentPage * pageSize;				

count = dao.getPocketPopularCount();		
if(count > 0){
	PocketPopularList = dao.getPocketPopularList(startRow, endRow);
}

number = 1;

%>
	<b>인기순</b>
	
<% 
	if(count == 0){
%>
<table>
	<tr>
    	<td>
   		 	게시판에 저장된 글이 없습니다.
    	</td>
    <tr>
</table>	
	<%}else{%>
<table>
	<tr>
		<td>인기순위</td>
		<td>동물이름</td>
		<td>지역</td>
		<td>동물품종</td>
		<td>관심받은횟수 </td>
	</tr>
	<%
	for(int i = 0; i < PocketPopularList.size(); i++){
		PboardDTO dto = (PboardDTO)PocketPopularList.get(i);
	%>
	<tr>
		<td><%=number++%></td>
		<td><a href = "/animal/anipboard/detail.jsp?no=<%=dto.getNo()%>"><%=dto.getName() %></a></td>
		<td><%=dto.getCity() %></td>
		<td><%=dto.getKind() %></td>
		<td><%=dao.getPocketPapolarCount(dto.getNo())%></td>
	</tr>
	<%}%>
</table>
<%}%>
<%
	if(count > 0){
		int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
	
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
		int endPage = startPage + pageBlock-1;
		if (endPage > pageCount) endPage = pageCount;
	
	    // 현재 페이지에서 -10페이지
   		if (startPage > 10) {    %>
   	 	<a href="/animal/admin/pocketPopularList.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      	}
    
    	// 페이지 숫자 설정
   		for (int i = startPage ; i <= endPage ; i++) {  %>
    	<a href="/animal/admin/pocketPopularList.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%
    	}
    
  	 	// 현재 페이지에서 +10페이지
  	 	if (endPage < pageCount) {  %>
  	 	<a href="/animal/admin/pocketPopularList.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%
   	 	}
	}
%>