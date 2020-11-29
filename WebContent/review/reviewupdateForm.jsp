<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ch08.board.BoardDAO" %>
<%@page import="ch08.board.BoardDTO" %>
<jsp:include page="../_comm/_head.jsp"></jsp:include>
<head>
<link href="/animal/css/style.css" rel="stylesheet">
</head>

<%
String sessionId = (String)session.getAttribute("memId");
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  try{
	  BoardDAO dbPro = BoardDAO.getInstance();
	  BoardDTO article =  dbPro.updateGetArticle(num);

%>

 
<form method="post" name="reviewupdateForm"action="reviewupdatePro.jsp?pageNum=<%=pageNum%>" enctype= "multipart/form-data" onsubmit="return writeSave()">
				<input type="hidden" name="writer" value="<%= sessionId%>">
				<table class="table talble-striped" style="text-align: center; border:1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="bgcolor:#eeeeee; text-align: center;">게시글 수정</th>
							
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="hidden" name="num" value="<%=article.getNum()%>"></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control" placeholder="제목" name="subject" maxlength="50" value="<%=article.getSubject()%>"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="content" maxlength="2048" style="height:350px;" ><%=article.getContent()%></textarea></td>
							
						</tr>
						<tr>
							<td><img alt="" src="/animal/save/<%=article.getImg()%>"></td>
						</tr>
						<tr>
							<td><input type="hidden" name="sysImg" value="<%= article.getImg()%>"></td>
							<td><input type="file" calss="form-control" palceholder="사진등록" name="chaImg" maxlength="50" value="<%=article.getImg()%>"></td>
						</tr>
						
					</tbody>
					
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="수정">
<%
  }catch(Exception e){}
%>      
      
