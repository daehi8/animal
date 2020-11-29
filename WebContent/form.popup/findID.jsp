<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<?php header('Content-Type: text/html; charset=EUC-KR');?>
<html>
<head>
<%@ page import="member.MemberDTO" %>
<%@ page import="member.MemberDAO" %>
<link rel="stylesheet" href="/animal/css/member.css">
<script type="text/javascript" src="Project_Ani/WebContent/js/checkemailaddy.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<style type="text/css">
        
  body {font-family:"Nanum Gothic";font-size: 0.8em;}
  ul.tabs {margin: 0;padding: 0;float: left;list-style: none;height: 32px;border-bottom: 1px solid #999;border-left: 1px solid #999;width: 100%;}
  ul.tabs li {float: left;margin: 0;padding: 0;height: 31px;line-height: 31px; border: 1px solid #999;border-left: none;
            margin-bottom: -1px; overflow: hidden; position: relative; background: #e0e0e0;}
  ul.tabs li a {text-decoration: none;color: #000;display: block;font-size: 1.2em;padding: 0 20px;border: 1px solid #fff;outline: none;}
  ul.tabs li a:hover {background: #ccc; }
  html ul.tabs li.active, html ul.tabs li.active a:hover  { background: #fff;border-bottom: 1px solid #fff;}
  .tab_container {border: 1px solid #999;border-top: none;overflow: hidden;clear: both;float: left; width: 100%;background: #fff;}
  .tab_content {padding: 20px;font-size: 1.2em; }
</style>

<% 
	//한글 인코딩
	request.setCharacterEncoding("UTF-8");

%>


<script>
   $(document).ready(function() {

   //When page loads...
   $(".tab_content").hide(); //Hide all content
   $("ul.tabs li:first").addClass("active").show(); //Activate first tab
   $(".tab_content:first").show(); //Show first tab content

   //On Click Event
   $("ul.tabs li").click(function() {
   $("ul.tabs li").removeClass("active"); //Remove any "active" class
   $(this).addClass("active"); //Add "active" class to selected tab
   $(".tab_content").hide(); //Hide all tab content

   var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
   $(activeTab).fadeIn(); //Fade in the active ID content
   return false;
   });
});
</script>
</head>
<body>

<div id="wrapper">
    <!--탭 메뉴 영역 -->
    <ul class="tabs">
        <li><a href="#tab1">이메일인증</a></li>
        <li><a href="#tab2">핸드폰인증</a></li>
    </ul>

    <!--탭 콘텐츠 영역 -->
    <div class="tab_container">
    <div class="">
    	<font class="font1">아이디찾기</font></div>
        <div id="tab1" class="tab_content">
            <!--Content-->
 		<form name="find1" method="post" action="/animal/pro.popup/findIdPro1.jsp" onsubmit="return sendit1();">  
				<table class="table2" >
					<tr>
						<td width="25%">
							<font>&nbsp;이름 :</font>
						</td>
						<td>
							<input type="text" id="mem_name" name="mem_name" size="20" maxlength="30" >
						</td>
					</tr>
					<tr>
						<td class="">
						 	<font>&nbsp;이메일 :</font>
						</td>
						<td colspan="2">
                        		<input type="text" id="email1" name="email1" size="5" maxlength="40" >&nbsp;@
                        		<input type="text" id="email2"  name="email2" size="5" maxlength="20" disabled >
                        		<input type="hidden" id="email3" name="email3" />
                        	
                       			<select  name="emailselect" required="required">
                           			<option value="0">&nbsp;</option>
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
						<!-- 
						<tr>				
							<td>
						 		<font>&nbsp;인증번호 :</font>
							</td>
								<td style="width:80%; height:8%;"align="left">
								<input type="text" id="verification_num" name="verification_Num">
								<input type="button" id="verification_num" name="verification_Num" value="인증">
							</td>
						</tr> -->
					<tr>
						<td colspan="2" style="width:90%; height:20%; text-align:center;">
							<hr style= width:90% align="center" color="silver">
							<input class="btn1" type="submit" value="아이디 찾기">  
    						<input class="btn1" type="button" value="비밀번호 찾기" onclick="location.href = '/animal/form.popup/findPassword.jsp'">			
						</td>
					</tr>
				</table>
 			</form>
        </div>
        <div id="tab2" class="tab_content">
           <!--Content-->
			<form name="find2" method="post" action="/animal/pro.popup/findIdPro2.jsp" onsubmit="return sendit2();"> 
				<table class="table2" >
					<tr>
						<td width="25%">
							<font>&nbsp;이름 :</font>
						</td>
						<td>
							<input type="text" id="mem_name" name="mem_name" size="20" maxlength="30" >
						</td>
					</tr>
					<tr>				
						<td>
						 	<font>&nbsp;핸드폰번호 :</font>
						</td>
						<td style="width:80%; height:8%;"align="left">
							<select name="tel1" class="" title="tel1">
                        	<option value="010">010</option>
                        	<option value="011">011</option>
                        	<option value="016">016</option>
                        	<option value="017">017</option>
                        	<option value="018">018</option>
                        	<option value="019">019</option>
                    		</select>
                    		<!-- input설정을 숫자로  -->
                        	<span>&nbsp;-&nbsp;</span><input type="text" name="tel2" size="4" maxlength="4" onkeypress='return checkNumber(event)'/>
                        	<span>&nbsp;-&nbsp;</span><input type="text" name="tel3" size="4" maxlength="4" onkeypress='return checkNumber(event)'/><br>
						</td>
					</tr>
					<tr>
					<!-- 			
						<td>
						 	<font>&nbsp;인증번호 :</font>
						</td>
						<td style="width:80%; height:8%;"align="left">
							<input type="text" id="verification_num" name="verification_num">
							<input type="button" id="verification_numc" name="verification_numc" value="인증">
						</td>
					</tr> -->	
					<tr>
						<td colspan="2" style="width:90%; height:20%; text-align:center;">
							<hr style= width:90% align="center" color="silver">
							<input class="btn1" type="submit" value="아이디 찾기">  
    						<input class="btn1" type="button" value="비밀번호 찾기" onclick="location.href = '/animal/form.popup/findPassword.jsp'">					
						</td>
					</tr>
				</table>
	         </form>
        </div>
    </div>
</div>
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
	<script>
	function sendit1() {	
		var alpaBig= "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	    var alpaSmall= "abcdefghijklmnopqrstuvwxyz";
	    var num = "01234567890";

		//이메일 입력여부
		if (document.find1.email1.value == "") {
   			alert("이메일을 입력하지 않았습니다.")
    		email1.focus();
    		return false;
		}
		if (document.find1.email2.value == "") {
   			alert("이메일을 입력하지 않았습니다.")
    		email2.focus();
    		return false;
		}
	  	//이름 입력여부
		if (document.find1.mem_name.value == "") {
   			alert("이름을 입력하지 않았습니다.")
    		mem_name.focus();
    		return false;
		}
    }
	</script>
	<script>
	function sendit2() {	
		var alpaBig= "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	    var alpaSmall= "abcdefghijklmnopqrstuvwxyz";
	    var num = "01234567890";

	  	//이름 입력여부
		if (document.find2.mem_name.value == "") {
   			alert("이름을 입력하지 않았습니다.")
    		mem_name.focus();
    		return false;
		}
    	
		//핸드폰번호 입력여부O
		if (document.find2.tel1.value == "") {
   			alert("핸드폰번호 첫번째자리를 입력해주세요.")
    		tel1.focus();
    		return false;
		}
		if (document.find2.tel2.value == "") {
   			alert("핸드폰번호 두번째자리를 입력해주세요.")
    		tel2.focus();
    		return false;
		}
		if (document.find2.tel3.value == "") {
   			alert("핸드폰번호 세번째자리를 입력해주세요.")
    		tel3.focus();
    		return false;
		}
		if(document.find2.tel2.value.length<4){
    		alert("4자 숫자로 입력해주십시오.")
    		document.find2.tel2.focus();
    			return false;
		}
		if(document.find2.tel3.value.length<4){
    		alert("4자 숫자로 입력해주십시오.")
    		document.find2.tel3.focus();
    			return false;
		}
    }
	</script>
	<!-- 숫자만 입력하도록함 -->
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
</body>
</html>