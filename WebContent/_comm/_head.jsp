<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
	
    head{
    display:block;
    margin:0;
    padding: 0;
	}
</style>
<head>
	<link href="/animal/css/header.css" rel="stylesheet">
	<div class="logo" >
		<center><a href="/animal/main/main.jsp" /><img src="/animal/save/Project Animal3.png"/></center>
	</div>
</head>
<%
String sessionId = (String)session.getAttribute("memId");
%>
<body>
	<nav>
		<%if (sessionId != null){%>
			<%if (sessionId.equals("admin")){%>
				<a class="links" href="/animal/admin/mainAdmin.jsp">관리자</a>
			<%}%>
		<%}%>
		<a class="links" href="/animal/main/cityMap.jsp">지점위치</a>
		<a class="links" href="/animal/anipboard/list.jsp">분양동물</a>
		<a class="links" href="/animal/review/reviewList.jsp">분양후기</a>
		<div class="dropdown">
			<button class="megaButton">고객센터 ></button>
			<div class="megaContent">
				<div class="megaRow">
					<div class="megaColumn">
						<a class="links" href="/animal/notice/noticeList.jsp">공지사항</a>
						<a class="links" href="/animal/request/requestList.jsp">1:1문의</a>
					</div>
				</div>
			</div>
		</div>
		<%if(sessionId != null){ %>
		<div class="dropdown">
			<button class="megaButton">마이페이지 ></button>
			<div class="megaContent">
				<div class="megaRow">
					<div class="megaColumn">
						<a class="links" href="/animal/product/myPocketList.jsp">내가찜한동물</a>
						<a class="links" href="/animal/product/myBuyList.jsp">분양신청정보</a>
						<a class="links" href="/animal/main/modifyMovePro.jsp">마이페이지</a>
					</div>
				</div>
			</div>
		</div>
		<%}%>
		<%if(sessionId == null){ %>
			<a style="float:right" class="links" href="/animal/form.member/registerCategoryForm.jsp">회원가입</a>
			<a style="float:right" class="links" href="/animal/form.member/loginMainForm.jsp">로그인</a>
		<%}else{%>
			<a style="float:right" class="links" href="/animal/pro.member/logoutPro.jsp">로그아웃</a>
		<%}%>
	</nav>
</body>
</html>