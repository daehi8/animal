<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "ani.Pboard.MypetDTO" %>
<%@ page import = "ani.Pboard.PetDAO" %>
<%@ page import = "member.MemberDTO" %>
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

String sessionId = (String)session.getAttribute("id");
if(sessionId == "admin"){
	response.sendRedirect("#.jsp");
}
--%>
<%
List memDelList = null;
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

count = dao.getMemDelCount();		
if(count > 0){
	memDelList = dao.getMemDelList(startRow, endRow);
}

number = count - (currentPage - 1) * pageSize;

%>
	<b>탈퇴회원</b>
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
		<td>번호</td>
		<td>아이디</td>
		<td>탈퇴약관동의여부</td>
		<td>탈퇴이유</td>
	</tr>
	<%
	for(int i = 0; i < memDelList.size(); i++){
		MemberDTO dto = (MemberDTO)memDelList.get(i);
	%>
	<tr>
		<td><%=number-- %></td>
		<td><%=dto.getMem_id()%></td>
		<td><%=dto.getTerms_withdraw()%></td>
		<td><%=dto.getWithdraw_reason() %></td>
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
   	 	<a href="/animal/admint/memDelList.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      	}
    
    	// 페이지 숫자 설정
   		for (int i = startPage ; i <= endPage ; i++) {  %>
    	<a href="/animal/admin/memDelList.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%
    	}
    
  	 	// 현재 페이지에서 +10페이지
  	 	if (endPage < pageCount) {  %>
  	 	<a href="/animal/admin/memDelList.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%
   	 	}
	}
%>