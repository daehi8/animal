<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
  	<meta charset="UTF-8">
  	<title>Search_Complete_Id</title>
  	<link rel="stylesheet" type="text/css" href="css/stylesheet.css">
  	<script type="text/javaScript" src="css/stylesheet.css"></script>
  	
	<Style>
	.table1{width:450px;height:250px;border:1px solid silver;background:white;margin:auto;}
	.table2{width:100%;height:90%;border:1px solid silver;background:white;margin:auto;}
	.btn1{border:1px solid silver;border-top-right-radius:5px;border-bottom-right-radius:5px;
			border-top-left-radius:5px;border-bottom-left-radius:5px;font-size:15px;font-weight:bold;
			color:black;text-align:center;background-color:white;width:80pt;height:30pt;margin:auto;}
	.btn2{border:1px solid silver;border-top-right-radius:5px;border-bottom-right-radius:5px;
			border-top-left-radius:5px;border-bottom-left-radius:5px;font-size:10px;font-weight:bold;
			color:black;text-align:center;background-color:white;width:50pt;height:50pt;margin:auto;}
	.font1{color:black;font-size:30px;text-align:center;font-weight:bold;}
	.font2{color:black;font-size:15px;text-align:center;font-weight:nomal;}
	.font3{color:grey;font-size:10px;text-align:center;font-weight:nomal;}
 	.textarea1{width:90%;height:80%;rows:10;cols:80;resize:none;readonly:readonly disabled
	}
 </Style>
</head>
 
<body>
	<table class="table1">
		<tr>
			<td>
				<table class="table2" border="1">
					<tr>
						<td align="center">
							<font class=font2>아이디를 찾았습니다.</font>
						</td>
					</tr>
					<tr>
						<td align="center">
							<img style ="width:150px; height:100px" src="images\dog2.gif" alt="">
						</td>
					</tr>
					<tr>
						<td align="center">
							<hr style= width:90% align="center" color="silver">
							<font class="font2"><strong><%="user_name"%></strong>&nbsp;님의 아이디는&nbsp;
								<strong><%="mem_id"%></strong>&nbsp;입니다.</font><br>
								<font class="font3">비밀번호를 찾으시려면&nbsp;<strong>비밀번호 찾기</strong>&nbsp;버틀을 이용해주세요.</font>
						</td>
					</tr>
					<tr>
						<td align="center">
							<input class="btn1" type="button" value="홈으로" onclick="location.href = '/animal/form.member/loginMainForm.jsp'">
							<input class="btn1" type="button" value="로그인" onclick="location.href = '/animal/form.member/loginMainForm.jsp'">  
    						<input class="btn1" type="button" value="비밀번호 찾기" onclick="location.href = '/animal/form.popup/findPassword.jsp'">
						</td>
					</tr>
				</table>
			</td>
		</tr>
</table>
</body>	