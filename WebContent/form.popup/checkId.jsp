<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/animal/css/style.css" rel="stylesheet">
<!--아이디중복체크버튼을 누르면 중복체크를 실행처리 합니다.-->
<title>checkId</title>
</head>

	<%
  		//회원가입 아이디 입력란에 입력한 mem_id를 가져옵니다.
  		request.setCharacterEncoding("UTF-8");
  		String mem_id = request.getParameter("mem_id");

	%>
			
	<body>
		<div class="">
			<div class="">
   				<br>
    			<b><font class="">아이디 중복체크</font></b>
    			<hr size="1" width="80%">
    		</div>
    		<div class="">
        		<form id="check" method="post" action="/animal/pro.popup/checkIdPro.jsp"> 
            		<input type="text" name="mem_id" id="check_id" value="<%=mem_id%>" />
            		<input type="submit" value="중복확인">
         		</form>
         	</div>
         	<div>
        		<input id="cancel" type="button" value="취소" onclick="window.close()">
        		<input id="use" type="button" value="사용하기" onclick="send_id()">
     		</div>
     	</div>
     	<script type="text/javascript">
	
			//자식창에 있는 mem_id 데이터를 부모창으로 보냅니다.
			function send_id()
			{		
				opener.document.register.mem_id.value=document.getElementById("check_id").value;
				self.close();
			}
			//document.getElementById("mem_id").value = opener.document.check.mem_id.value;

		</script>
		<script>
		//아이디를 입력하지 않았을 경우
		if (check.mem_id.value == "") {
   			alert("아이디를 입력하지 않았습니다.")
    		mem_id.focus();
    		return false;
		}
		//아이디에 공백 사용하지 않기O
		if (f.check.mem_id.value.indexOf(" ") >= 0) {
    		alert("아이디에 공백을 사용할 수 없습니다.")
    		f.register.mem_id.focus();
   		 	f.register.mem_id.select()
   		 	return false;
		}
		//아이디 유효성 검사 (영문소문자, 숫자만 허용)O
		for (var i = 0; i < f.check.mem_id.value.length; i++) {
	    ch = f.check.mem_id.value.charAt(i)
    	if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') &&! (ch >= 'A' && ch <= 'Z')) {
        	alert("아이디는 영문 대소문자, 숫자만 입력가능합니다.")
    	    f.check.mem_id.focus();
        	f.check.mem_id.select();
        	return false;
    		}
		}
		//아이디 길이 체크 (4~12자)O
		if (f.check.mem_id.value.length<8 || f.check.mem_id.value.length>12) {
    		alert("아이디를 8자이상 입력해주세요.")
    		f.check.mem_id.focus();
    		f.check.mem_id.select();
    		return false;
		}
		//아이디가 영문으로 시작하지 않을 경우
		if (!/^[a-zA-Z]/.check.mem_id) {
    		alert("아이디는 영문으로 시작하여야 합니다.")
    		document.register,mem_password.focus();
    		return false;
		}
		</script> 
	</body>
</html>