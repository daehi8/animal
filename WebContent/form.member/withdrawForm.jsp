<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<!-- 탈퇴화면입니다. -->
	<title>Withdraw</title>
<script type="text/javascript" src="Project_Ani/js/checkemailaddy.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<style>
</style>
</head>
<jsp:include page="../_comm/_head.jsp"></jsp:include>
<body>
	<div class="container">
		<div class="">
			<div class="">
				<div class="">
					<font class="">회원탈퇴 안내</font><br><br>
				</div>
				<div>
					<font class="">01.회원탈퇴 안내</font>
				</div>
			</div>
			<div class="">
				<form name="withdraw" action="/animal/pro.member/withdrawPro.jsp" method="post" onsubmit="return confirm('정말 탈퇴 하시겠습니까? 되돌 릴 수 없습니다.')">
			<div><input type="checkbox" class="withdraw" name="terms_withdraw" onchange="termsCheck();" value="Y" />동의 : (필수) 회원탈퇴 안내	
			</div>
			<div class="">
				<textarea class="textarea1" readonly="readonly" style="width:600px; height:400px">
				내
				용
				</textarea>
			</div>
			<div class="">
				<div class="">02. 회원탈퇴 하기 </div>
					<div class=""><span>비밀번호 : </span>
						<input type="password" name="mem_password" maxlength="30" ></div><br>
					<div class=""><span>탈퇴사유 : </span><textarea id="withdraw_reason" name="withdraw_reason" 
					maxlength="200" placeholder="탈퇴 사유 및 개선할 점을 적어주세요" style="width:600px; height:200px" class="textarea1" onKeyup='javascript:maxChk()'>
							
                   			</textarea> </div>
                   	</div>
                   	<div class="">
                   	<input type="checkbox" name="withdraw_c" />탈퇴동의약관 내용을 전부 읽고 확인 하였습니다.
                   	</div>
                   	<div class="">
						<hr class="">
						<input class="btn1" type="button" value="이전단계" onclick= "history.back()"/>
    					<input class="btn1" type="submit" value="탈퇴" onclick="return check_withdraw()">	
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
    	function check_withdraw() {
	        //체크박스 체크여부 확인
	        var chk1=document.withdraw.terms_withdraw.checked;
	        var chk2=document.withdraw.withdraw_c.checked;
	        
	        if(!chk1){
	            alert('(필수)회원탈퇴 안내를 확인하고 동의하여야 탈퇴진행이 가능합니다.');
	            return false;
	        } 
	        if (document.withdraw.mem_password.value == "") {
	   			alert("탈퇴를 진행하시려면 비밀번호를 입력해주세요")
	    		document.withdraw.mem_password.focus();
	    		return false;
			}
	        if(!chk2) {
	            alert('(필수)탈퇴진행시 개인정보를 되돌릴 수 없음을 다시 확인합니다.');
	            return false;
	        }
		}
	</script>
	<script>
	if (document.withdraw.withdraw_reason.value == "") {
			alert("프로젝트애니멀의 개선을 위해 탈퇴사유를 적어주시면 감사하겠습니다.")
		withdraw_reason.focus();
		return false;
	}
	
	</script>
	<script>
	function maxChk(){

    	var f = document.withdraw;
    	if(f.withdraw_reason.value.length > 150) {
      	alert("글자수는 100자로 제한됩니다.");
      	f.withdraw_reason.value=f.withdraw_reason.value.substring(0,100);
      	f.withdraw_reason.focus();
    	}
  	}
	</script>
	
	<script>
	function termsCheck(){
		var checked = terms_withdraw.checked;
		if(checked){
			terms_withdraw.value="Y";
		}else{
			terms_withdraw.value = "N";
		}
	}
	</script>
</body>
</html>