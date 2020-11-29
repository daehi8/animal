<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../_comm/_head.jsp"></jsp:include>
<br>
<br>
<br>
<br>

<form action="writePro.jsp" method="post" enctype="multipart/form-data">
	
	이름: <input type="text" name="name"><br><br>
	사진: <input type="file" name="img"><br><br>
	<select name="city">
		<option value="서울" selected>서울</option>
		<option value="경기" >경기</option>
		<option value="경상" >경상</option>
		<option value="전라" >전라</option>
		<option value="충청" >충청</option>
		
	</select><br><br>
	<select name="kind">
		<option value="고양이" selected>고양이</option>
		<option value="강아지" >강아지</option>
		
	</select><br><br>
	내용<br>
	<textarea rows="6" cols="70" name="menual"></textarea>
	<br>
	<input type="submit" value="등록">
	<input type="reset" value="다시쓰기">
	
</form>
	
	

	
	
	
	
	

<jsp:include page="../_comm/_tail.jsp"></jsp:include>