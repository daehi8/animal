<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ page import="member.MemberDTO" %>
<%@ page import="member.MemberDAO" %>
<%@ page import="member.RandomNickname" %>
<%@ page import="java.util.*" %>
<meta charset="UTF-8"> 

<%
	//RandomNickname nickname = new nickname();
	//nickname = request.getParameter("nickname");
	String terms_use = request.getParameter("terms_use");
	String terms_privacy = request.getParameter("terms_privacy");
	String terms_sns = request.getParameter("terms_sns");
	String terms_email = request.getParameter("terms_email");
	//System.out.println(mem_nickname);
%>
<%
	Random rand = new Random();
	int mem_nickname = rand.nextInt(90000) + 10000;
	System.out.println(mem_nickname);
%>

<title>Register_Member_Form</title>
<script type="text/javascript" src="Project_Ani/js/checkemailaddy.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>

<Style>
	.table1{width:80%;height:80%;background:white;margin:auto;}
	.table2{width:90%;height:90%;background:white;margin:auto;}
	.btn1{border:1px solid silver;border-top-right-radius:5px;border-bottom-right-radius:5px;border-top-left-radius:5px;border-bottom-left-radius:5px;
			font-size:15px;font-weight: bold;color:black;text-align:center;background-color:white;width:80pt;height:30pt;margin:auto;}
	.btn2{border:1px solid silver;border-top-right-radius:5px;border-bottom-right-radius:5px;border-top-left-radius:5px;border-bottom-left-radius:5px;
			font-size:12px;font-weight: bold;color:black;text-align:center;background-color:white;width:50pt;height:15pt;margin:auto;}
	.font1{color:black;font-size:30px;text-align:center;font-weight:bold;}
	.font2{color:black;font-size:20px;text-align:center;font-weight:nomal;}
	.font3{color:black;font-size:15px;text-align:left;font-weight:nomal;}	
   table {
   width : 1000;
   
   border: 1px solid black;
   border-collapse: collapse;
   margin : auto;
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
A:link {text-decoration:none;color:#696969}
A:hover{text-decoration:yes;color:#66CCFF}
A:visited {text-decoration:none;color:#330066;}

</style>


</head>
<jsp:include page="../_comm/_head.jsp"></jsp:include>
<body>
	<!--total_box-->
	<div class="content">
		<div class="register_box">
			<div class="register_title">
				<font class="font1">&nbsp;&nbsp;회원가입</font>
			</div>
			<!-- register 단계 -->
			<div class="category_stage">
				<font color="grey">&nbsp;&nbsp;01가입&nbsp;></font>
      			<font color="grey">&nbsp;&nbsp;02약관동의&nbsp;></font>
       			<font color="red">&nbsp;&nbsp;03정보입력&nbsp;></font>
       			<font color="grey">&nbsp;&nbsp;04가입완료&nbsp;&nbsp;</font>
       		</div>
       		<div class="register_title2">
       			<font class="">기본정보</font>
       		</div>
			<div class="register_title">
				<!-- hidden으로 약관동의 넘겨 받고, form으로 개인정보 받음 -->
				<form id="register" name="register" method="post" action="/animal/pro.member/registerMemberPro.jsp" onsubmit="return sendit();">    
					<input type="hidden" name="terms_use" value="<%=terms_use%>" />
					<input type="hidden" name="terms_privacy" value="<%=terms_privacy%>" />
					<input type="hidden" name="terms_sns" value="<%=terms_sns%>" />
					<input type="hidden" name="terms_email" value="<%=terms_email%>" />
					<input type="hidden" name="mem_nickname" value="<%=mem_nickname%>" />
					<table class="">
                 		<tr>
                    		<td class=""><font color="red">＊</font>아이디</td>
                   			<td>
                        		<input type="text" id="mem_id" name="mem_id" maxlength="30" >
                   			</td>
                   			<td>
                   				<input class="" type="button" id="check_id" name="check_id" value="중복확인"
	       								onclick="window.open('/animal/form.popup/checkId.jsp?mem_id='+document.getElementById('mem_id').value,'window_name','width=500,height=300,location=no,status=no,scrollbars=no');"> 
                   			</td>
                   		</tr>	 
                		<tr>
                    		<td class=""><font color="red">＊</font>비밀번호</td>
                   		 	<td colspan="2">
                        		<input type="password" id="mem_password" name="mem_password" maxlength="30" onKeyup="safetyPasswordPattern(this);" style="ime-mode:disabled;"/>
                    			<br><span id="makyText"></span>
                    		</td>
               			</tr>
                		<tr>
                    		<td class=""><font color="red">＊</font>비밀번호 확인</td>
                    		<td colspan="2">
                        		<input type="password" id="mem_passwordc" name="mem_passwordc" maxlength="30" onchange="check_password()" >
                    		</td>
                		</tr>  
                		<tr>
                    		<td class=""><font color="red">＊</font>이름</td>
                    		<td colspan="2">
                        		<input type="text" id="mem_name" name="mem_name" maxlength="30" >
                    		</td>
                		</tr>
                		<tr>
                    		<td class=""><font color="red">＊</font>성별</td>
                    		<td colspan="2">
                        		<input type="radio" id="mem_gender" name="mem_gender" value="M"  >남성
                        		<input type="radio" id="mem_gender" name="mem_gender" value="W"  >여성
                        		<input type="radio" id="mem_gender" name="mem_gender" value="O" checked >기타
                    		</td>
                		</tr> 
                		<tr>
                    		<td class=""><font color="red">＊</font>이메일</td>
                    		<td colspan="2">
                        		<input type="text" id="email1" name="email1" size="5" maxlength="40" >&nbsp;@
                        		<input type="text" id="email2"  name="email2" size="5" maxlength="20" disabled >
                        		<input type="hidden" id="email3" name="email3" />
                        	
                       			<select name="emailselect" >
                           			<option type="hidden" value="">&nbsp;</option>
                            		<option value="1">직접입력</option>
                            		<option value="naver.com">naver.com</option>
                            		<option value="daum.net">daum.net</option>
                            		<option value="gmail.com">gmail.com</option>
                            		<option value="nate.com">nate.com</option>
                   					<option value="hanmail.net">hanmail.net</option> 
                   					<option value="hotmail.com">hotmail.com</option>
									<option value="yahoo.co.kr">yahoo.co.kr</option> 
									<option value="empas.com">empas.com</option> 
									<option value="dreamwiz.com">dreamwiz.com</option> 
									<option value="freechal.com">freechal.com</option> 
									<option value="lycos.co.kr">lycos.co.kr</option> 
									<option value="korea.com">korea.com</option>
                       			</select>  	 
                    		</td>
                		</tr>      
                		<tr>
                    		<td class="title"><font color="red">＊</font>휴대전화</td>
                    		<td colspan="2">
                    			<select id="tel1" name="tel1">
                        			<option value="010">010</option>
                        			<option value="011">011</option>
                        			<option value="016">016</option>
                        			<option value="017">017</option>
                        			<option value="018">018</option>
                        			<option value="019">019</option>
                    			</select>
                    	
                        	<span>&nbsp;-&nbsp;</span><input type="text" id="tel2" name="tel2" size="3" maxlength="4" onkeypress='return checkNumber(event)'/>
                        	<span>&nbsp;-&nbsp;</span><input type="text" id="tel3" name="tel3" size="3" maxlength="4" onkeypress='return checkNumber(event)'/>
                    	</td>
                	</tr>
                 	<tr>
                    	<td class="">&nbsp;&nbsp;&nbsp;&nbsp;전화번호</td>
                   		<td colspan="2">
                    		<select name="ltel1" id="ltel1" name="ltel1" title="지역번호" >
                        		<option value="02">02</option> <!--서울-->
                        		<option value="051">051</option><!--부산-->
                        		<option value="053">053</option><!--대구-->
                        		<option value="032">032</option><!--인천-->
                        		<option value="062">062</option><!--광주-->
                        		<option value="042">042</option><!--대전-->
                        		<option value="052">052</option><!--울산-->
                        		<option value="044">044</option><!--세종-->
                        		<option value="031">031</option><!--경기-->
                        		<option value="033">033</option><!--강원-->
                        		<option value="043">043</option><!--충북-->
                        		<option value="041">041</option><!--충남-->
                        		<option value="063">063</option><!--전북-->
                        		<option value="061">061</option><!--전남-->
                        		<option value="054">054</option><!--경북-->
                        		<option value="055">055</option><!--경남-->
                        		<option value="064">064</option><!--제주-->
                    		</select>
                        <span>&nbsp;-&nbsp;</span><input type="text" id="ltel2" name="ltel2" size="3" maxlength="3" onkeypress='return checkNumber(event)'/>
                        <span>&nbsp;-&nbsp;</span><input type="text" id="ltel3" name="ltel3"  size="3" maxlength="4" onkeypress='return checkNumber(event)'/>
                    </td>
                </tr>
                <tr>
                    <td class=""><font color="red">＊</font>주소</td>
                    <td colspan="2">
                    	<input style="line-height:normal" type="text" size="5" name="mem_zip_code" id="mem_zip_code" placeholder="우편번호" onkeypress='return checkNumber(event)'>
                    	<input class="" type="button" value="검색" onclick="zip_code()"><br>
                        <input class="" type="text" size="30" id="address1" name="address1" placeholder="주소"/><br>
                        <input class="" type="text" size="30" id="address2" name="address2" placeholder="상세주소"/><br>
                    </td>
                </tr> 
				<tr>
					<td class="" colspan="3"><font class="">부가정보</font></td>
				</tr>
				<tr>
					<td class="" colspan="3">
						<table class="" >
							<tr>
           						<td class=""><font color="red">＊</font>생년월일</td>
          				 		<td class="">
          				 			<input type="date" id="mem_birthdate" name="mem_birthdate" size="25" maxlength="8" placeholder="ex : 19801118"  onclick='validate()'>
          				 			<div class="check_font" id="birth_check"></div>
          				 		</td>
                     		</tr>
              	 			<tr>
                				<td>&nbsp;&nbsp;&nbsp;&nbsp;관심분야</td>
                    			<td class="">
                       	    		<input type="checkbox" name="mem_interested" value="1">유기동물입양
                        			<input type="checkbox" name="mem_interested" value="2">실종/발견동물제보<br>
                       				<input type="checkbox" name="mem_interested" value="3">유기동물정보
                       	    		<input type="checkbox" name="mem_interested" value="4">봉사활동지원<br>
                           	 		<input type="checkbox" name="mem_interested" value="5">정기후원
                           	 		<input type="checkbox" name="mem_interested" value="6" checked>기타<br>
                       			</td>
                    		</tr>
                 		 	<tr>
                   				<td class="">&nbsp;&nbsp;&nbsp;&nbsp;가입목적</td>
                   				<td>
                   					<input type="text" style="width:300px; height:20px" id="mem_purpose" name="mem_purpose"  placeholder="간단히 가입목적을 적어주세요">
                     			</td>
                    		</tr>
                		</table>
					</td>
				</tr>
				<tr>
					<td class="" colspan="3">
						<hr class="">
						<input class="" type="button" value="이전 페이지" onclick="history.back()"/>
				 		<input class="" type="submit" value="가입">
            	 		<input class="" type="button" value="취소" onclick="location.href = '/animal/form.member/loginMainForm.jsp'"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</div>

	<% 
   		// 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
   		// LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
   		String msg=request.getParameter("msg");        
   		if(msg!=null && msg.equals("1")) //중복되는 ID일떄
   		{
      		out.println("<br>");
      		out.println("<script>alert('중복되는 ID입니다 다른 ID를 사용해주세요');</script>");
   		}
		else if(msg!=null && msg.equals("0"))
  		{    
   			out.println("<br>");
   			out.println("<script>alert('사용할수 있는 아이디 입니다');</script>");
		}
	%>

<script>
    //아이디부터 유효성 검사
	function sendit() {	
		var alpaBig= "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	    var alpaSmall= "abcdefghijklmnopqrstuvwxyz";
	    var num = "01234567890";
	  	//아이디 입력여부O
		if (document.register.mem_id.value == "") {
   			alert("아이디를 입력하지 않았습니다.")
    		mem_id.focus();
    		return false;
		}
	   	//아이디에 공백 사용하지 않기O
    	if (document.register.mem_id.value.indexOf(" ") >= 0) {
    	    alert("아이디에 공백을 사용할 수 없습니다.")
    	    document.register.mem_id.focus();
    	   	return false;
    	}
		//비밀번호 입력여부O
		if (document.register.mem_password.value == "") {
   			alert("비밀번호를 입력하지 않았습니다.")
    		mem_password.focus();
    		return false;
		}
	   	//비밀번호에 공백 사용하지 않기O
    	if (document.register.mem_password.value.indexOf(" ") >= 0) {
    	    alert("비밀번호에 공백을 사용할 수 없습니다.")
    	    document.register.mem_password.focus();
    	   	return false;
    	}
		//비밀번호 확인 입력 여부O
		if (document.register.mem_passwordc.value == "") {
   			alert("비밀번호를 확인하여 대조해주세요")
    		mem_passwordc.focus();
    		return false;
		}
		//비밀번호와 비밀번호확인이 동일하지 않은 경우O
		if (document.register.mem_password.value != document.register.mem_passwordc.value) {
    		alert("비밀번호가 동일하게 입력되었는지 확인해 주세요")
    		document.register.mem_passwordc.focus();
    		return false;
		}
		//이름 확인 입력 여부O
		if (document.register.mem_name.value == "") {
   			alert("이름을 입력해주세요")
    		mem_name.focus();
    		return false;
		}
		//이메일 입력여부O
		if (document.register.email1.value == "") {
   			alert("이메일을 입력해주세요.")
    		email1.focus();
    		return false;
		}
		if (document.register.email2.value == "") {
   			alert("이메일을 입력해주세요.")
    		email2.focus();
    		return false;
		}
		//핸드폰번호 입력여부O
		if (document.register.tel1.value == "") {
   			alert("핸드폰번호 첫번째자리를 입력해주세요.")
    		tel1.focus();
    		return false;
		}
		if (document.register.tel2.value == "") {
   			alert("핸드폰번호 두번째자리를 입력해주세요.")
    		tel2.focus();
    		return false;
		}
		if (document.register.tel3.value == "") {
   			alert("핸드폰번호 세번째자리를 입력해주세요.")
    		tel3.focus();
    		return false;
		}
		if(document.register.tel2.value.length<4){
    		alert("4자 숫자로 입력해주십시오.")
    		document.register.tel2.focus();
    			return false;
		}
		if(document.register.tel3.value.length<4){
    		alert("4자 숫자로 입력해주십시오.")
    		document.register.tel3.focus();
    			return false;
		}
		//주소 입력여부O
		if (document.register.mem_zip_code.value == "") {
   			alert("주소를 조회해 주세요")
    		mem_zip_code.focus();
    		return false;
		}
		if (document.register.address1.value == "") {
   			alert("주소를 입력해주세요")
    		address1.focus();
    		return false;
		}
		if (document.register.address2.value == "") {
   			alert("상세주소를 입력해주세요")
    		address2.focus();
    		return false;
		}
		//생년월일 입력여부O
		if (document.register.mem_birthdate.value == "") {
   			alert("창년일을 입력해주세요")
    		mem_birthdate.focus();
    		return false;
		}
	    //비밀번호와 아이디가 동일한 경우0
		if (document.register.mem_password.value == document.register.mem_id.value) {
    		alert("아이디와 비밀번호가 같습니다.")
    		document.register.mem_password.focus();
    		return false;
		}
		//아이디 길이 체크 (4~12자)O
		if (document.register.mem_id.value.length<4 || document.register.mem_id.value.length>12) {
    		alert("아이디를 4자이상 입력해주세요.")
    		document.register.mem_id.focus();
    		return false;
		}
   		//비밀번호 입력여부 체크O
		if (document.register.mem_password.value == "") {
   			alert("비밀번호를 입력하지 않았습니다.")
    		document.register.mem_password.focus();
    		return false;
		}
		//비밀번호 길이 체크(4~8자 까지 허용)
		if (document.register.mem_password.value.length<4 || document.register.mem_password.value.length>30) {
   			alert("비밀번호를 4자이상까지 입력해주세요.")
   	 		document.form.password.focus();
   	 		return false;
		}
   		//비밀번호와 아이디가 동일한 경우0
		if (document.register.mem_password.value == document.register.mem_id.value) {
    		alert("아이디와 비밀번호가 같습니다.")
    		document.register,mem_password.focus();
    		return false;
		}
    	//아이디 유효성 검사 (영문소문자, 숫자만 허용)O
    	for (var i = 0; i < document.register.mem_id.value.length; i++) {
    	    ch = document.register.mem_id.value.charAt(i)
        	if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') &&! (ch >= 'A' && ch <= 'Z')) {
            	alert("아이디는 영문 대소문자, 숫자만 입력가능합니다.")
        	    document.register.mem_id.focus();
            	return false;
        	}
    	}
    }
	</script>
	
	<script>
		$(function(){	
			$(document).ready(function(){
				$('select[name=emailselect]').change(function() {
				//공백일시
					if($(this).val()=='1'){
						//값 초기화
						$('#email2').attr("disabled",false);
						$('#email2').val('');
					} else {
						$('#email2').val($(this).val());
						$('#email3').val($(this).val());
						$("#email2").attr("readonly", true);
						
					}
				});
			});
		});
	</script>
	
	<!--우편번호 다음 API연동 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    function zip_code() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("address1").value = extraAddr;
                
                } else {
                    document.getElementById("address2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('mem_zip_code').value = data.zonecode;
                document.getElementById("address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address2").focus();
            }
        }).open();
    }
	</script>
	
	<script type="text/javascript">
	function safetyPasswordPattern(str) {
	
	    var pass = str.value;
	    var message = "";
	    var color = "";
	    var checkPoint = 0;
	
	    // 입력값이 있을경우에만 실행
	    if(pass.length) {
	
	        // 최대 입력 글자수를 제한한다.
	        if(pass.length < 4 || pass.length > 16) {
	            message = ":: 최소 4자 이상, 최대 16자 이하 ::";
	            color = "red";
	        }
	
	        // 문자열의 길이가 8 ~ 16 인경우
	        else {
	
	            // 비밀번호 문자열에 숫자 존재 여부 검사
	            var pattern1 = /[0-9]/;  // 숫자
	            if(pattern1.test(pass) == false) {
	                checkPoint = checkPoint + 1;
	            }
	
	            // 비밀번호 문자열에 영문 소문자 존재 여부 검사
	            var pattern2 = /[a-z]/;
	            if(pattern2.test(pass) == false) {
	                checkPoint = checkPoint + 1;
	            }
	
	            // 비밀번호 문자열에 영문 대문자 존재 여부 검사
	            var pattern3 = /[A-Z]/;
	            if(pattern3.test(pass) == false) {
	                checkPoint = checkPoint + 1;
	            }
	
	            // 비밀번호 문자열에 특수문자 존재 여부 검사
	            var pattern4 = /[~!@#$%^&*()_+|<>?:{}]/;  // 특수문자
	            if(pattern4.test(pass) == false) {
	                checkPoint = checkPoint + 1;
	            }
	
	            if(checkPoint >= 3) {
	                message = ":: 다른비밀번호를 사용하길 권장드립니다. ::";
	                color = "#A23E48";
	            } else if(checkPoint == 2) {
	                message = ":: 보안성이 낮습니다 ::";
	                color = "#FF8C42";
	            } else if(checkPoint == 1) {
	                message = ":: 보안성이 보통입니다 ::";
	                color = "#FF8C42";
	            } else {
	                message = ":: 보안성이 강력합니다 ::";
	                color = "#0000CD";
	            }
	        }
	    }
	
	    else {
	        message = "";
	        color = "#000000";
	    }
	
	    document.getElementById("makyText").innerHTML = message;
	    document.getElementById("makyText").style.color = color;
	}
	</script>
	<script>
	function checkNumber(event) {
		  if(event.key === '.' 
		     || event.key === '-'
		     || event.key >= 0 && event.key <= 9) {
		    return true;
		  }
		  return false;
		}
	</script>
	
	<script>
	// 생일 유효성 검사
	var birthJ = false;
	
	// 생년월일	birthJ 유효성 검사
	$('#mem_birthdate').blur(function(){
		var dateStr = $(this).val();		
	    var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
	    var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
	    var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
	    var today = new Date(); // 날짜 변수 선언
	    var yearNow = today.getFullYear(); // 올해 연도 가져옴
		
	    if (dateStr.length <=8) {
			// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
		    if (1900 > year || year > yearNow){
		    	
		    	$('#birth_check').text('');
				$('#birth_check').css('color', 'red');
		    	
		    }else if (month < 1 || month > 12) {
		    		
		    	$('#birth_check').text('존재하지 않는 월수입니다.');
				$('#birth_check').css('color', 'red'); 
		    
		    }else if (day < 1 || day > 31) {
		    	
		    	$('#birth_check').text('존재하지않는 일수입니다.');
				$('#birth_check').css('color', 'red'); 
		    	
		    }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
		    	 
		    	$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red'); 
		    	 
		    }else if (month == 2) {
		    	 
		       	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
		       	
		     	if (day>29 || (day==29 && !isleap)) {
		     		
		     		$('#birth_check').text('생년월일을 확인해주세요 :)');
					$('#birth_check').css('color', 'red'); 
		    	
				}else{
					$('#birth_check').text('');
					birthJ = true;
				}//end of if (day>29 || (day==29 && !isleap))
		     	
		    }else{
		    	
		    	$('#birth_check').text(''); 
				birthJ = true;
			}//end of if
			
			}else{
				//1.입력된 생년월일이 8자 초과할때 :  auth:false
				$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red');  
			}
		}); //End of method /*
	</script>
	<script>
    function validate(){
        document.register.mem_birthdate.value
        if (txt>=19100101 && txt<=20051212) {
            return false
        }else{
            alert("만 14세 이상 100세미만의 회원만 가입이 가능합니다.")
            return false
        }
	}
	</script>
	<script>
	function gender() {
	var test = document.getElementById('mem_gender').value;

	 

	if (test == '1' )
	{
	 document.getElementById('radio1').checked="on"
	 document.getElementById('txt1').value="승인된내용"
	 document.getElementById('txt2').value=""
	}
	else if (test == '2' )
	{
	 document.getElementById('radio2').checked="on"
	 document.getElementById('txt2').value="반려된내용"
	 document.getElementById('txt1').value=""
	}

	else

	{

	alert('없는데이터')

	document.getElementById('txt2').value=""
	document.getElementById('txt1').value=""
	document.getElementById('radio1').checked=""
	document.getElementById('radio2').checked=""
	}

	 

	}


	</script>

</body>
</html>		
	

	