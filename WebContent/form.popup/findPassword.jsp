<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<?php header('Content-Type: text/html; charset=EUC-KR');?>
<html>
<head>
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
    <!--�� �޴� ���� -->
    <ul class="tabs">
        <li><a href="#tab1">��й�ȣ�Ϻ�</a></li>
        <!-- <li><a href="#tab2">�ڵ�������</a></li> -->
    </ul>

    <!--�� ������ ���� -->
    <div class="tab_container">
    <div class="">
    	<font class="font1">��й�ȣã��</font></div>
    	 <div class="">
    	<font><small>�������� Ȯ�� �� ��й�ȣ�� ������ �� �ֽ��ϴ�.</small></font></div>
        <div id="tab1" class="tab_content">
        <div class=""></div>
            <!--Content-->
 		<form name="find" method="post" action="/animal/pro.popup/findPasswordPro.jsp" onsubmit="return sendit();"> 
				<table class="table2" >
					<tr>
						<td width="25%">
							<font>&nbsp;���̵� :</font>
						</td>
						<td>
							<input type="text" id="mem_id" name="mem_id" size="20" maxlength="30" >
						</td>
					</tr>
					<tr>
						<td class="">
						 	<font>&nbsp;�̸��� :</font>
						</td>
						<td colspan="2" width="400px" >
                        		<input type="text" id="email1" name="email1" size="5" maxlength="40" >&nbsp;@
                        		<input type="text" id="email2"  name="email2" size="5" maxlength="20" disabled >
                        		<input type="hidden" id="email3" name="email3" />
                        	
                       				<select  name="emailselect">
                           			<option value="0">&nbsp;</option>
                            		<option value="1">�����Է�</option>
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
						<td>
						 	<font>&nbsp;�ڵ�����ȣ :</font>
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
                    		<!-- input������ ���ڷ�  -->
                        	<span>&nbsp;-&nbsp;</span><input type="text" name="tel2" size="4" maxlength="4" onkeypress='return checkNumber(event)'/>
                        	<span>&nbsp;-&nbsp;</span><input type="text" name="tel3" size="4" maxlength="4" onkeypress='return checkNumber(event)'/><br>
						</td>
					</tr>
						<tr>
						<!-- 			
							<td>
						 		<font>&nbsp;������ȣ :</font>
							</td>
								<td style="width:80%; height:8%;"align="left">
								<input type="text" id="verification_num" name="verification_Num">
								<input type="button" id="verification_num" name="verification_Num" value="����">
							</td> -->	
						</tr>
					<tr>
						<td colspan="2" style="width:90%; height:20%; text-align:center;">
							<hr style= width:90% align="center" color="silver">
							<input class="btn1" type="submit" value="��й�ȣã��">  	
						</td>
					</tr>
				</table>
 			</form>
        </div>
         <!-- 
        <div id="tab2" class="tab_content">
           Content
			<form name="find2" method="post" action="/animal/pro.popup/findIdPro2.jsp">
				<table class="table2" border="1">
					<tr>
						<td width="25%">
							<font>&nbsp;�̸� :</font>
						</td>
						<td>
							<input type="text" id="mem_name" name="mem_name" size="20" maxlength="30" >
						</td>
					</tr>
					<tr>				
						<td>
						 	<font>&nbsp;�ڵ�����ȣ :</font>
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
                    		input������ ���ڷ�  
                        	<span>&nbsp;-&nbsp;</span><input type="text" name="tel2" size="4" maxlength="4" />
                        	<span>&nbsp;-&nbsp;</span><input type="text" name="tel3" size="4" maxlength="4" /><br>
						</td>
					</tr>
					<tr>				
						<td>
						 	<font>&nbsp;������ȣ :</font>
						</td>
						<td style="width:80%; height:8%;"align="left">
							<input type="text" id="verification_num" name="verification_num">
							<input type="button" id="verification_numc" name="verification_numc" value="����">
						</td>
					</tr>
					<tr>
						<td colspan="2" style="width:90%; height:20%; text-align:center;">
							<hr style= width:90% align="center" color="silver">
							<input class="btn1" type="submit" value="���̵� ã��">  
    						<input class="btn1" type="button" value="�α���" onclick="location.href = '/animal/form.member/loginMainForm.jsp'">
    						<input class="btn1" type="button" value="��й�ȣ ã��" onclick="location.href = '/animal/form.popup/findPassword.jsp'">					
						</td>
					</tr>
				</table>
	         </form>
        </div>
    </div> -->
</div>
	<script>
    //���̵���� ��ȿ�� �˻�
	function sendit() {	
		var alpaBig= "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	    var alpaSmall= "abcdefghijklmnopqrstuvwxyz";
	    var num = "01234567890";
	  	//���̵� �Է¿���O
		if (document.find.mem_id.value == "") {
   			alert("���̵� �Է����� �ʾҽ��ϴ�.")
    		mem_id.focus();
    		return false;
		}
	   	//���̵� ���� ������� �ʱ�O
    	if (document.find.mem_id.value.indexOf(" ") >= 0) {
    	    alert("���̵� ������ ����� �� �����ϴ�.")
    	    document.find.mem_id.focus();
    	   	return false;
    	}
		//��й�ȣ �Է¿���O
		if (document.find.mem_password.value == "") {
   			alert("��й�ȣ�� �Է����� �ʾҽ��ϴ�.")
    		mem_password.focus();
    		return false;
		}
	   	//��й�ȣ�� ���� ������� �ʱ�O
    	if (document.find.mem_password.value.indexOf(" ") >= 0) {
    	    alert("��й�ȣ�� ������ ����� �� �����ϴ�.")
    	    document.find.mem_password.focus();
    	   	return false;
    	}
	
		//�̸��� �Է¿���O
		if (document.find.email1.value == "") {
   			alert("�̸����� �Է����ּ���.")
    		email1.focus();
    		return false;
		}
		if (document.find.email2.value == "") {
   			alert("�̸����� �Է����ּ���.")
    		email2.focus();
    		return false;
		}
		//�ڵ�����ȣ �Է¿���O
		if (document.find.tel1.value == "") {
   			alert("�ڵ�����ȣ ù��°�ڸ��� �Է����ּ���.")
    		tel1.focus();
    		return false;
		}
		if (document.find.tel2.value == "") {
   			alert("�ڵ�����ȣ �ι�°�ڸ��� �Է����ּ���.")
    		tel2.focus();
    		return false;
		}
		if (document.find.tel3.value == "") {
   			alert("�ڵ�����ȣ ����°�ڸ��� �Է����ּ���.")
    		tel3.focus();
    		return false;
		}
		if(document.find.tel2.value.length<4){
    		alert("4�� ���ڷ� �Է����ֽʽÿ�.")
    		document.find.tel2.focus();
    			return false;
		}
		if(document.find.tel3.value.length<4){
    		alert("4�� ���ڷ� �Է����ֽʽÿ�.")
    		document.find.tel3.focus();
    			return false;
		}
    	//���̵� ��ȿ�� �˻� (�����ҹ���, ���ڸ� ���)O
    	for (var i = 0; i < document.find.mem_id.value.length; i++) {
    	    ch = document.find.mem_id.value.charAt(i)
        	if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') &&! (ch >= 'A' && ch <= 'Z')) {
            	alert("���̵�� ���� ��ҹ���, ���ڸ� �Է°����մϴ�.")
        	    document.find.mem_id.focus();
            	return false;
        	}
    	}
    }
	</script>
	<!--�̸��� �����Է�-->
	<script>
		$(function(){	
			$(document).ready(function(){
				$('select[name=emailselect]').change(function() {
				//�����Ͻ�
					if($(this).val()=='1'){
						//�� �ʱ�ȭ
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