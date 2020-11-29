<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	
<meta charset="UTF-8">
<title>Register_Agree_Member_Form</title>
<link href="/animal/css/style.css" rel="stylesheet">

<script type="text/javascript" src="/cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
	
	<script type="text/javascript">
    	function CheckForm(){
	        //체크박스 체크여부 확인
	        var chk1=document.register.terms_use.checked;
	        var chk2=document.register.terms_privacy.checked;
	        
	        if(!chk1){
	            alert('(필수)이용약관에 동의해 주세요');
	            return false;
	        } 
	        if(!chk2) {
	            alert('(필수)개인정보 수집 및 이용에 동의해 주세요');
	            return false;
	        }
		}
	</script>
	
	<script type="text/javascript">
	
	$(document).ready(function(){
	    //최상단 체크박스 클릭
	    $("#check_all").click(function(){
	        //클릭되었으면
	        if($("#check_all").prop("checked")){//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=terms_use]").prop("checked",true);
	            $("input[name=terms_privacy]").prop("checked",true);
	            $("input[name=terms_sns]").prop("checked",true);
	            $("input[name=terms_email]").prop("checked",true);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=terms_use]").prop("checked",false);
	            $("input[name=terms_privacy]").prop("checked",false);
	            $("input[name=terms_sns]").prop("checked",false);
	            $("input[name=terms_email]").prop("checked",false);
	        }
	        
	    })
	});
	</script>


<Style>
	.table1{width:500px;height:600px;border:1px solid silver;background:white;margin:auto;}
	.table2{width:100%;height:90%;border:1px solid silver;background:white;margin:auto;}
	.btn1{border:1px solid silver;border-top-right-radius:5px;border-bottom-right-radius:5px;
			border-top-left-radius:5px;border-bottom-left-radius:5px;font-size:15px;font-weight:bold;
			color:black;text-align:center;background-color:white;width:80pt;height:30pt;margin:auto;}
	.btn2{border:1px solid silver;border-top-right-radius:5px;border-bottom-right-radius:5px;
			border-top-left-radius:5px;border-bottom-left-radius:5px;font-size:12px;font-weight:bold;
			color:black;text-align:center;background-color:white;width:60pt;height:20pt;margin:auto;}
	.font1{color:black;font-size:30px;text-align:center;font-weight:bold;}
	.font2{color:black;font-size:10px;text-align:center;font-weight:nomal;}
	.font3{color:silver;font-size:10px;text-align:center;font-weight:nomal;}
 	.textarea1{width:90%;height:80%;rows:10;cols:80;resize:none;readonly:readonly disabled}
 </Style>
</head>
<jsp:include page="../_comm/_head.jsp"></jsp:include>
<body>
	<div class="">
		<div class="">
			<font class="font1">&nbsp;&nbsp;회원가입</font>
		</div><br>
		<div class="">
			<font color="grey">&nbsp;&nbsp;01가입&nbsp;></font>
      		<font color="red">&nbsp;&nbsp;02약관동의&nbsp;></font>
       		<font color="grey">&nbsp;&nbsp;03정보입력&nbsp;></font>
       		<font color="grey">&nbsp;&nbsp;04가입완료&nbsp;&nbsp;</font>
		</div>
		<div>
			<font class="">Project_Animal의 필수약관을 모두 동의하셔야 회원가입이 가능합니다.</font>
		</div>
		</div>
		<div>
		<form name="register" method="post" action="/animal/form.member/registerMemberForm.jsp" onSubmit="return CheckForm()">

			<table class="" >
				<tr>
					<td class="" colspan="2" >
						<textarea class="textarea1" readonly="readonly" disabled>
							내용
   						</textarea><br>
   					</td>
   				<tr>
   					<td colspan="1" width="70%" height="5%" align="left">
   						<input type="checkbox" class="normal" name="terms_use" value="Y" />동의 : (필수) 이용약관
   					</td>
   					<td>
   						<input type="button" value="전체보기" onclick="window.open('/animal/form.popup/termsMember.jsp','window_name','width=600,height=600,location=no,status=no,scrollbars=yes');" />
					</td>
				</tr>
				<tr>
					<td class="" colspan="2" >
   			   			<textarea class="textarea1" readonly="readonly" disabled>
   			   				내용
   			   			</textarea><br>
   			   		</td>
   			   	</tr>
   			   	<tr>
   			   		<td>
   						<input  class="" type="checkbox" name="terms_privacy" value="Y"/>동의 : (필수) 개인정보 수집 및 이용
   					</td>
   					<td>
   						<input type="button" value="전체보기" onclick="window.open('/animal/form.popup/termsMember.jsp','window_name','width=600,height=600,location=no,status=no,scrollbars=yes');" />
					</td>
				</tr>
				<tr>
					<td>
   						<input class="" type="checkbox"  name="terms_sns" value="Y"/>동의 : (필수) SNS 수신
   					</td>
   					<td>
   						<input type="button" value="전체보기" onclick="window.open('/animal/form.popup/termsMember.jsp','window_name','width=600,height=600,location=no,status=no,scrollbars=yes');" />
					</td>
				</tr>
				<tr>
					<td>
   						<input class="" type="checkbox" name="terms_email" value="Y"/>동의 : (필수) 이메일 수신
   					</td>
   					<td>
   						<input type="button" value="전체보기" onclick="window.open('/animal/form.popup/termsMember.jsp','window_name','width=600,height=600,location=no,status=no,scrollbars=yes');" />
					</td>
				</tr>
				<tr>
					<td class="" colspan="2">
						<hr class="">
							<input type="checkbox" id="check_all" name="check_all">전체동의
							<br><br>
							<input type="button" class="" value="홈으로" onClick="location.href='/animal/form.member/loginMainForm.jsp'">
    						<input class="" name="next_stage" name="next_stage" type="submit" value="다음단계" onSubmit="return CheckForm()"/>
					</td>
				</tr>	
			</table>
		</form>
	</div>
</body>
</html>

