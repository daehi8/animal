<%@page import="ani.Pboard.PboardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ani.Pboard.AnimalDAO" %>
<%@ page import="ani.Pboard.PboardDTO" %>
<%@ page import="java.io.File" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	String no = request.getParameter("no");
	
	AnimalDAO dao = AnimalDAO.getInstance();//겟인스턴스로 객체생성 
	String img = dao.selectImg(no); //셀렉이미지로 이미지 파일을 꺼내온후 if문을 이용해 삭제
	if(img != null){
		String path = request.getRealPath("save");
		File f = new File(path+"//"+img);
		if(f.exists()){
			f.delete();
		}
	}
	dao.delete(no);//딜리트 메서드 실행
%>

<script>
	alert("삭제되었습니다");
	window.location="list.jsp";
	
</script>