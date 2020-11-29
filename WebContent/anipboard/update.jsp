    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ani.Pboard.PboardDTO"%>
<%@page import="ani.Pboard.AnimalDAO"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<jsp:include page="../_comm/_head.jsp"></jsp:include>
<br>
<br>
<br>
<br>

<%
	String no = request.getParameter("no");
	AnimalDAO dao = AnimalDAO.getInstance();
	PboardDTO dto = dao.info(no);
	
%>

<form action="updatePro.jsp" method="post" enctype="multipart/form-data">
	
	고양이이름: <input type="text" name="name" value="<%=dto.getName()%>"><br><br>
	사진: <input type="file" name="img"><br><br>
		<input type="hidden" name="sysImg" value="<%= dto.getImg()%>">
		<input type="hidden" name="no" value="<%= dto.getNo()%>">
		<img alt="" src="/animal/save/<%=dto.getImg()%>"> 
	<select name="city" value="<%=dto.getCity()%>">
		<option value="서울" selected>서울</option>
		<option value="경기" >경기</option>
		<option value="경상" >경상</option>
		<option value="전라" >전라</option>
		<option value="충청" >충청</option>
		
	</select><br><br>
	<select name="kind" value="<%=dto.getKind()%>">
		<option value="고양이" selected>고양이</option>
		<option value="강아지" >강아지</option>
		
	</select><br><br>
	내용<br>
	<textarea rows="6" cols="70" name="menual"><%=dto.getMenual()%></textarea>
	<br>
	<input type="submit" value="등록">
	<input type="reset" value="다시쓰기">
	
</form>
	
	

	
	
	
	
	

<jsp:include page="../_comm/_tail.jsp"></jsp:include>