<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.List" %>
<%@ page import = "animal.board.Req_boardDBBean" %>
<%@ page import = "animal.board.Request_bDataBean" %>
<jsp:include page="../_comm/_head.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
<link href="/animal/css/style.css" rel="stylesheet">
</head>

<%
	request.setCharacterEncoding("UTF-8");	
	int pageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); 

	String opt =request.getParameter("opt");
	String condition =request.getParameter("condition");
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1)* pageSize +1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;
	
	List articlesList = null;
	Req_boardDBBean dbPro = Req_boardDBBean.getInstance();
	count = dbPro.getArticleCount(opt , condition);
	System.out.println(count);
	if(count > 0){
		articlesList = dbPro.getArticles(startRow, endRow,opt , condition);
	}
	
	number=count-(currentPage-1)*pageSize;
	//String memId = (String)session.getAttribute("memId");
%> 


<body>
	<center><b>1:1 문의하기(전체 글 :<%=count %>)</b>
	
	<!-- 자주묻는 질문 -->
	<table width="700" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<jsp:include page="../faq/faq.jsp" flush="false"/>
		</td>
	</tr>
	</table>
	
	<!-- 글목록 윗부분 -->
		<table width="700">
		
			<tr>
				<td align = "right" >
				<%-- <%if(memId != null){ %> --%>
				<a href="requestForm.jsp">문의하기</a>
				<%-- <%}else{ %> --%>
				<a href = "main.jsp">로그인</a>
				<%-- <%} %> --%>
				</td>
			</tr>
		</table>
			
		<%
			if(count == 0){
		%>
		<table width="700" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">
				게시판에 저장된 글이 없습니다. 
				</td>
		</table>
		<%}else{		%>
		
		<!-- 게시글 목록 부분 -->
		<table border = "1" width="700" cellpadding ="0" align="center">
			<tr height="30">
				<td align = "center" width="50">번호</td>
				<td align = "center" width="50">제  목</td>
				<td align = "center" width="50">작성자</td>
				<td align = "center" width="50">작성일</td>
				<td align = "center" width="50">조  회</td>
			</tr>
		<%
		for(int i = 0 ; i < articlesList.size() ; i++){
			Request_bDataBean article = (Request_bDataBean)articlesList.get(i);
		%>
		
	<tr height="30">
	<td align="center" width="50" > <%=number--%></td>
	<td align="left" width="250" >
	<%
		int wid=0;
		if(article.getRe_level()>0){
			wid=5*(article.getRe_level());
	%>
	<img src="images/level.gif" width="<%=wid %>" height="16">
	<img src="images/re.gif">
	<%}else{ %>
	<img src="images/level.gif" width="<%=wid%>" height="16">
	<%} %>
	
	<a href="content.jsp?num=<%=article.getNum() %>&pageNum=<%=currentPage %>">
	[<%=article.getType()%>]<%=article.getTitle() %></a>
	<% if(article.getReadcount()>=20){ %>
	<img src="images/hot.gif" border="0" height="16"><%} %> </td>
	<td align="center" width="100">
		<a href="mailto:<%=article.getEmail() %>"><%=article.getWriter() %></a></td>
	<td align="center" width="150"><%=sdf.format(article.getReg_data()) %></td>
	<td align="center" width="50"><%=article.getReadcount() %></td>
	</tr>
	<%} %>
		</table>
		
		<!-- 페이지 넘버 부분 -->
		<%} %>
		<%
			if(count >0){
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0:1);
				
				int startPage=(int)(currentPage/10)*10+1;
				int pageBlock = 10;
				int endPage = startPage + pageBlock -1;
				if(endPage > pageCount) endPage = pageCount;
				
				if(startPage > 10) {%>
					<a href = "requestList.jsp?pageNum"=<%=startPage -10%>">[이전]</a>
<%				}
				for(int i = startPage ; i <= endPage ; i++){%>
				<a href="requestList.jsp?pageNum=<%=i%>">[<%=i %>]</a>
				<%}
				if(endPage < pageCount){%>
					<a href="requestList.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
<%
				}
			}
		%>
		
		<!-- 검색 부분 -->
		<table class="search" style="border: hidden;">
			<form name="searchForm" action="searchList.jsp" method="post">
				<tr>
				<td><select name="opt">
					<option value="title">제목</option>
					<option value="contents">내용</option>
					<option value="title,contents">제목+내용</option>
					<option value="writer">글쓴이</option>
				</select></td>
				
				<td><input type="text" size = "20" name="condition" /></td>
				<td><input type="submit" value="검색" /></td>
				</tr>
			</form>
		</table>
	</center>
</body>
</html>
<jsp:include page="../_comm/_tail.jsp"></jsp:include>