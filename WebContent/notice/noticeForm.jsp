<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeForm 페이지</title>
<jsp:include page="../_comm/_head.jsp"></jsp:include>
<h1>noticeForm 페이지</h1>
<link href="/animal/css/style.css" rel="stylesheet">
</head>
<body>
	<%
		String memId = (String)session.getAttribute("memId");
	 
	  int num=0;
	  try{  
	    if(request.getParameter("num")!=null){
		num=Integer.parseInt(request.getParameter("num"));
		
		}
	%>

	<form method="post" name="noticeForm" enctype="multipart/form-data" action="noticePro.jsp">
	<input type="hidden" name="num" value="<%=num%>">
	
	
	<table width="900" align=center>
	
		<tr>
			<td height="40" width="200">*		공지 제목</td>
			<td>
			<input type="text" name="title">
			</td>
		</tr>
		<tr>
			<td height="40" width="200">*		내	용</td>
			<td>
				<textarea name="contents" cols="72" rows="20" style="padding-left:10px"></textarea>
			</td>
		</tr>
		<tr>
			<td height="40" width="200">*		이미지</td>
			<td>
				<input type="file" name="img" /><br />
			</td>
		</tr>
		
	</table>
	<table size="30" align=center>
		<tr>
			<td size="30">
			<input type="submit" name="confirm" value="게	시" />
			<input type="reset" name="reset" value="취	소" onclick="window.location='noticeList.jsp'" />
			</td>
		</tr>
	</table>
	<%
  	}catch(Exception e){}
	%>  
	</form>
</body>
</html>