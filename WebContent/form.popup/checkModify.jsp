<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ page import="member.MemberDTO" %>
<%@ page import="member.MemberDAO" %>
<link href="/animal/css/style.css" rel="stylesheet">
<script type="text/javaScript" src="css/stylesheet.css"></script>

<title>Check Modify</title>
</head>
	
	<!-- 변경화면으로 넘어가기 위해선 password 대조가 필요합니다. -->
	<script>
 	function check_modify() {
     if(!document.modify.mem_password.value){
         alert("비밀번호를 입력하세요.");
         return false;
     	}
 	}
	</script>


	<%
	String id = session.getAttribute("memId").toString();
	MemberDAO dao = MemberDAO.getInstance();
	MemberDTO dto = new MemberDTO();
	
	String matched = request.getParameter("matched");
	String db_flag = (String) session.getAttribute("db_flag");
    
	if(matched!= null)
	{%>
	<script>
		//matched가 null값이 아니면 창이 닫힘
		var flag = '<%=db_flag%>';
		if(parseInt(flag) == 0){
			
			opener.window.location.href ='/animal/form.member/modifyAdminInfoForm.jsp';
			
		}else if(parseInt(flag) == 1){
			
			opener.window.location.href ='/animal/form.member/modifyMemberInfoForm.jsp';
			
		}else if(parseInt(flag) == 2){
			
			opener.window.location.href ='/animal/form.member/modifyEnterpriseInfoForm.jsp';
			
		}else{
			
		}
		window.close();
		
	</script>
	<%}%> 	

<body>
	<div class="">
		<div class="">
			<div class="">
				<font class="">회원정보 변경</font><br>
			</div>
			<div class="">				
				<div class="">
					<font class="">정보의 안전하게 보호하기 위해 비밀번호를 다시 입력해주세요</font>
				</div>
			</div>
			<form name="modify" method="post" action="/animal/pro.popup/checkModifyPro.jsp" onsubmit="return check_modify()">
			<div class="">
				<table class="">
					<tr>
						<td class=""><font>아이디 :</font></td>
						<td colspan="2"><%=id%></td>
					</tr>
					<tr>
						<td class=""><font>비밀번호 :</font></td>
						<td colspan="2"><input type="password" id="mem_password" name="mem_password" type="text"></td>
					</tr>
				</table>
			</div>
			<div>
				 <hr class="">
				 <input class="" type="button" value="취소" onclick="javascript:self.close();">
				 <input class="" type="submit" value="확인">  
			</div>
			</form>
		</div>
		<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
		<script>
 			//자동고침	
			$(window).on('unload', function(){
			window.opener.location.reload();
			})		
		</script>
	</body>
</html>
	