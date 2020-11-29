<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "animal.board.Req_boardDBBean" %>
<%@ page import = "animal.board.Request_bDataBean" %>
<jsp:include page="../_comm/_head.jsp"></jsp:include>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="/animal/css/style.css" rel="stylesheet">
</head>

<%
String memId = (String)session.getAttribute("memId");
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	Req_boardDBBean dbPro = Req_boardDBBean.getInstance();
	Request_bDataBean article =new Request_bDataBean();
	article = dbPro.updateGetArticle(num);

%>

<body>
<center><b>글수정</b></center>
	<form method="post" name="requestForm" action="updatePro.jsp">
	<input type="hidden" name="num" value="<%=num%>">
	<table width="900" align=center>
	
		<tr>
			<td height="40" width="200">*		문의유형</td>
			<td>
			<select name="type" size="1" class="select">
				<option value="">선택하세요</option>
				<option value="자원봉사">자원봉사 신청</option>
				<option value="입양">입양하고 싶어요</option>
				<option value="기타">그외 궁금해요</option>
			</select>
			<input type="text" name="title" size="70" value="<%=article.getTitle()%>">
			</td>
		<tr>
			<td height="40" width="200">*		작성자</td>			
			<td align = "left" width="330">
				<input type="text" size = "10" maxlength="10" name="writer" value="<%=article.getWriter() %>">
		</tr>	
		<tr>
			<td height="40" width="200">*		문의내용</td>
			<td>
				 <textarea class="form-control" name="contents"cols="72" rows="10" style="padding-left:10px"><%=article.getContents() %></textarea>
			</td>
		</tr>
		<tr>
			<td height="40" width="200">*		이메일 주소</td>
			<td>
				<input type="text" name="email" value="<%=article.getEmail()%>">@
				<input type="text" name="email_dns" value="<%=article.getEmail_dns()%>">
					<select>
					<option value="">직접입력</option>
					<option value="daum.net">daum.net</option>
					<option value="gmail.com">gmail.com</option>
					<option value="naver.com">naver.com</option>
					</select>
			</td>
		</tr>
		<tr>
			<td height="40" width="200">*		핸드폰 번호</td>
			<td><input type="text" name="phone1" value="<%=article.getPhone1()%>"> -
				<input type="text" name="phone2" value="<%=article.getPhone2()%>"> -
				<input type="text" name="phone3" value="<%=article.getPhone3()%>">
			</td>
		</tr>
	</table>
	<table size="30" align=center>
		<tr>
			<td size="30">
			<input type="submit" value="수	정" />
			<input type= "reset" value="다시작성" />
			<input type = "button" value = "목록보기" 
			onclick = "document.location.href='RequestList.jsp?pageNum=<%=pageNum %>'" />
			</td>
		</tr>
	</table>

</body>
</html>



