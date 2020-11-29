<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "animal.board.Request_bDataBean" %>
<%@ page import = "animal.board.Req_boardDBBean" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<jsp:include page="../_comm/_head.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="/animal/css/style.css" rel="stylesheet">
</head>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");

	SimpleDateFormat sdf =
			new SimpleDateFormat("yyy-MM-dd HH:mm");
	
	try{
		Req_boardDBBean dbPro = Req_boardDBBean.getInstance();
		Request_bDataBean article = dbPro.getArticle(num);
		
	
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
		<td align = "center" width="125" align="center"><%=article.getWriter() %></td>
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
			if(memId != null)
			{
				if (memId.equals(article.getWriter()))
				{ 
		%>	
			<input type = "button" value = "글수정"
			onclick = "document.location.href='updateForm.jsp?num=<%=article.getNum() %>&pageNum=<%=pageNum%>'">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type = "button" value = "글 삭제"
			onclick = "document.location.href='deleteForm.jsp?num=<%=article.getNum() %>&pageNum=<%=pageNum %>'">
		<%		}
			}
		%>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<% 
			if("admin".equals(memId)){
			%>
			<input type = "button" value = "관리자 글삭제"
			onclick = "document.location.href='deleteAdmin.jsp?num=<%=article.getNum() %>&pageNum=<%=pageNum%>'">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type = "button" value = "답글쓰기"
			onclick = "document.location.href='writeForm.jsp?num=<%=num %>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
			<%System.out.println("type="+article.getType());%>
			&nbsp;&nbsp;&nbsp;&nbsp;
			 <%}
			%> 
			<input type="button" value="글목록"
			onclick="document.location.href='requestList.jsp?pageNum=<%=pageNum %>'">
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











