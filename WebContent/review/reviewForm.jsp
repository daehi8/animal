<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../_comm/_head.jsp"></jsp:include>

<head>
<link href="/animal/css/style.css" rel="stylesheet">
</head>

<title>main</title>
	<!-- 여기부터 reviewForm                            -->
	
	<div class="container">
		<div class="row">
		<%
  int num=0;
  try{  
    if(request.getParameter("num")!=null){
	num=Integer.parseInt(request.getParameter("num"));
	}
%>
			<form method="post" name="reviewForm"action="reviewPro.jsp" enctype= "multipart/form-data" onsubmit="return writeSave()">
				<input type="hidden" name="num" value="<%=num%>">
				
				<table class="table talble-striped" style="text-align: center; border:1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="bgcolor:#eeeeee; text-align: center;">게시글 작성</th>
							
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="제목" name="subject" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="content" maxlength="2048" style="height:350px;"></textarea></td>
							
						</tr>
						<tr>
							<td><input type="file" class="form-control" placeholder="사진첨부" name="img" maxlength="50"></td>
						</tr>
						
					</tbody>
					
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
				<input type="button" value="글목록" 
       			onclick="document.location.href='reviewList.jsp'">
<%
  }catch(Exception e){}
%>
			</form>
			
		</div>
	</div>
		







<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>