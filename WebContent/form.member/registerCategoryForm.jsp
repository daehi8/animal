<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 기업회원과 일반회원의 회원가입을 분리하는 카테고리입니다 -->
<title>Register_Category_Form</title>
	<link href="/animal/css/style.css" rel="stylesheet">
</head>
	<jsp:include page="../_comm/_head.jsp"></jsp:include>
<body>
<% 
	//한글 인코딩
	request.setCharacterEncoding("UTF-8");

%>
	<!-- total box -->
	<div class="content">
		<!-- category_box -->
		<div class="category_box">
			<div class="category_title">
     			<font class="font1">&nbsp;&nbsp;회원가입</font><br><br>
     		</div>
     		<!-- register 단계 -->
			<div class="category_stage">
				<span><font color="red">&nbsp;&nbsp;01가입&nbsp;></font></span>
      			<span><font color="grey">&nbsp;&nbsp;02약관동의&nbsp;></font></span>
      			<span><font color="grey">&nbsp;&nbsp;03정보입력&nbsp;></font></span>
       			<span><font color="grey">&nbsp;&nbsp;04가입완료&nbsp;&nbsp;</font></span>
       		</div>		    
       		<div class="category_link">
       			<span>&nbsp;&nbsp;<a href="/animal/form.member/loginMainForm.jsp">메인페이지로</a></span>
       			<span>&nbsp;&nbsp;<a href="">관리자화면</a></span>
       		</div>
      		<!-- 일반회원과 기업회원을 나눠서 경로설정 -->
       		<div class="category_content">
       			<!--일반회원 가입경로-->
       			<div class="category_member" style="">
     				<table class="" >
						<tr>
							<td class="">
								<img style ="width:200px; height:200px" src="/animal/image/sample.jpg" alt="">
							</td>
							<td class="">
								<img style ="width:200px; height:200px" src="/animal/image/sample.jpg" alt="">
							</td>
						</tr>
						<tr>
							<td class=""><font class="">일반회원</font><br><font>14세 이상 개인</font></td>
							<td class=""><font class="">기업회원</font><br><font>사업자 및 기타단체</font></td>
						</tr>
						<tr>
							<td class="" colspan="2">
								<hr class="">
								
								<span><button class="" id="member_register" name="member_register" 
										onclick="location.href = '/animal/form.member/registerTermsMemberForm.jsp'">일반회원가입</button></span> 
								<span><button class="" id="member_register" name="member_register" 
										onclick="location.href = '/animal/form.member/registerTermsEnterpriseForm.jsp'">기업회원가입</button></span> 
							</td>
						</tr>
					</table>	  		
					</div>
				</div>
			</div>
		</div>
	</body>
</html>