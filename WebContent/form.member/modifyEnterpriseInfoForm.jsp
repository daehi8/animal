<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="member.MemberDTO" %>
<%@ page import="member.MemberDAO" %>
<html>
<!-- 일반회원 정보를 변경할 수있는 화면입니다. -->
<title>modifyMemberInfoForm</title>
<script type="text/javascript" src="animal/js/checkemailaddy.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<head>
<style>
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
    <%
    	// 한글 인코딩 처리 
    	request.setCharacterEncoding("UTF-8");
    %>

	<%
		String id = session.getAttribute("memId").toString();
	    String db_flag = (String) session.getAttribute("db_flag");
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = dao.enterpriseViewInfo(id);
		//System.out.print(id);//디버딩
	%>
	
</head>
	<jsp:include page="../_comm/_head.jsp"></jsp:include>
<body>
	<form name="modify" method="post" action="/animal/pro.member/modifyEnterpriseInfoPro.jsp" onsubmit="return sendit();">
	<div class="">
		<div class="">
			<font class="">&nbsp;&nbsp;개인정보 수정</font>
		</div>
		<div class="">
			<%=dto.getMem_id() %>님의 개인정보입니다.
		</div>
		<div>
			<font class="">기본정보</font>
			<hr class="">
				<table class="">
					<tr>
						<td class="" colspan="3">
							
							<input type="hidden" name="mem_id" value="<%=id%>">	 
							<table class="table2">
                 		 	<tr>
							<td width="30%" class="font3">아이디
							</td>
							<td>
                        		<%=dto.getMem_id() %>
                   			</td>
							</tr>
							<tr>
                    			<td width="30%" class="font3">닉네임
                    			</td>
                   			 	<td>
                        			<input type="text" id="mem_nickname" name="mem_nickname" maxlength="30" value="<%=dto.getMem_nickname()%>">
                   				</td>
                   				<td>
                   					<input class="" type="button" id="check_id" name="check_id" value="중복확인"
	       							onclick="window.open('/animal/form.popup/checkNickname.jsp?mem_nickname='+document.getElementById('mem_nickname').value,'window_name','width=500,height=300,location=no,status=no,scrollbars=no');"> 
                   				</td>
                   			</tr>	 
                			<tr>
                    			<td class="font3">비밀번호</td>
                   		 		<td>
                        			<input type="password" id="old_password" name="old_password" maxlength="30" value="<%=dto.getMem_password()%>">
                    			</td>
                    			<td>
                    				<input class="btn2" type="button" name="pw_check" value="가능여부" 
                    					onclick="window.open('/animal/form.popup/checkPassword.jsp','window_name','width=500,height=500,location=no,status=no,scrollbars=no');"> 
                    			</td>
               				</tr>
                			<tr>
                    			<td class="font3">새비밀번호 :</td>
                    			<td colspan="2">
                        		<input type="password" id="mem_Password" name="mem_password" maxlength="30" >
                    			</td>
                    		</tr>
                    		<tr>
                    			<td class="font3">새비밀번호 확인</td>
                    			<td colspan="2">
                        			<input type="password" id="mem_Passwordc" name="mem_passwordc" maxlength="30">
                    			</td>
                			</tr> 
                			<tr>
                    			<td class="title">회사명</td>
                    			<td colspan="2">
                        			<%=dto.getEp_name()%>">
                    			</td>
                			</tr> 
                			<tr>
                    			<td class="title">대표자</td>
                    			<td colspan="2">
                        			<input type="text" id="mem_name" name="mem_name" maxlength="30"
                        			value="<%=dto.getMem_name()%>">
                    			</td>
                			</tr>
                			<tr>
                    		<td class=""><font color="red">＊</font>업태</td>
                    		<td colspan="2">
                       		
                    		<%
                    			if(dto.getEp_type().equals("1")){
                    				%>
                    				<input type="radio" id="ep_type" name="ep_type" value="1" checked >보호소
                        			<input type="radio" id="ep_type" name="ep_type" value="2"  >병원
                        			<input type="radio" id="ep_type" name="ep_type" value="3"  >단체
                        			<input type="radio" id="ep_type" name="ep_type" value="4"  >회사
                    				<input type="radio" id="ep_type" name="ep_type" value="O"  >기타
                    				<%
                    			}
                    			else if(dto.getEp_type().equals("2")){
                    				%>
                    				<input type="radio" id="ep_type" name="ep_type" value="1"  >보호소
                        			<input type="radio" id="ep_type" name="ep_type" value="2" checked >병원
                        			<input type="radio" id="ep_type" name="ep_type" value="3"  >단체
                        			<input type="radio" id="ep_type" name="ep_type" value="4"  >회사
                    				<input type="radio" id="ep_type" name="ep_type" value="O"  >기타
                    				<%
                    			}
                    			else if(dto.getEp_type().equals("3")){
                    				%>
                    				<input type="radio" id="ep_type" name="ep_type" value="1"  >보호소
                        			<input type="radio" id="ep_type" name="ep_type" value="2"  >병원
                        			<input type="radio" id="ep_type" name="ep_type" value="3" checked >단체
                        			<input type="radio" id="ep_type" name="ep_type" value="4"  >회사
                    				<input type="radio" id="ep_type" name="ep_type" value="O"  >기타
                    				<%
                    			}
                    			else if(dto.getEp_type().equals("4")){
                    				%>
                    				<input type="radio" id="ep_type" name="ep_type" value="1"  >보호소
                        			<input type="radio" id="ep_type" name="ep_type" value="2"  >병원
                        			<input type="radio" id="ep_type" name="ep_type" value="3"  >단체
                        			<input type="radio" id="ep_type" name="ep_type" value="4" checked >회사
                    				<input type="radio" id="ep_type" name="ep_type" value="O"  >기타
                    				<%
                    			}
                    			else if(dto.getEp_type().equals("0")){
                    				%>
                    				<input type="radio" id="ep_type" name="ep_type" value="1"  >보호소
                        			<input type="radio" id="ep_type" name="ep_type" value="2"  >병원
                        			<input type="radio" id="ep_type" name="ep_type" value="3"  >단체
                        			<input type="radio" id="ep_type" name="ep_type" value="4"  >회사
                    				<input type="radio" id="ep_type" name="ep_type" value="O" checked >기타
                    				<%
                    			}
                    			else if(dto.getEp_type().equals("N")){
                    				
                    				%>
                    				<input type="radio" id="ep_type" name="ep_type" value="1"  >보호소
                        			<input type="radio" id="ep_type" name="ep_type" value="2"  >병원
                        			<input type="radio" id="ep_type" name="ep_type" value="3"  >단체
                        			<input type="radio" id="ep_type" name="ep_type" value="4"  >회사
                    				<input type="radio" id="ep_type" name="ep_type" value="O" checked >기타
                    				<%
                    			}
                    			%>
                    	</td>
                		</tr> 
                			<tr>
                    			<td class="title">이메일</td>
                    			<td colspan="2">
                        			<input type="text" id="email1" name="email1" size="5" maxlength="40" value="<%=dto.getEmail1()%>">&nbsp;@
                        			<input type="text" id="email2" name="email2" size="5" maxlength="20" disabled value="<%=dto.getEmail2()%>">
                        			<input type="hidden" id="email3" name="email3" />
                       				
                       				<select  name="emailselect"  value="<%=dto.getEmail2()%>">
                           				<option type="hidden" value="0">&nbsp;</option>
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
                    	<td class="title">휴대전화</td>
                    	<td colspan="2">
                    		<select id="tel1" name="tel1" title="휴대폰 첫자리 선택입력" value="<%=dto.getTel1() %>">
                        	<option value="010">010</option>
                        	<option value="011">011</option>
                        	<option value="016">016</option>
                        	<option value="017">017</option>
                        	<option value="018">018</option>
                        	<option value="019">019</option>
                    		</select>
                    	
                        	<span>&nbsp;-&nbsp;</span><input type="text" id="tel2" name="tel2" size="3" maxlength="4" value="<%=dto.getTel2() %>"/>
                        	<span>&nbsp;-&nbsp;</span><input type="text" id="tel3" name="tel3" size="3" maxlength="4" value="<%=dto.getTel3() %>"/>
                    	</td>
                	</tr>
                	 <tr>
                   	 	<td class="title">&nbsp;&nbsp;&nbsp;&nbsp;팩스번호</td>
                   		<td colspan="2">
                    		<select name="ltel1" id="ltel1" name="ltel1" title="지역번호" value="<%=dto.getLtel1() %>">
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
                        	<span>&nbsp;-&nbsp;</span><input type="text" id="ltel2" name="ltel2" size="3" maxlength="3" value="<%=dto.getLtel2() %>" />
                        	<span>&nbsp;-&nbsp;</span><input type="text" id="ltel3" name="ltel3"  size="3" maxlength="4" value="<%=dto.getLtel3() %>"/>
                    	</td>
                	</tr>
               		 <tr>
                   	 	<td class="title">주소</td>
                    	<td colspan="2">
	                    	<input style="line-height:normal" type="text" size="5" name="mem_zip_code" id="mem_zip_code" placeholder="우편번호" value="<%=dto.getMem_zip_code() %>">
	                    	<input class="" type="button" value="검색" onclick="zip_code()"><br>
	                        <input class="" type="text" size="30" id="address1" name="address1" placeholder="주소" value="<%=dto.getAddress1() %>"/><br>
	                        <input class="" type="text" size="30" id="address2" name="address2" placeholder="상세주소" value="<%=dto.getAddress2() %>"/><br>
	                   </td>
                	</tr>
                	<tr>
						<td width="30%" class="font3">법인등록번호</td>
						<td><%=dto.getEp_biz_no() %></td>
					</tr>
					<tr>
						<td width="30%" class="font3">사업자번호</td>
						<td><%=dto.getEp_reg_no() %></td>
					</tr>

                	<tr>
						<td width="80%" height="30%" colspan="2">
						
						<tr>
           					<td width="30%" class="font3">창년일</td>
          				 	<td>
          				 		<input type="date" id="mem_birthdate" name="mem_birthdate" value="<%=dto.getMem_birthdate() %>">
          				 	</td>
          				 	<tr>
           						<td width="30%" class="font3">선택약관 체크여부</td>
          				 		<td>
          				 			<input type="checkbox" class="normal" name="terms_sns" value="Y" <%if(dto.getTerms_sns() != null){%>checked<%}%> />동의 : (선택) SNS 수신
									<br><input type="checkbox" class="normal" name="terms_email" value="Y" <%if(dto.getTerms_email() != null){%>checked<%}%> />동의 : (선택) 이메일 수신
          				 		</td>
          				 	</tr>
						</table>
					</td>
				</tr>
				<tr>
				<td class="" colspan="2">
				<small>법인등록번호, 사업자 번호, 회사명이 변경된 경우 고객센터로 문의 부탁드립니다.</small>
				</td>
				<tr>
					<td class="" colspan="2">
					<hr class="">
				 		<input class="" type="submit" value="변경">
            	 		<input class="" type="button" value="이전 페이지" onclick=" history.go(-1)">
            	 		<input class="" type="button" value="회원탈퇴" onclick="location.href = '/animal/form.member/withdrawForm.jsp'">
            	 		<input class="" type="button" value="취소" onclick="location.href = '/animal/form.member/loginEnterpriseForm.jsp'">
					</td>	
				</tr>	
			</table>
			<div>
				
			</div>
		</div>
	</div>
	</form>
	
	<!-- 1차 유효성 검사 -->
	<script>
    //아이디부터 유효성 검사
	function sendit() {	
		var alpaBig= "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	    var alpaSmall= "abcdefghijklmnopqrstuvwxyz";
	    var num = "01234567890";
		//비밀번호 입력여부O
		if (document.modify.mem_password.value == "") {
   			alert("비밀번호를 입력하지 않았습니다.")
    		mem_password.focus();
    		return false;
		}
	   	//비밀번호에 공백 사용하지 않기O
    	if (document.modify.mem_password.value.indexOf(" ") >= 0) {
    	    alert("비밀번호에 공백을 사용할 수 없습니다.")
    	    document.modify.mem_password.focus();
    	   	return false;
    	}
		//비밀번호 확인 입력 여부O
		if (document.modify.mem_passwordc.value == " ") {
   			alert("비밀번호를 확인하여 대조해주세요")
    		mem_passwordc.focus();
    		return false;
		}
		//비밀번호와 비밀번호확인이 동일하지 않은 경우O
		if (document.modify.mem_password.value != document.register.mem_passwordc.value) {
    		alert("비밀번호가 동일하게 입력되었는지 확인해 주세요")
    		document.modify.mem_passwordc.focus();
    		return false;
		}
		//이름 확인 입력 여부O
		if (document.modify.mem_name.value == " ") {
   			alert("이름을 입력해주세요")
    		mem_name.focus();
    		return false;
		}
		//이메일 입력여부O
		if (document.modify.email1.value == " ") {
   			alert("이메일을 입력해주세요.")
    		email1.focus();
    		return false;
		}
		if (document.modify.email2.value == " ") {
   			alert("이메일을 입력해주세요.")
    		email2.focus();
    		return false;
		}
		//핸드폰번호 입력여부O
		if (document.modify.tel1.value == " ") {
   			alert("핸드폰번호 첫번째자리를 입력해주세요.")
    		tel1.focus();
    		return false;
		}
		if (document.modify.tel2.value == " ") {
   			alert("핸드폰번호 두번째자리를 입력해주세요.")
    		tel2.focus();
    		return false;
		}
		if (document.modify.tel3.value == " ") {
   			alert("핸드폰번호 세번째자리를 입력해주세요.")
    		tel3.focus();
    		return false;
		}
		if(document.modify.tel2.value.length<4){
    		alert("4자 숫자로 입력해주십시오.")
    		document.modify.tel2.focus();
    			return false;
		}
		if(document.modify.tel3.value.length<4){
    		alert("4자 숫자로 입력해주십시오.")
    		document.modify.tel3.focus();
    			return false;
		}
		//주소 입력여부O 
		if (document.modify.mem_zip_code.value == " ") {
   			alert("주소를 조회해 주세요")
    		mem_zip_code.focus();
    		return false;
		}
		if (document.modify.address1.value == " ") {
   			alert("주소를 입력해주세요")
    		address1.focus();
    		return false;
		}
		if (document.modify.address2.value == " ") {
   			alert("상세주소를 입력해주세요")
    		address2.focus();
    		return false;
		}
		//생년월일 입력여부O
		if (document.modify.mem_birthdate.value == " ") {
   			alert("생일을 입력해주세요")
    		mem_birthdate.focus();
    		return false;
		}
	    //비밀번호와 아이디가 동일한 경우0
		if (document.modify.mem_password.value == document.register.mem_id.value) {
    		alert("아이디와 비밀번호가 같습니다.")
    		document.modify.mem_password.focus();
    		return false;
		}
   		//비밀번호 입력여부 체크O
		if (document.modify.mem_password.value == " ") {
   			alert("비밀번호를 입력하지 않았습니다.")
    		document.modify.mem_password.focus();
    		return false;
		}
		//비밀번호 길이 체크(4자 까지 허용)
		if (document.modify.mem_password.value.length<8 || document.modify.mem_password.value.length>30) {
   			alert("비밀번호를 8자이상, 30자이하고 입력해주세요.")
   	 		document.modify.password.focus();
   	 		return false;
		}
   		//비밀번호와 아이디가 동일한 경우0
		if (document.modify.mem_password.value == document.modify.mem_id.value) {
    		alert("아이디와 비밀번호가 같습니다.")
    		document.modify.mem_password.focus();
    		return false;
		}
    	//비밀번호 유효성 검사 (영문소문자, 숫자만 허용)O
    	for (var i = 0; i < document.modify.mem_password.value.length; i++) {
    	    ch = document.modify.mem_password.value.charAt(i)
        	if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') &&! (ch >= 'A' && ch <= 'Z')) {
            	alert("비밀번호는 영문 대소문자, 숫자만 입력가능합니다.")
        	    document.modify.mem_password.focus();
            	return false;
        	}
    	}
    }
	</script>

	<!--이메일 선택입력-->
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
						$('select[name=emailselect]')==$("#email2");
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
	
	<!-- 2차 유휴성 인증 -->
	<script>
		//비밀번호끼리 비교한다
		$('.password').focusout(function () {
    	var password1 = $("#mem_password").val();
    	var password2 = $("#mem_password_c").val();

    	if ( mem_password != '' && mem_password_c == '' ) {
        	null;
    	} else if (mem_password != "" || mem_password_c != "") {
        	if (mem_password == mem_password_c) {
            	$("#alert-success").css('display', 'inline-block');
            	$("#alert-danger").css('display', 'none');
        	} else {
            	alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
            	$("#alert-success").css('display', 'none');
            	$("#alert-danger").css('display', 'inline-block');
        		}
    		}
		});
		
	</script>
	<!-- check box 값을 화면에 뿌려준다. -->
 	<script type="text/javascript">
    //배열 정보 가져오기
        function checkbox_value(val) 
        {
            var selectMail = document.getElementById('mail2'); // select 아이디를 가져온다.
            for (i = 0, j = selectMail.length; i < j; i++)  // select 하단 option 수만큼 반복문 돌린다.
            {
                if (selectMail.options[i].value == val)  // 입력된값과 option의 value가 같은지 비교
                {
                    selectMail.options[i].selected = true; // 같은경우라면 체크되도록 한다.
                    break;
                }
            }
        }
    </script>
    <script>

    var tmp = $("input:radio[name=mem_gender]:checked").val();

    alert(tmp);
    </script>

</body>
</html>