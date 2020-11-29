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
	request.setCharacterEncoding("UTF-8");
	String memId = (String)session.getAttribute("memId");

	int num=0,ref=1,re_step=0,re_level=0;
	try{  
		if(request.getParameter("num") !=null){
		num=Integer.parseInt(request.getParameter("num"));
		ref=Integer.parseInt(request.getParameter("ref"));
		re_step=Integer.parseInt(request.getParameter("re_step"));
		re_level=Integer.parseInt(request.getParameter("re_level"));
		}
		
	
%>
   
<body>
<center><b>댓글쓰기</b></center>
<br>
<form method="post" name="writeform" action="writePro.jsp" onsubmit="return writeSave()">
<input type="hidden" name="type" value="<%="답변"%>">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="ref" value="<%=ref%>">
<input type="hidden" name="re_step" value="<%=re_step%>">
<input type="hidden" name="re_level" value="<%=re_level%>">

<table width="900" cellspacing="0" cellpadding="0"align="center">
   <tr>
    <td height = "40" width="200" align="right" colspan="2"></td>
	<td size="70">  <a href="requestList.jsp"> 글목록</a> 
   </td>
   </tr>
   <tr>
			<td height="40" width="200">*		이름</td>
	 	<td  width="330">
	   	<%=memId %> 
	   	<input type="hidden" name="writer" value="<%=memId %>"></td> 
	    </tr>
    
  <tr>
    <td height="40" width="200">*		제목</td>
    <td  width="330">
    <%if(request.getParameter("num")==null){%>
       <input type="text" size="40" maxlength="50" name="title"  />
	<%}else{%>
	   <input type="text" size="40" maxlength="50" name="title"  />
	<%}%>
	</td>
  </tr>
   
  <tr>
			<td height="40" width="200">*		답변내용</td>
			<td>
				<textarea name="contents" cols="72" rows="10" style="padding-left:10px"></textarea>
			</td>
		</tr>
  
<tr>      
 <td colspan=2 align="center"> 
  <input type="submit" value="글쓰기" >  
  <input type="reset" value="다시작성">
  <input type="button" value="목록보기" OnClick="window.location='requestList.jsp'">
</td></tr></table>    
 <%
  }catch(Exception e){}
%>     
</form>      
</body>
</html>   