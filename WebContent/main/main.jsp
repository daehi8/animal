<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch07.logon.logonDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ani.Pboard.PboardDTO" %>
<%@ page import="ani.Pboard.AnimalDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Animal 유기동물보호소</title>

</head>
<%
	request.setCharacterEncoding("UTF-8");
	String sessionId = (String)session.getAttribute("memId");
	
	if("admin".equals(sessionId)){
		
	}
	
	logonDAO dao = logonDAO.getInstance();//공식 instance 로 했을떄는 이렇게
	boolean birth = dao.myBirth(sessionId);
	if(birth == true){
%>
	<script type="text/javascript">
			window.open("birthdayPop.jsp","popup01","width=760,height=350");
	</script>
	<%}%>

<body>
<jsp:include page="/_comm/_head.jsp"></jsp:include>
<style>
div.img-wrap {
	width:300px;
	height:300px;
	overflow:hidden;
	display:inline-block;
	
}
div.img-wrap > img {
	width: 100%;
	height: auto;
	margin-left: 0px; 
	margin-top: -27px;

}

/* 사용자 제품 리스트 */
ul.grid {
	padding:0 0 0 0;
	margin:0 0 0 0;
	display: block;
	text-align:center;
	
}
ul.grid > li {
	margin:0 0 0 0;
	padding:10px;
	display: inline-block;
	vertical-align:top;
	list-style: none;
	text-align:center;
	
}
ul.grid > li:hover {
	background-color:#e5e5e5;
	
}
ul.grid > li:hover > a > div {
	opacity:0.5;
	
}
ul.grid > li:hover:after{
	
	content: "자세히 보기"

}
ul.grid > li > a > div {
	width: 217px; 
	height: 217px; 
	overflow: hidden;
	
}
ul.spec {
	width:100%;
	padding-left:0px;
}
ul.spec > li {
	padding:0 0 0 0;
	margin:0 0 0 0;
	list-style: none;
}
ul.spec > li > span.custom {
	padding:0 0 0 0;
}


/* Pagination */
/* footer */
ul.footer {
	display: table;
	width: 100%;
}
ul.footer > li {
	display: table-cell;
}
ul.footer > li:first-child {
	text-align:left;
}

ul.footer > li:last-child {
	text-align:right;
}
table + .pagination{margin-top:40px;}
ul.footer {list-style:none;}
ul.footer > li {list-style:none;}
ul.footer > li > div.pagination{position:relative;z-index:2;width:800px;margin:0 auto;font-size:0;text-align:center;}
ul.footer > li > div.pagination a{display:inline-block;height:34px;font-size:1.0rem;line-height:34px;vertical-align:top;text-decoration:none;}
ul.footer > li > div.pagination > a + a{margin-left:5px;}
ul.footer > li > div.pagination .num{margin:0 40px;}
ul.footer > li > div.pagination .num > a{border:none;width:auto;color:#555555;}
ul.footer > li > div.pagination .num > a.is-active{color:#f2551e;}
ul.footer > li > div.pagination .num > a + a{margin-left:25px;}
ul.footer > li > div.pagination > a[class^="btn-"]{overflow:hidden;width:34px;text-indent:100%;background-image:url(/_img/common.png);white-space:nowrap;border:1px solid #ccc;}
ul.footer > li > div.pagination > a[class^="btn-"]:before{overflow:hidden;width:34px;text-indent:100%;background-image:url(/_img/common.png);white-space:nowrap;border:1px solid #ccc;}
ul.footer > li > div.pagination .btn-first,
ul.footer > li > div.pagination .btn-last{background-position:0 -43px;}
ul.footer > li > div.pagination .btn-prev,
ul.footer > li > div.pagination .btn-next{background-position:-34px -43px;}
ul.footer > li > div.pagination .btn-next,
ul.footer > li > div.pagination .btn-last{transform:rotate(180deg);}

p{
	text-align:center;

}

.container{
align : center;
color: white;
position:relative
}

.centered 
{
vertical-align: middle;
position: absolute;
top: 50%;
left: 50%;
transform: translate(-50%, -50%);
font-size: 3rem;
color: white;
z-index: 2;
} 

/* 컨테이너 
#index_01{ 
width: 1200px; 
height: 400px; 
border: 1px solid dimgrey; 
margin: 0 auto; 
} */ 

/* #header1{ 
height: 100px; 
border-bottom: 1px solid dimgrey; 
box-sizing: border-box; 
text-align: center; 
line-height: 100px; 
font-size: 1.5rem; 
}  */

#mySlides{ 
height: 300px; 
overflow: hidden; 
border-bottom: 1px solid dimgrey; 
} 

/* #slide1>ul{ 
width: 3600px; 
font-size: 0; 
} 

#slide1>ul>li{ 
display: inline-block; 
font-size: 0; 
}
 */



</style>
<script>

function $makeRect(iObj) {

	var div = iObj.parentNode; 
	var img = iObj; 
	var divAspect = 1;
	var imgAspect = img.height / img.width;

	if (imgAspect <= divAspect) {
		var imgWidthActual = div.offsetHeight / imgAspect;
		var imgWidthToBe = div.offsetHeight / divAspect;
		var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2);
		img.style.cssText = 'width: auto; height: 100%; margin-left: '
						  + marginLeft + 'px;'
	} else {
		
		var imgHeightActual = div.offsetWidth / imgAspect;
		var imgHeightToBe = div.offsetWidth / divAspect;
		var marginTop = Math.round((imgHeightActual - imgHeightToBe) / 2);

		img.style.cssText = 'height: 100%; height: auto; margin-left: 0; margin-top: '
						  + marginTop + 'px;';
	}
}

	
	/* var myIndex = 0;
	carousel();
	
	function carousel() {
	    var i;
	    var x = document.getElementsByClassName("mySlides");
	    for (i = 0; i < x.length; i++) {
	       x[i].style.display = "none";  
	    }
	    myIndex++;
	    if (myIndex > x.length) {myIndex = 1}    
	    x[myIndex-1].style.display = "block";  
	    setTimeout(carousel, 2000); // Change image every 2 seconds
	} */

</script>
<%
	String city = (request.getParameter("city") == null ? "" : request.getParameter("city"));//선택한 도시 가져오기
	String kind = (request.getParameter("kind") == null ? "" : request.getParameter("kind"));
	String np = (request.getParameter("np") == null ? "1" : request.getParameter("np"));
	String nb = (request.getParameter("nb") == null ? "1" : request.getParameter("nb"));
	String readcount = (request.getParameter("readcount") == null ? "" : request.getParameter("readcount"));//선택한 도시 가져오기
%>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<!-- 메인 슬라이드 -->
	
	<div class="container" align="center">
	  <img class="mySlides" src="/animal/save/main.jpg" style="width:1200px; height: 700px;">
	  	<div class="centered">
	  	<p>운영시간</p>
	  	<p>AM 11 ~ PM 8</p>
	  	<p>주말 및 공휴일은</p>
	  	<p>휴일입니다.</p>
	  	<a class="more-btn" href="/animal/main/cityMap.jsp">오시는 방법</a>
	  	</div>
	  	
	  <img class="mySlides" src="/animal/save/dog.jpg" style="width:1200px; height: 700px;">
	  	<div class="centered"></div>
	  	
	  <img class="mySlides" src="/animal/save/cat.jpg" style="width:1200px; height: 700px;">
	  	<div class="centered"></div>
	  	
	  <img class="mySlides" src="/animal/save/강아지1.jpg" style="width:1200px; height: 700px;">
	  	<div class="centered"></div>
	  	
	</div>
	<script type="text/javascript">
	
	</script>
	
	
	<!-- 메인 슬라이드 끝
	<div class="container" align="center">
		<img src="/animal/save/main.jpg" alt="Dog" style="width:100%;">
		<div class="centered">Centered</div>
	</div>
	 -->
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<script>
		var myIndex = 0;
		carousel();
		
		function carousel() {
		    var i;
		    var x = document.getElementsByClassName("mySlides");
		    for (i = 0; i < x.length; i++) {
		       x[i].style.display = "none";  
		    }
		    myIndex++;
		    if (myIndex > x.length) {myIndex = 1}    
		    x[myIndex-1].style.display = "block";  
		    setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>
	</script>
	<h2><center>새로운 가족을 소개합니다.</center></h2>
	<ul class="grid" >
<%
	AnimalDAO pix = AnimalDAO.getInstance();
	ArrayList list = pix.selectpix(readcount, city, kind, np, nb);
	
	
	PboardDTO dto1 = (PboardDTO)list.get(0);
	
	
	
	
	
	String tCnt = dto1.gettCnt();
	String tPage = dto1.gettPage();
	String tBlock = dto1.gettBlock();
	if(list.size() > 0){
		for(int i = 1; i < list.size(); i++){
		PboardDTO dto = (PboardDTO)list.get(i);
		
	
	%>
	

	
	<li>
	<a href = "/animal/anipboard/detail.jsp?no=<%=dto.getNo()%>" >
	<div class="img-wrap" style="cursor:pointer; ">
	<img alt = "" src = "/animal/save/<%=dto.getImg()%>" onload="$makeRect(this)" >
	
	</div>
	</a><p>
	<b>이름: <%= dto.getName()%> </b><br>
	<b>지역: <%= dto.getCity()%> </b></p>
		<% if(dto.getReadcount() == null){%>
		<b>조회수: <%=0%> </b>
		<%}else{ %>
	<b>조회수: <%= dto.getReadcount()%> </b></p>
	<%} %>
	</li>


	
	
	
	
	
			<%}
		}
		
	%>
<p>
	<a href = "/animal/anipboard/list.jsp" style="color:black;">더 보러가기</a>
	</p>




	
	
<jsp:include page="/_comm/_tail.jsp"></jsp:include>
</body>
</html>