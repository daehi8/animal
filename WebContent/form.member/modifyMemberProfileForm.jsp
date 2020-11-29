<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="member.MemberDTO" %>
<%@ page import="member.MemberDAO" %>

<html>
<meta charset="UTF-8">
<head>
	<link href="/animal/css/style.css" rel="stylesheet">
	<%
		String id = session.getAttribute("memId").toString();
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = dao.memberViewProfile(id);
		System.out.print(id);
	%>

<title>Profile_Modify</title>
<style>
	.table1{width:350px;height:500px;border:1px solid silver;background:white;margin:auto;}
	.table2{width:98%;height:90%;border:1px solid silver;background:white;margin:auto;}
	.btn1{border:1px solid silver;border-top-right-radius:5px;border-bottom-right-radius:5px;
			border-top-left-radius:5px;border-bottom-left-radius:5px;font-size:15px;font-weight:bold;
			color:black;text-align:center;background-color:white;width:80pt;height:30pt;margin:auto;}
	.btn2{border:1px solid silver;border-top-right-radius:5px;border-bottom-right-radius:5px;
			border-top-left-radius:5px;border-bottom-left-radius:5px;font-size:10px;font-weight:bold;
			color:black;text-align:center;background-color:white;width:50pt;height:15pt;margin:auto;}
	.btn3{border:1px solid silver;border-top-right-radius:5px;border-bottom-right-radius:5px;
			border-top-left-radius:5px;border-bottom-left-radius:5px;font-size:15px;font-weight:bold;
			color:black;text-align:center;background-color:white;width:80pt;height:60pt;margin:auto;}
	.font1{color:black;font-size:25px;text-align:center;font-weight:bold;}
	.font2{color:black;font-size:20px;text-align:center;font-weight:nomal;}
	.font3{color:silver;font-size:15px;text-align:left;font-weight:nomal;}
 	.textarea1{width:90%;height:80%;rows:10;cols:80;resize:none;readonly:readonly disabled}
 	.textarea2{width:90%;height:80%;rows:10;cols:80;resize:none;
</style>
</head>
<script type="text/javascript">
function closeWin() {
    var nvua = navigator.userAgent;
    if (nvua.indexOf('MSIE') >= 0){
        if(nvua.indexOf('MSIE 5.0') == -1) {
            top.opener = '';
        }
    } else if (nvua.indexOf('Gecko') >= 0){
        top.name = 'CLOSE_WINDOW';
        wid = window.open('','CLOSE_WINDOW');
    }
    top.close();
}

function fileReset( form )
{
    //form.upload.select();   //upload라는 name을 가진 컨트롤 모두 선택됨.
	 //upload이름을 가진 컨트롤이 많은경우 그중에 하나만 초기화...
	var files = document.getElementsByName("modify_img");
   files[0].select(); // 첫번째 선택

   //선택된 컨트롤의 값 모두 삭제
   document.selection.clear; 
</script>
<script>
function fun1(){
        alert(document.images[0].src);
        alert(document.images[0].width);
        alert(document.images[0].height);
        alert(document.images[0].border);
        alert(document.images[0].name);
</script>

<jsp:include page="../_comm/_head.jsp"></jsp:include>
<body>
	<div class="">
		<div class="">
			<font class="">Project_Animal Profile</font>
			<div class="">
				<form method="post" enctype="multipart/form-data" action="/animal/pro.member/modifyProfilePro.jsp"> 
				<input type="hidden" name="mem_id" value="<%=id%>" />
					<table class="" border="">
						<tr>
							<td colspan="3">
								<font class=""><%=dto.getMem_id() %>님의 개인정보입니다.</font>
							</td>
						<tr>
							<td>
								<font>닉네임 :</font>
							</td>
							<td colspan="2">
								<input type="text" id="mem_nickname" name="mem_nicname" value="<%=dto.getMem_nickname() %>">
							</td>	
						</tr>
						<tr>
							<td>
								<font>프로필 :</font>
							</td>
							<td align="center">
								<img style ="width:120px; height:120px" id="mem_img" name="mem_img" 
									value="<%=dto.getMem_img() %>" src="project.animal.jsp" >
							</td>
								
							<td>
								<table class="" border="">
									<tr>
										<td align="center">
											<input class="" type="file" id="img_Select" name="img_Select" value="선택" >
										</td>
									</tr>
									<tr>
										<td class="">
											<input class="" type="button" value="변경" onclick="modify_img();">
										</td>
									</tr>
									<tr>
										<td align="center">
											<input class="btn1" type="button" value="취소" onclick="fileReset(this.form);">
										</td>
									</tr>
								</table>
							</td>		
						</tr>
						<tr>
							<td>
								<font>자기소개 :</font>
							</td>
								<td colspan="2" height="100" align="center">
									<textarea  class="textarea2" id="mem_intro" name="mem_intro" value="<%=dto.getMem_intro() %>">
                   					</textarea>			
								</td>	
						</tr>
						<tr>
							<td colspan="3" align="center">
								<hr class="">
									<input class="btn1" type="submit" value="확인">
									<input class="btn1" type="button" value="취소" onclick="window.open('','_self').close();">
							</td>	
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>