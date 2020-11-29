<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ch08.board.BoardDAO" %>
<%@page import="ch08.board.BoardDTO" %>
<%@page import="java.util.List" %>
<%@page import="java.text.SimpleDateFormat" %>
<jsp:include page="../_comm/_head.jsp"></jsp:include>
<head>
<link href="/animal/css/style.css" rel="stylesheet">
</head>
<title>main</title>

	<!-- 여기부터 reviewList -->
	<%!
    int pageSize = 10 ;
    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number=0;

    List articleList = null;
    BoardDAO dbPro = BoardDAO.getInstance();
    count = dbPro.getArticleCount();
    if (count > 0) {
        articleList = dbPro.getArticles(startRow, endRow);
    }

	number=count-(currentPage-1)*pageSize;
	
	String sessionId = (String)session.getAttribute("memId");
%>
	<div class="container">
		<div class="row">
	<%
	if (count == 0){ 
	%>
	<table width="700" border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td align="center">
			게시판에 저장된 글이 없습니다.
			</td>
		</tr>
	</table>
	
	<%}else{ %>
			<table class="table talble-striped" style="text-align: center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th style="bgcolor:#eeeeee; text-align: center;">번호</th>
						<th style="bgcolor:#eeeeee; text-align: center;">제목</th>
						<th style="bgcolor:#eeeeee; text-align: center;">작성자</th>
						<th style="bgcolor:#eeeeee; text-align: center;">작성일</th>
						<th style="bgcolor:#eeeeee; text-align: center;">조회</th>	
					</tr>
	<%	
		if(articleList !=null){
		for(int i =0; i <articleList.size();i++){
				BoardDTO article = (BoardDTO)articleList.get(i);
		
	%>
		<tr height="30">
			<td align="center" width="50"><%=number-- %></td>
			<td width="250">
			
			<a href="reviewcontent.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
           <%=article.getSubject()%></a> 
          <% if(article.getReadcount()>=20){%>
         <img src="images/hot.gif" border="0"  height="16"><%}%> </td>
    <td align="center"  width="100"><%=article.getWriter()%></a></td>
    <td align="center"  width="150"><%= sdf.format(article.getReg_date())%></td>
    <td align="center"  width="50"><%=article.getReadcount()%></td>
  </tr>
			<%} %>
				</thead>
				<tbody>
					<tr>
						
					</tr>
				</tbody>
			<%}%>
			</table>
			<%} %>
			
			<%
    if (count > 0) {
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		 
        int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 10) {    %>
        <a href="reviewList.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) { 
        	if(currentPage == i){%>
        	
        		<a href="reviewList.jsp?pageNum=<%= i %>"><FONT color="000080"><b>[<%= i %>]</b></FONT></a>
<%			}else{%>
				<a href="reviewList.jsp?pageNum=<%= i %>">[<%= i %>]</a>
			<%}
        }
        if (endPage < pageCount) {  %>
        <a href="reviewList.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%
        }
    }
%>
<% if(sessionId !=null){ %>
			<a href="reviewForm.jsp" class="btn btn-primary pull-right">글쓰기</a> 
<%} %>
		</div>
	</div>
		







<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<jsp:include page="/_comm/_tail.jsp"></jsp:include>
</body>
</html>