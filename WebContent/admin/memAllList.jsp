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
List memAllList = null;
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

count = dao.getMemAllCount();		
if(count > 0){
	memAllList = dao.getMemAllList(startRow, endRow);
}

number = count - (currentPage - 1) * pageSize;

%>
	<b>가입회원</b>
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
		<td>비밀번호</td>
		<td>이름</td>
		<td>성별</td>
		<td>이메일</td>
		<td>전화번호</td>
		<td>생일</td>
		<td>닉네임</td>
		<td>삭제</td>
	</tr>
	<%
	for(int i = 0; i < memAllList.size(); i++){
		MemberDTO dto = (MemberDTO)memAllList.get(i);
	%>
	<tr>
		<td><%=number-- %></td>
		<td><%=dto.getMem_id()%></td>
		<td><%=dto.getMem_password() %></td>
		<td><%=dto.getMem_name() %></td>
		<td><%=dto.getMem_gender() %></td>
		<td><%=dto.getMem_email() %></td>
		<td><%=dto.getMem_tel() %></td>
		<td><%=dto.getMem_birthdate() %></td>
		<td><%=dto.getMem_nickname() %></td>
		<td><input type = "button" value = "삭제"
			onclick="document.location.href='/animal/admin/memDelAdminPro.jsp?userId=<%=dto.getMem_id()%>&password=<%=dto.getMem_password()%>'"></td>
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
   	 	<a href="/animal/admint/memAllList.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      	}
    
    	// 페이지 숫자 설정
   		for (int i = startPage ; i <= endPage ; i++) {  %>
    	<a href="/animal/admin/memAllList.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%
    	}
    
  	 	// 현재 페이지에서 +10페이지
  	 	if (endPage < pageCount) {  %>
  	 	<a href="/animal/admin/memAllList.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%
   	 	}
	}
%>