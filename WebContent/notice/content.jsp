<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "animal.board.Notice_DataBean" %>
<%@ page import = "animal.board.Notice_DBBean" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<jsp:include page="../_comm/_head.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice-Content 게시판</title>
<link href="/animal/css/style.css" rel="stylesheet">
</head>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	try{
		Notice_DBBean dbPro = Notice_DBBean.getInstance();
		Notice_DataBean article = dbPro.getArticle(num);
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
	
		
%>
<body>
<center><b>글 내용 보기</b></center>
<br>
<form>
<table width="500" border = "1" cellspacing = "0" cellpadding="0" align = "center">
	<tr height = "30">
		<td align = "center" width="125">글번호</td>
		<td align = "center" width="125" align="center"><%=article.getNum() %></td>
		<td align = "center" width="125">조회수</td>
		<td align = "center" width="125" align="center"><%=article.getReadcount() %></td>
	</tr>
	<tr height="30">
		<td align = "center" width="125">작성자</td>
		<td align = "center" width="125" align="center">운영자</td>
		<td align = "center" width="125">작성일</td>
		<td align = "center" width="125" align="center"><%=sdf.format(article.getReg_data()) %></td>
	</tr>
	<tr height="30">
		<td align="center" width="125">글제목</td>
		<td align = "center" width="125" align="center" colspan="3"><%=article.getTitle() %></td>
	</tr>
	<tr height="30">
		<td align="center" width="125">글내용</td>
		<td align = "left" width="375" colspan="3"><pre><%=article.getContents() %></pre></td>
	</tr>
	
	
	<tr height = "30">
		<td colspan="4" align="right">
		<%
			String memId = (String)session.getAttribute("memId");
			if(memId != null){
				if ("admin".equals(memId)){
		%>	
			<input type = "button" value = "글수정"
			onclick = "document.location.href='updateForm.jsp?num=<%=article.getNum() %>&pageNum=<%=pageNum%>&readcount=<%=article.getReadcount()%>'">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type = "button" value = "글 삭제"
			onclick = "document.location.href='deletePro.jsp?num=<%=article.getNum() %>&pageNum=<%=pageNum %>'">
			&nbsp;&nbsp;&nbsp;&nbsp;
				<%}%>
			<%}%>
			<input type="button" value="글목록"
			onclick="document.location.href='noticeList.jsp?pageNum=<%=pageNum %>'">
		</td>
	</tr>
</table>
<%
	}catch(Exception e){
		
	}
%>


</form>

</body>
</html>











