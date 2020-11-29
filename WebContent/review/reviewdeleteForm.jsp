<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../_comm/_head.jsp"></jsp:include>

<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">

<link href="/animal/css/style.css" rel="stylesheet">
</head>
<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
%>


<b>글삭제</b>
<br>
<form method="POST" name="reviewdelForm"  action="reviewdeletePro.jsp?pageNum=<%=pageNum%>&num=<%=num%>" onsubmit="return deleteSave()"> 
 <table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
  <tr height="30">
     <td align=center>
       <b>삭제하시겠습니까?</b></td>

 <tr height="30">
    <td align=center>
      <input type="submit" value="글삭제">
      <input type="button" value="글목록" 
       onclick="document.location.href='reviewList.jsp?pageNum=<%=pageNum%>'">    
   </td>
 </tr>  
</table> 
</form>
