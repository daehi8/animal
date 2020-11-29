<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
  	<meta charset="UTF-8">
  	<title>Search_Complete_Password</title>
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
	<div class="">
		<div class="">
			<font class="">비밀번호를 찾았습니다.</font>
		</div>						
			<div class="">
				<hr class="">
					<div class="">
					<strong><%="mem_name"%></strong>&nbsp;님의 비밀번호는&nbsp;
					<!--<strong>${fn:substring(mem_password,0,3)}
					<c:forEach begin ="1" end=${fn:length(mem_password)-3)">
						*
					</c:forEach></strong>입니다</font>-->
					<%="mem_password"%> 입니다
					</div>
				</div>
				<div class="">
					<font class="font3">비밀번호를 찾으시려면&nbsp;<strong>비밀번호 찾기</strong>&nbsp;
								버틀을 이용해주세요.</font>
				</div>
				<div class="">
					<div class="">
						<span>
							<input class="btn1" type="button" value="홈으로" onclick="location.href = 'Main_Form.jsp'">
							<input class="btn1" type="button" value="로그인" onclick="location.href = 'Login.jsp'">  
    						<input class="btn1" type="button" value="비밀번호 찾기" onclick="location.href = 'Search_All_Password.jsp'">
						</span>
					</div>
				</div>
			</div>
	</body>