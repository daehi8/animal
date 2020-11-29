<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ani.Pboard.AnimalDAO" %>
<%@ page import="ani.Pboard.PboardDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<jsp:include page="../_comm/_head.jsp"></jsp:include>
<style>
button.act{
  height:100%;
}
body{
  text-align:center;
}
body:before{
  content:'';
  height:100%;
  display:inline-block;
  vertical-align:middle;
}
button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:40px;
  font-size:0.8em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}


</style>

<%
	
	
	AnimalDAO dao = AnimalDAO.getInstance(); //겟인스턴스로 객체생성
	String no=request.getParameter("no");//리퀘스트로 no값받고 String화시켜줌
	
	 
	PboardDTO dto = dao.getanimal(no); //메서드 실행(게시물 상세보기)
	PboardDTO dTo = dao.getReadcount(no);//메서드 실행(조회수)
	
	String sessionId = (String)session.getAttribute("memId");
	
	%>
<br>
<br>
<br>
<br>
<br>

<table align="center">
  <tr>
  <td>조회수 : <%=dTo.getReadcount() %></td>
  </tr>
  <tr>
    <td><img style="max-width:700px;max-height:700px;" alt = "" src = "/animal/save/<%=dto.getImg()%>"></td>
  </tr>
  <tr>
  <td>이름: <%=dto.getName() %></td>
  </tr>
  <tr>
  <td>지역: <%=dto.getCity() %></td>
  </tr>
  <tr>
  	<td><pre>소개합니다!!!!<br><%=dto.getMenual()%></pre></td>
	</tr> 
		
</table>



<div class="act" align="right">

<button onclick="document.location.href='/animal/product/pocketPro.jsp?id=<%=sessionId%>&no=<%=no%>'">관심주기</button>
<button onclick="document.location.href='/animal/product/buyPro.jsp?id=<%=sessionId%>&name=<%=dto.getName()%>&city=<%=dto.getCity()%>'">분양신청</button>

<%
if(sessionId != null){
	if ("admin".equals(sessionId)){
%>	
<button onclick="document.location.href='/animal/anipboard/deletePro.jsp?no=<%=no%>'">글삭제</button>
<button onclick="document.location.href='/animal/anipboard/update.jsp?no=<%=no%>'">글수정</button>

	<%}%>
<%}%>
</div>


<jsp:include page="../_comm/_tail.jsp"></jsp:include>
