<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="euc-kr" lang="euc-kr">
<!-- <link rel="stylesheet" href="/animal/css/member.css"> -->
<head>
<title>TermsEnterprise</title>

	
	<style type="text/css">
	*{margin:0;padding:0;}
	#container{width:400px;margin:50px auto;}	
	ul.tab{padding:0;}
	ul.tab li{list-style-type:none;width:100px;height:40px;float:left;}
	ul.tab li a{outline:none;display:block;border:1px solid silver;border-top-right-radius:5px;
	border-bottom-right-radius:5px;border-top-left-radius:5px;border-bottom-left-radius:5px;
	color:black;line-height:40px;text-align:center;background-color:white;}
	ul.tab li a.selected{text-decoration:none;border:1px solid silver;font-weight: bold;color:balck;cursor:default;}
	ul.panel{clear:both;border:1px solid silver;border-top:none;padding:0;}
	ul.panel li{list-style-type:none;padding:10px;text-indent:1em;color:orange;border:1px solid silver;}
	.table1{width:380px;height:580px;border:1px solid silver;background:white;margin:auto;}
	.table2{width:90%;height:90%;border:1px solid silver;background:white;margin:auto;}
	.font1{color:black;font-size:15px;text-align:center;font-weight:bold;}
	.font2{color:black;font-size:10px;text-align:center;font-weight:nomal;}
	.btn1{border:1px solid silver;border-top-right-radius:5px;border-bottom-right-radius:5px;border-top-left-radius:5px;border-bottom-left-radius:5px;
			font-size:10px;font-weight:bold;color:white;text-align:center;background-color:white;width:60pt;height:20pt;}

</style>
	</head>
	<body>
		<div class="container">
			<ul class="tab">
				<li><a href="#tab1"><small>이용약관</small></a></li>
				<li><a href="#tab2"><small>개인정보수집</small></a></li>
				<li><a href="#tab3"><small>SNS수신</small></a></li>
				<li><a href="#tab4"><small>이메일수신</small></a></li>
			</ul>
			<ul class="panel">
				<li id="tab1">	
				<table class="">
					<tr>
						<td class=""><font class="">이용약관</font>
						</td>
					</tr>
					<tr>
						<td class=""><font class="">
						내
						용
						</font></td>
						</tr>
						<tr>
							<td class="">
							<hr class="">
								<button onClick='self.close()'>창닫기</button>
							</td>
						</tr>
				</table>
				</li>
				<li id="tab2">
				<table class="">
					<tr>
						<td class=""><font class="">개인정보수집</font>
						</td>
					</tr>
					<tr>
						<td class=""><font class="">
						내
						용
						</font></td>
						</tr>
						<tr>
							<td class="">
							<hr class="">
								<button onClick='self.close()'>창닫기</button>
							</td>
						</tr>
				</table>			
				</li>
				<li id="tab3">
				<table class="">
					<tr>
						<td class=""><font class="">SNS수신</font>
						</td>
					</tr>
					<tr>
						<td class=""><font class="">
						내
						용
						</font></td>
						</tr>
						<tr>
							<td class="">
							<hr class="">
								<button onClick='self.close()'>창닫기</button>
							</td>
						</tr>
				</table>
				</li>
				<li id="tab4">
				<table class="">
					<tr>
						<td class=""><font class="">이메일수신</font>
						</td>
					</tr>
					<tr>
						<td class=""><font class="">
						내
						용
						</font></td>
						</tr>
						<tr>
							<td class="">
							<hr class="">
								<button onClick='self.close()'>창닫기</button>
							</td>
						</tr>
				</table>
				</li>
			</ul>
		</div>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
		<script>
		//선택외 가리기
		$(function(){
		$("ul.panel li:not("+$("ul.tab li a.selected").attr("href")+")").hide();
		$("ul.tab li a").click(function(){
		$("ul.tab li a").removeClass("selected");
		$(this).addClass("selected");
		$("ul.panel li").slideUp("nomal");
		$($(this).attr("href")).slideDown("nomal");
		return false;
		});
	});
	</script>
	
	</body>
</html>