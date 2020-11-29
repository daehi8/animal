<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	
<meta charset="EUC-KR">
<title>registerTermsEnterpriseForm</title>
<link href="/animal/css/style.css" rel="stylesheet">

<script type="text/javascript" src="/cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>

		<script type="text/javascript">
    	function CheckForm(){
	        //üũ�ڽ� üũ���� Ȯ��
	        var chk1=document.register.terms_use.checked;
	        var chk2=document.register.terms_privacy.checked;
	        
	        if(!chk1){
	            alert('(�ʼ�)�̿����� ������ �ּ���');
	            return false;
	        } 
	        if(!chk2) {
	            alert('(�ʼ�)�������� ���� �� �̿뿡 ������ �ּ���');
	            return false;
	        }
		}
	</script>
	
	<script type="text/javascript">
	
	$(document).ready(function(){
	    //�ֻ�� üũ�ڽ� Ŭ��
	    $("#check_all").click(function(){
	        //Ŭ���Ǿ�����
	        if($("#check_all").prop("checked")){//input�±��� name�� chk�� �±׵��� ã�Ƽ� checked�ɼ��� true�� ����
	            $("input[name=terms_use]").prop("checked",true);
	            $("input[name=terms_privacy]").prop("checked",true);
	            $("input[name=terms_sns]").prop("checked",true);
	            $("input[name=terms_email]").prop("checked",true);
	            //Ŭ���� �ȵ�������
	        }else{
	            //input�±��� name�� chk�� �±׵��� ã�Ƽ� checked�ɼ��� false�� ����
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
			<font class="font1">&nbsp;&nbsp;ȸ������</font>
		</div><br>
		<div class="">
			<font color="grey">&nbsp;&nbsp;01����&nbsp;></font>
      		<font color="red">&nbsp;&nbsp;02�������&nbsp;></font>
       		<font color="grey">&nbsp;&nbsp;03�����Է�&nbsp;></font>
       		<font color="grey">&nbsp;&nbsp;04���ԿϷ�&nbsp;&nbsp;</font>
		</div>
		<div>
			<font class="">Project_Animal�� �ʼ������ ��� �����ϼž� ȸ�������� �����մϴ�.</font>
		</div>
		</div>
		<div>
		<form name="register" method="post" action="/animal/form.member/registerEnterpriseForm.jsp" onSubmit="return CheckForm()">

			<table class="" >
				<tr>
					<td class="" colspan="2" >
						<textarea class="textarea1" readonly="readonly" disabled>
							����
   						</textarea><br>
   					</td>
   				<tr>
   					<td colspan="1" width="70%" height="5%" align="left">
   						<input type="checkbox" class="normal" name="terms_use" value="Y" />���� : (�ʼ�) �̿���
   					</td>
   					<td>
   						<input type="button" value="��ü����" onclick="window.open('/animal/form.popup/termsMember.jsp','window_name','width=600,height=600,location=no,status=no,scrollbars=yes');" />
					</td>
				</tr>
				<tr>
					<td class="" colspan="2" >
   			   			<textarea class="textarea1" readonly="readonly" disabled>
   			   				����
   			   			</textarea><br>
   			   		</td>
   			   	</tr>
   			   	<tr>
   			   		<td>
   						<input  class="" type="checkbox" name="terms_privacy" value="Y"/>���� : (�ʼ�) �������� ���� �� �̿�
   					</td>
   					<td>
   						<input type="button" value="��ü����" onclick="window.open('/animal/form.popup/termsMember.jsp','window_name','width=600,height=600,location=no,status=no,scrollbars=yes');" />
					</td>
				</tr>
				<tr>
					<td>
   						<input class="" type="checkbox"  name="terms_sns" value="Y"/>���� : (�ʼ�) SNS ����
   					</td>
   					<td>
   						<input type="button" value="��ü����" onclick="window.open('/animal/form.popup/termsMember.jsp','window_name','width=600,height=600,location=no,status=no,scrollbars=yes');" />
					</td>
				</tr>
				<tr>
					<td>
   						<input class="" type="checkbox" name="terms_email" value="Y"/>���� : (�ʼ�) �̸��� ����
   					</td>
   					<td>
   						<input type="button" value="��ü����" onclick="window.open('/animal/form.popup/termsMember.jsp','window_name','width=600,height=600,location=no,status=no,scrollbars=yes');" />
					</td>
				</tr>
				<tr>
					<td class="" colspan="2">
						<hr class="">
							<input type="checkbox" id="check_all" name="check_all">��ü����
							<br><br>
							<input type="button" class="" value="Ȩ����" onClick="location.href='/animal/form.member/loginMainForm.jsp'">
    						<input class="" name="next_stage" name="next_stage" type="submit" value="�����ܰ�" onSubmit="return CheckForm()"/>
					</td>
				</tr>	
			</table>
		</form>
	</div>
</body>
</html>

