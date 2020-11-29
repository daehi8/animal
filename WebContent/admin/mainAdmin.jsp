<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ani.Pboard.PetDAO" %>

<head>
	<style type="text/css">
		body{
			text-align : center;
		}
		table {
			width : 1000;
			border: 1px solid black;
			border-collapse: collapse;
			text-align : center;
			margin : auto;
		}
		td{
			border-bottom : 1px solid black;
			padding : 10px;
		}
		.listsubject_menu{
			width : 400px;
		}
		td.listsubject{
			text-align : left;
		}
		.hd{
			border : 1px solid black;
			background: #eee;	
		}
		td.writeId{
			text-align : left;
		}
		input[type=text],input[type=password]{
			float:left;
		}
		textarea{
			float:left;
			width : 500px;
			height : 400px;
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
		.listbt{
			float:right;
		}
		b{
			text-align : center:
		}
		A:link {text-decoration:none;color:#696969}
		A:hover{text-decoration:yes;color:#66CCFF}				
	</style>
</head>
<% 
PetDAO dao = PetDAO.getInstance();
int buyComCount = dao.getComCount();
int buyDelCount = dao.getBuyDelCount();
int buyCount = dao.getBuyCount();
%>
<jsp:include page="/_comm/_headAdmin.jsp"></jsp:include>    
<div class="row">
  	<div class="column">
  		<h2>분양정보</h2>
  		<table class = "mainAdmin">
  			<tr>
  				<td>신청 대기</td>
  				<td>신청 취소</td>
  				<td>신청 완료</td>
  			</tr>
  			<tr>
  				<td><a href = "/animal/admin/buyAllList.jsp"><%=buyCount %></a></td>
  				<td><a href = "/animal/admin/buyDelList.jsp"><%=buyDelCount %></a></td>
  				<td><a href = "/animal/admin/buyComList.jsp"><%=buyComCount %></a></td>
  			</tr>
  		</table>
  	</div>
  	<div class="column">
  		<h2>방문자</h2>
  		<table class = "mainAdmin">
  			<tr>
  				<td>전체 방문자</td>
  				<td>오늘 방문자</td>
  			</tr>
  			<tr>
  				<td><%=session.getAttribute("allCount") %></td>
  				<td><%=session.getAttribute("dayCount") %></td>
  			</tr>
  		</table>
  	</div>
</div>
<div class="rowfull">
  	<div class="columnfull">
  		<h2>답변대기중인 1:1문의</h2>
  		<table class = "mainAdmin">
  		<jsp:include page="/admin/requestNew.jsp"></jsp:include>
  		</table>
  	</div>
</div>
<div class="rowfull">
  	<div class="columnfull">
  		<h2>전체 분양동물</h2>
  		<table class = "mainAdmin">
  		<jsp:include page="/admin/adminAList.jsp"></jsp:include>
  		</table>
  	</div>
</div>