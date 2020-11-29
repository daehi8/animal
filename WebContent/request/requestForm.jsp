<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../_comm/_head.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

<style>
   table {
   width : 1000;
   

   border-collapse: collapse;
   margin : auto;
}
input[type=button], input[type=submit], input[type=reset]{
   cursor : pointer;
   text-decoration : none;
   text-align : center;
   border: 2px solid #e7e7e7;
   padding : 5px 10px;
   transition-duration : 0.4s;
   background-color : white;
   color : black;
   display : inlin-block;   
}
input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover{
   background-color: #e7e7e7;
}
A:link {text-decoration:none;color:#696969}
A:hover{text-decoration:yes;color:#66CCFF}
A:visited {text-decoration:none;color:#330066;}

</style>
</head>

<body>
	<%
		String memId = (String)session.getAttribute("memId");
	%>
	<form method="post" name="requestForm" action="requestPro.jsp">
		<input type="hidden" name="writer" value="<%=memId%>">
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
			<input type="text" name="title" size="70" value="제목을 입력하세요">
			</td>
			
				
			
		</tr>
		<tr>
			<td height="40" width="200">*		문의내용</td>
			<td>
				<textarea name="contents" cols="72" rows="10" style="padding-left:10px"></textarea>
			</td>
		</tr>
		<tr>
			<td height="40" width="200">*		이메일 주소</td>
			<td>
				<input type="text" name="email1">@
				<input type="text" name="email_dns">
				<select name="email_dns" size="1" class="select">
					<option value="">직접입력</option>
					<option value="daum.net">daum.net</option>
					<option value="gmail.com">gmail.com</option>
					<option value="naver.com">naver.com</option>
				</select>
			</td>
		</tr>
		<tr>
			<td height="40" width="200">*		핸드폰 번호</td>
			<td><input type="text" name="phone1"> -
				<input type="text" name="phone2"> -
				<input type="text" name="phone3">
			</td>
		</tr>
		
	</table>
	<table size="30" align=center>
		<tr>
			<td size="30">
			<input type="submit" name="confirm" value="등	록" />
			<input type="reset" name="reset" value="취	소" onclick="window.location='requestList.jsp'" />
			</td>
		</tr>
	</table>

</body>
<jsp:include page="/_comm/_tail.jsp"></jsp:include>
</html>
