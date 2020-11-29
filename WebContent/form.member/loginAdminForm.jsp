<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<%@ page import="member.MemberDAO" %>
<%@ page import="member.MemberDTO" %>

<html>
<head>

<!-- 어드민으로 로그인시 보이는 로그인 화면입니다. -->
<title>loginAdminForm</title>
	<link href="/animal/css/style.css" rel="stylesheet">
</head>
	<jsp:include page="../_comm/_head.jsp"></jsp:include>
<body>
	<% 
		// 한글 인코딩 처리 
    	request.setCharacterEncoding("UTF-8");
	
	%>
	
 	<jsp:useBean id="dto" class="member.MemberDTO" />
	<jsp:setProperty property="*" name="dto"/>
	
	<%
    	//세션값 가져오기, Object형으로 저장되기에 다운케스팅이 필요하다.
    	String id = (String) session.getAttribute("memId");
	    String db_flag = (String) session.getAttribute("db_flag");
		String mem_password = request.getParameter("mem_password");
		MemberDAO dao = MemberDAO.getInstance(); 
		dto = dao.adminViewProfile(id);
	%>
	
	<%
		//세션 mactched를 만들어서 접속중인 비밀번호와 동일시 자식창은 자동으로 꺼지고, 부모창에서 다음 페이지로 이동한다. 
		String matched = (String)session.getAttribute("matched");
			if(matched!=null){
				response.sendRedirect("/animal/form.member/modifyAdminInfoForm.jsp");
				session.removeAttribute("matched"); 
			return;
		}

	%>
	
	<script type="text/javascript">
		function logout(){
 		location.href="/animal/pro.member/logoutPro.jsp";
		}
	</script>
	
	<!-- Admin관리자만 들어갈 수 있는 버튼입니다. -->
	<script type="text/javascript">

 		function admin(){
 			if ("<%=db_flag %>" =="0") {
 	 			alert("관리자확인되었습니다.");
 	 			location.href="/animal/form.member/loginAdminForm.jsp";
 			}else {
 				alert("관리자만 확인할 수 있는 페이지입니다.");	
 	 			}return;	
 	 		}	
 	</script>

	<%
		//쿠키값 저장(자동로그인)
    	Cookie[] cookies = request.getCookies();
    		if(cookies !=null){
       			for(Cookie tempCookie : cookies){
           	if(tempCookie.getName().equals("memId")){
           		//쿠키값으로 로그인
           		session.setAttribute("memId", tempCookie.getValue());
           		}
        	}
    	}
	%>
	
	<div class=""> 
		<div class="">
			<!-- <form name="profile" method="post" action="/animal/pro.member/modifyInfoPro.jsp"> -->
			<font class="">&nbsp;<%=session.getAttribute("memId") %>님 프로필&nbsp; </font>
		</div>
		<div class="">
		</div>
		<div class="">
			<table class="">
    			<tr>
	      			<td class="" rowspan="3"><img style ="width:100px; height:100px"></td>
	      			<td>이메일</td>
	      			<td><%=dto.getMem_email() %></td>
        		</tr>
 
        		<tr>
        			<td>소개</td>
        			<td><%=dto.getMem_intro() %></td>
        		</tr>
        	</table>
		</div>
		<div class="">
			<div class="">
				<div class="">
					<input class="" type="button" value="나의 메일" onclick="location.href = '/animal/form.boardc/myMailForm.jsp'">
     				<input class="" type="button" value="나의 스토리" onclick="location.href = '/animal/form.boardc/myStoryForm.jsp'">
	       			<input class="" type="button" value="로그아웃" onclick="logout()" >  
				</div>
			</div>
				<div class="">
					<input class="" type="button" id="mypage" value="정보 변경" 
						onclick="window.open('/animal/form.popup/checkModify.jsp','window_name','width=600,height=500,location=no,status=no,scrollbars=yes')">
			   <!--<div class="">
     				<input class="" type="button" value="통계확인" 
     					onclick="location.href = '/animal/form.member/modifyMemberProfileForm.jsp'">
     			</div>
     			<div class="">
     				<input class="" type="button" value="관심동물" 
     					onclick="location.href = '/animal/form.boardc/myFavoliteAnimalForm.jsp'">
     			</div>												
     			<div class="">
     				<input class="" type="button" value="관심스토리" 
     					onclick="location.href = '/animal/form.boardc/myFavoliteStoryForm.jsp'">
     			</div>
     			<div class="">
     				<input class="" type="button" value="작성글" 
     					onclick="location.href = '/animal/form.boardc/myWriteListForm.jsp'">
     			</div>												
     			<div class="">
     				<input class="" type="button" value="작성댓글" 
     					onclick="location.href = '/animal/form.boardc/myCommentListForm.jsp'">
     			</div>
     			<div class="">
     				<input class="" type="button" value="문의사항" 
     					onclick="location.href = '/animal/form.boardc/MyQ&AForm.jsp'">
     			-->
     			<div class="">
     			 	<input type="button" class="" id="admin" value="어드민리스트" name="admin" onclick="admin()">										
     			</div>
     			</div> 										
			</div>
		</div>
	</div>  														
</body>
</html>
</body>
</html>