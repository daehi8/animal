<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<style>
		footer{
  			text-align: left;
 			background: white;
		}
		
		#footer {
    	padding: 25px 0px;
    	width: 100%;
    	background: #39373a;
    	color: #fff;
		}
		
		footer > h1 {
			font-size : 16px;
		}
		.footer-menu {
    	text-align: center;
    	margin-bottom: 10px;
    	}
		
		dl, ul, ol, menu, li {
    	list-style: none;  
		}
		
		.back-to-top {
	    width: 40px;
	    height: 40px;
	    position: fixed;
	    bottom: 10px;
	    right: 20px;
	    display: none;
	    text-align: center;
	    z-index: 10000;
	    -webkit-border-radius: 50%;
	    -moz-border-radius: 50%;
	    border-radius: 50%;
	    background: #27353d;
	   
	    }
	    
	</style>
</head>
<footer>
  	<br>
  	<h1>전체 방문자 : <%=session.getAttribute("allCount") %></h1>
 	<h1>오늘 방문자 : <%=session.getAttribute("dayCount") %></h1>
	<br>
</footer>
<footer id ="footer">
        <div class = "footer-area">
	        <ul class="footer-menu">
				<li><a href="/?act=info.provision" style="color:white;">이용약관 |</a>
				<a href="/?act=info.privacy" style="color:white;">개인정보취급방침 |</a>
				<a href="/?act=info.no_email_collect" style="color:white;">이메일주소무단수집거부</a>
			</ul>
	        <p class="footer-info" align="center">
	       		 서울특별시 관악구 남부순환로 1820
	        	<span> | </span>
	       		 전화 : 02-6020-0055
	        	 <span> | </span>
	       		 팩스 : 02-3285-0012
	         	<span> | </span>
	      		 사업자등록번호 : 119-81-85582 
	         	<span> | </span>
	        	대표 : 김민윤최홍
	        </p>
        	<p align="center">
        	<small> Copyright © 2020, Seoul Project Animal Center All rights reserved. This ist a nonprofit site.</small> 
         	</p>
        </div>
</footer>
    <input style="display:scroll;position:fixed;bottom:20px;right:10px;" type="image" src="../save/pp.png" onClick="javascript:window.scrollTo(0,0)" alt="맨위로" />

