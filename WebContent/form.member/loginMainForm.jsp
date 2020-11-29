<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>

<html>
<!-- 메인 로그인 폼에 위치하고 있는 로그인 화면 입니다 -->
<head>
<title>loginMainForm</title>

	<link href="/animal/css/style.css" rel="stylesheet">
	<script type="text/script" src="http://code.jquery.com/jquery-3.1.1.js"></script>
</head>
	<jsp:include page="../_comm/_head.jsp"></jsp:include>
<body>

	<div class="side_left">
	<!-- total_box -->
		<div class="login_box">
		<!-- login_box -->
			<div class="login_title">
			<!-- login_title -->
			<font class="">&nbsp;&nbsp; 로그인</font><br>
			</div>
				<!-- login_input -->
				<div class="">
					<!-- forㅡ : loginPro로 id, password를 submit -->
					<form name ="login" method="post" action="/animal/pro.member/loginPro.jsp"  
		  					encType="utf-8" onsubmit="return check_login()">
						<!-- login_infut -->
						<table class="">
    						<tr>
	     						<td class="">&nbsp;&nbsp;아이디&nbsp;&nbsp;</td>
	      						<td class="">
	      							<input type="text" id ="mem_id" name="mem_id" size="18" maxlength="30"></td>
	      						<td>	
	      						</td>
        					</tr>
    						<tr>
	  							<td class="">&nbsp;&nbsp;비밀번호&nbsp;&nbsp;</td>
	   							<td class="">
	   								<input type="password" id="mem_password" name="mem_password" size="18" size="1" maxlength="30">
	   							</td>
	   							<td>
	   								<input class="btn3" type="submit" value="로그인">
	   							</td>
    						</tr>
    						<tr>
    							<td class="" colspan="3">
    								<input type="checkbox" id="save_id" name="save_id">아이디 저장
									<input type="checkbox" id="session_login" name="session_login">자동 로그인
								</td>
     						</tr>
     				</table>
     			</form>
     		</div>
     	<!-- 버튼 -->
     	<div class="">
     		<hr width="" align="center" color="silver">
     			<div class="">
     				<span><button type="button" id="find_id" name="find_id" 
	       					onclick="window.open('/animal/form.popup/findId.jsp','window_name',
	       							'width=500,height=300,location=no,status=no,scrollbars=no');">아이디 찾기</button></span>
	       			<span><button type="button" id="find_password" name="find_password" 
	       					onclick="window.open('/animal/form.popup/findPassword.jsp','window_name',
	       							'width=500,height=300,location=no,status=no,scrollbars=no');">비밀번호 찾기</button></span>
	     			<span><button type="button" id="register_category" name="register_category"
	      					onclick="location.href='/animal/form.member/registerCategoryForm.jsp'">회원가입</button></span>
     			</div>
     		</div>
     	<!--광고영역 -->
     	<div class="banner_box">
     		<div class="banner"><br>
     			<!-- 광고배너입니다 -->
     			<img width="400px" src="/animal/image/advertisingBanner.jpg"/>
     		</div>
     	</div>
   	</div>
</div>
     		
	<% 
   		// 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시(2차 확인 메시지)
   		// LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
  		 String msg=request.getParameter("msg");        
   			if(msg!=null && msg.equals("0")) //비밀번호가 틀릴 때
   			{
     			 out.println("<br>");
      			 out.println("<script>alert('비밀번호를 확인해주세요');</script>");
   			}
			else if(msg!=null && msg.equals("-1")) //아이디가 틀릴 때 
  			{    
   				out.println("<br>");
   				out.println("<script>alert('아이디를 확인해주세요');</script>");
   				//out.println("<font color='red' size='5'>아이디를 확인해 주세요.</font>");
			}
   			
	%>
	<!-- js.cookie 사용하기 -->
	<script>
		$("#mem_id").val(Cookies.get('id_key'));      
		if($("#mem_id").val() != ""){
    		$("#save_id").attr("checked", true);
		}
		//아이디 저장 버튼이 체크되어 있다면 
		$("#save_id").change(function(){
			if($("#save_id").is(":checked")){
    			Cookies.set('id_key', $("#save_id").val(), { expires: 1 });
			}else{
      			Cookies.remove('id_key');
			}
		});
		//1일 아이디가 저장됨 
		$("#mem_id").keyup(function(){
			if($("#mem_id").is(":checked")){
    		Cookies.set('id_key', $("#mem_id").val(), { expires: 1 });
		}return;
	});
	</script>
	<script>
	<%
	//쿠키가져오기
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
	    for(Cookie tempCookie : cookies){
	        if(tempCookie.getName().equals("memId")){
	            //실행흐름이 서버에 있을때 서버코드로써 강제이동한다.
	            //특정 page로 이동하라는 정보만 준다.
	            response.sendRedirect("sessionMain.jsp");
	        }
	    }
	}
	%>

	</script>	
	
<script type="text/script" src="http://code.jquery.com/jquery-3.1.1.js"></script>
	     
</body>
</html>