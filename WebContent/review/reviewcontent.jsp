<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch08.board.BoardDAO" %>
<%@ page import = "ch08.board.BoardDTO" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<jsp:include page="../_comm/_head.jsp"></jsp:include>

<head>
<link href="/animal/css/style.css" rel="stylesheet">
<title>main</title>
</head>

<%
   int num = Integer.parseInt(request.getParameter("num"));
   String pageNum = request.getParameter("pageNum");

   SimpleDateFormat sdf =
        new SimpleDateFormat("yyyy-MM-dd HH:mm");

   try{
	   BoardDAO dbPro = BoardDAO.getInstance();
	   BoardDTO article =  dbPro.getArticle(num);
  
	String sessionId = (String)session.getAttribute("memId");
%>
 
<b>글내용 보기</b>
<br>
<form>
<table width="500" border="1" cellspacing="0" cellpadding="0"   align="center">  
  <tr height="30">
    <td align="center" width="125" >글번호</td>
    <td align="center" width="125" align="center"
	     ><%=article.getNum()%></td>
    <td align="center" width="125"">조회수</td>
    <td align="center" width="125" align="center">
	     <%=article.getReadcount()%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125" ">작성자</td>
    <td align="center" width="125" align="center">
	     <%=article.getWriter()%></td>
    <td align="center" width="125"  >작성일</td>
    <td align="center" width="125" align="center">
	     <%= sdf.format(article.getReg_date())%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125">글제목</td>
    <td align="center" width="375" align="center" colspan="3">
	     <%=article.getSubject()%></td>
  </tr>
  <tr>
    <td align="center" width="125" >글내용</td>
    <td align="left" width="375" colspan="3"><pre><%=article.getContent()%></pre></td>
  </tr>
  <tr>
    <td align="center" width="125" >사진</td>
    <td align="left" width="375" colspan="3"><img src= "/animal/save/<%=article.getImg() %>"/></td>
  </tr>
  <tr height="30">      
    <td colspan="4"  align="right" >
<% if(sessionId !=null && sessionId.equals(article.getWriter())){ %>
	  <input type="button" value="글수정" 
       onclick="document.location.href='reviewupdateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button" value="글삭제" 
       onclick="document.location.href='reviewdeleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	  <%} %>
<%if(sessionId !=null && sessionId.equals("admin")){ %>
			<input type="button" value="관리자 글삭제"
       onclick="document.location.href='reviewdeletePro.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	   <%} %>

       <input type="button" value="글목록" 
       onclick="document.location.href='reviewList.jsp?pageNum=<%=pageNum%>'">
    </td>
  </tr>
</table>    
<%
 }catch(Exception e){} 
 %>
</form>      
