<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ani.Pboard.PboardDTO" %>
<%@ page import="ani.Pboard.AnimalDAO" %>

<jsp:include page="../_comm/_head.jsp"></jsp:include>


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
</script>
	
<%--
<input style="display:scroll;position:fixed;bottom:20px;right:10px;" type="image" src="../save/up.jpg" onClick="javascript:window.scrollTo(0,0)" alt="맨위로" />
 --%>




<%
	// request 설
	request.setCharacterEncoding("UTF-8");
	String city = (request.getParameter("city") == null ? "" : request.getParameter("city"));//선택한 도시 가져오기
	String kind = (request.getParameter("kind") == null ? "" : request.getParameter("kind"));
	String np = (request.getParameter("np") == null ? "1" : request.getParameter("np"));
	String nb = (request.getParameter("nb") == null ? "1" : request.getParameter("nb"));
	String readcount = (request.getParameter("readcount") == null ? "" : request.getParameter("readcount"));//선택한 도시 가져오기
	
	
%>
<form align="right" name= "form" method="post" action="list.jsp">
지역분류 <select id="city" name="city" value="<%=city%>">
		<option value="">- 선택 -</option>
		<option value="서울" >서울</option>
		<option value="경기" >경기</option>
		<option value="경상" >경상</option>
		<option value="전라" >전라</option>
		<option value="충청" >충청</option>
		
	</select>
동물분류 <select id="kind" name="kind" value="<%=kind%>">
		<option value="">- 선택 -</option>
		<option value="고양이" >고양이</option>
		<option value="강아지" >강아지</option>
	</select>

	

	<a href="list.jsp">전체보기</a>
	<button type="button" onclick="search();">검색</button>
	
<%
	String sessionId = (String)session.getAttribute("memId");
	if(sessionId != null){
		if ("admin".equals(sessionId)){
%>		
	<button type="button" onclick="location.href='write.jsp'">글쓰기</button>
		<%}%>
	<%}%>
</form>

<script>
var city = "<%=city%>";
var kind = "<%=kind%>";
var np = "<%=np%>";
var nb = "<%=nb%>";




document.getElementById("city").value = "<%=city%>";
document.getElementById("kind").value = "<%=kind%>";



function search() {
	
	document.location.href = "./list.jsp?city=" + document.getElementById("city").value + "&kind=" + document.getElementById("kind").value  +"&np=" + this.np  + "&nb=" + this.nb;
	
				
}


</script>
<ul class="grid">
<%
	AnimalDAO dao = AnimalDAO.getInstance();
	ArrayList list = dao.selectAll(readcount, city, kind, np, nb);
	
	
	PboardDTO dto1 = (PboardDTO)list.get(0);
	
	
	
	
	
	String tCnt = dto1.gettCnt();
	String tPage = dto1.gettPage();
	String tBlock = dto1.gettBlock();
	if(list.size() > 0){
		for(int i = 1; i < list.size(); i++){
		PboardDTO dto = (PboardDTO)list.get(i);
		
	
	%>
	<li>
	<a href = "detail.jsp?no=<%=dto.getNo()%>" >
	<div class="img-wrap" style="cursor:pointer;">
	<img alt = "" src = "/animal/save/<%=dto.getImg()%>" onload="$makeRect(this)" >
	
	</div>
	</a><p>
	<b>이름: <%= dto.getName()%> </b><br>
	<b>지역: <%= dto.getCity()%> </b></p>
	<% if(dto.getReadcount() == null){%>
	<b>조회수: <%= 0%> </b>
	<%}else{ %>
	<b>조회수: <%= dto.getReadcount()%> </b></p>
	<%} %>
	</li>


	
	
	
	
	
			<%}
		}
		
	%>
	
<ul class="footer">
	<li><strong id="st_tCnt">총게시물 <%=tCnt%>건</strong></li>
	<li><div class="pagination" id="div_navi"></div></li>
	<li></li>
</ul>
<script>
var tCnt = <%=tCnt%>;
var tPage = <%=tPage%>;
var tBlock = <%=tBlock%>;



 
	var np = <%=np%>;
	var nb = <%=nb%>;
	var ig_ppb = 5;
	var ig_lpp = 21;
	var html_paging = "";
	if (this.nb > 1) html_paging += "<a href=\"\" class=\"btn-first\" onclick=\"javascript:goPage(1, 1);return false;\">처음</a>";
	if (this.nb > 1) html_paging += "<a href=\"\" class=\"btn-prev\" onclick=\"javascript:goPage(" + ((this.nb-1)*this.ig_ppb) + ", " + (this.nb-1) + ");return false;\">이전</a>";
	html_paging += "<span class=\"num\">";
	var i_sP = (this.nb-1)*this.ig_ppb + 1;
	var i_eP = i_sP + this.ig_ppb;
	if (this.tCnt > 0 && this.tPage > 1) {
		for (var i=i_sP; i<i_eP; i++) {
			if (i == this.np) html_paging += "<a href=\"\" class=\"is-active\">" + i + "</a>";
			else html_paging += "<a href=\"\" onclick=\"javascript:goPage(" + i + ", " + this.nb + ");return false;\">" + i + "</a>";
			if (i == this.tPage) break;
		} 
	}
	html_paging += "</span>";
	if (this.nb < this.tBlock) html_paging += "<a href=\"\" class=\"btn-next\" onclick=\"javascript:goPage(" + ((this.nb)*this.ig_ppb + 1) + ", " + (this.nb+1) + ");return false;\">다음</a>";
	if (this.nb < this.tBlock) html_paging += "<a href=\"\" class=\"btn-last\" onclick=\"javascript:goPage(" + this.tPage + ", " + this.tBlock + ");return false;\">마지막</a>"; // 마지막 페이지 번호는 this.tPage
	document.getElementById("div_navi").innerHTML = html_paging;


function goPage(np, nb) {
	
	document.location.href = "./list.jsp?city=" + this.city + "&kind=" + this.kind  + "&np=" + np  + "&nb=" + nb;
	
	
}
</script>






<jsp:include page="../_comm/_tail.jsp"></jsp:include>
