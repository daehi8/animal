<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../_comm/_head.jsp"></jsp:include>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="/animal/css/style.css" rel="stylesheet">
</head>
<body>
<center><b>글삭제</b></center>
<form method="POST" name="delForm" action ="deletePro.jsp?pageNum=<%=pageNum%>"
	onsubmit = "return deleteSave()">
	<input type="hidden" name="num" value="<%=num%>">
	
	<table border="1" align="center" cellspacint="0" cellpadding="0" width="360">
		<tr height="30">
			<td align = center >
			<b> 삭제하시겠습니까?</b></td>
		</tr>
		
		<tr height="30">
			<td align = center >
			<input type="submit" value="삭제">
			<input type="button" value="글목록"
			onclick="document.location.href='requestList.jsp?pageNum=<%=pageNum%>'">  
			</td>
		<tr>
	</table>
</form>
</body>
</html>