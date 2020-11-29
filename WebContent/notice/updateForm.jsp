<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "animal.board.Notice_DBBean" %>
<%@ page import = "animal.board.Notice_DataBean" %>
<jsp:include page="../_comm/_head.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice 수정 페이지</title>
<h1>notice 수정 페이지</h1>
<link href="/animal/css/style.css" rel="stylesheet">
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	int readcount = Integer.parseInt(request.getParameter("readcount"));
	
	Notice_DBBean dbPro = Notice_DBBean.getInstance();
	Notice_DataBean article = dbPro.updateGetArticle(num);

%>
<body>
	<form method="post" name="updateForm" enctype="multipart/form-data" action="updatePro.jsp">
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="readcount" value="<%=readcount%>">
	<table width="900" align=center>
		<tr>
			<td height="40" width="200">*		공지 제목</td>
			<td>
			<input type="text" name="title" value=<%=article.getTitle() %>>
			</td>
		</tr>
		<tr>
			<td height="40" width="200">*		내	용</td>
			<td>
				<textarea name="contents" value="<%=article.getContents() %>" cols="72" rows="20" style="padding-left:10px"></textarea>
			</td>
		</tr>
		<tr>
			<td height="40" width="200">*		이미지</td>
			<td>
				<input type="file" name=img value=<%=article.getImg() %> /><br />
			</td>
		</tr>
		
	</table>
	<table size="30" align=center>
		<tr>
			<td size="30">
			<input type="submit" name="confirm" value="수	정" />
			<input type="reset" name="reset" value="다시작성" />
			<input type = "button" value = "목록보기"
			onclick="window.location='noticeList.jsp?pageNum=<%=pageNum %>'" />
			</td>
		</tr>
	</table>
	</form>
</body>
</html>