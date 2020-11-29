<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="ani.Pboard.PboardDTO"%>
<%@page import="ani.Pboard.AnimalDAO"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<%
	//이미지 생성을 위한 경로를 만들고 멀티파트리퀘스트를 이용해 사진을 업로드함
	request.setCharacterEncoding("UTF-8");
	String save = request.getRealPath("save");
	int size = 1024*1024*10;
	String enc = "UTF-8";
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request,save,size,enc,dp);
	
	PboardDTO dto = new PboardDTO();
	dto.setNo(mr.getParameter("no"));
	dto.setName(mr.getParameter("name"));
	dto.setImg(mr.getParameter("img"));
	dto.setMenual(mr.getParameter("menual"));
	dto.setCity(mr.getParameter("city"));
	dto.setKind(mr.getParameter("kind"));
	
	String img = mr.getFilesystemName("img");
	String sysImg = mr.getParameter("sysImg");
	if(img ==null){
		dto.setImg(sysImg);
	}else{
		dto.setImg(img);
	}
	//객체생성후 메서드 호출
	AnimalDAO dao = AnimalDAO.getInstance();
	dao.Update(dto);
		
%>
<script>
	alert("수정되었습니다.");
	window.location="detail.jsp?no=<%=dto.getNo()%>";
	
</script>