<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.List" %>
<%@ page import = "animal.board.Notice_DBBean" %>
<%@ page import = "animal.board.Notice_DataBean" %>
<jsp:include page="../_comm/_head.jsp"></jsp:include>
<html>
<head>
<title>공지사항 페이지</title>
<link href="/animal/css/style.css" rel="stylesheet">
</head> 

<%! 
	int pageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<% 
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
	Notice_DBBean dbPro = Notice_DBBean.getInstance();
	count = dbPro.getArticleCount();
	if(count > 0){
		articlesList = dbPro.getArticles(startRow, endRow);
	}
	
	number=count-(currentPage-1)*pageSize;
	
	String memId = (String)session.getAttribute("memId");
%>

<body>
	<center> <b>공지사항(전체 글 : <%=count %>)</b>
		<table width="700">
			<tr>
				<td align = "right" >
				<% if(memId !=null){ %>
					<% if("admin".equals(memId)){ %>
						<a href="noticeForm.jsp">글쓰기</a>
					<%}%>
				<%}%>
				</td>
			</tr>
		</table>
		<%
			if(count == 0){
		%>	
		<table width="700" border="1" cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td align="center">
				게시판에 저장된 글이 없습니다. 
				</td>
		</table>
		<%}else{		%>
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
			Notice_DataBean article = (Notice_DataBean)articlesList.get(i);
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
	
	<a href="content.jsp?num=<%=article.getNum() %>&pageNum=<%=currentPage %>&readcount=<%=article.getReadcount()%>">
	<%=article.getTitle() %>
	<% if(article.getReadcount() >= 20){ %>
	<img src="images/hot.gif" border="0" height="16"> <%} %></td>
	
	<td align="center" width="100" >
	운영자</td>
	<td align="center" width="150"><%=sdf.format(article.getReg_data()) %></td>
	<td align="center" width="50"><%=article.getReadcount() %></td>
	
	<% } %>
		</table>
				
			<%} %>
		<%
			if(count >0){
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0:1);
				
				int startPage=(int)(currentPage/10)*10+1;
				int pageBlock = 10;
				int endPage = startPage + pageBlock -1;
				if(endPage > pageCount) endPage = pageCount;
				
				if(startPage > 10) {%>
					<a href = "noticeList.jsp?pageNum"=<%=startPage -10%>">[이전]</a>
<%				}
				for(int i = startPage ; i <= endPage ; i++){%>
				<a href="noticeList.jsp?pageNum=<%=i%>">[<%=i %>]</a>
				<%}
				if(endPage < pageCount){%>
					<a href="B_notice/noticeList.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
<%				} 
			}
		%>
	</center>
</body>
</html>
<jsp:include page="../_comm/_tail.jsp"></jsp:include>