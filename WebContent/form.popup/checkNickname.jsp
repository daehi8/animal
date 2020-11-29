<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--닉네임중복체크버튼을 누르면 중복체크를 실행처리 합니다.-->
<title>checkId</title>
<link href="/animal/css/style.css" rel="stylesheet">
</head>

	<%
  		//회원가입 닉네임 입력란에 입력한 mem_nicname를 가져옵니다.
  		String mem_nickname = request.getParameter("mem_nickname");

	%>
	
	<!-- 부모창의 값으로 넘김 -->
	     	<script type="text/javascript">
	
			//자식창에 있는 mem_id 데이터를 부모창으로 보냅니다.
			function send_nickname()
			{		
				opener.document.modify.mem_nickname.value=document.getElementById("check_nickname").value;
				self.close();
			}
			//document.getElementById("mem_id").value = opener.document.check.mem_id.value;

		</script>

	<body>
		<div class="">
			<div class="">
			<form id="modify" name="modify" method="post" action="/animal/pro.member/checkNicknamePro.jsp">
   				<br>
    			<b><font size="4" color="gray">닉네임 중복체크</font></b>
    			<hr size="1" width="80%">
    		</div>
    		<div class="">
            		<input type="text" name="mem_nickname" id="check_nickname" value="<%=mem_nickname%>" />
            		<input type="submit" value="중복확인">
         	</div>
         	<div>
        		<input id="cancel" type="button" value="취소" onclick="self.close()">
        		<input id="use" type="button" value="사용하기" onclick="send_nickname()">
     		</form>
     		</div>
     	</div>
	</body>
</html>