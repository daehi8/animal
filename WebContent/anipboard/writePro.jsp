<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ani.Pboard.AnimalDAO" %>
<%@ page import="ani.Pboard.PboardDTO" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<%
	request.setCharacterEncoding("UTF-8");
	String save = request.getRealPath("save");
	int size = 1024*1024*10;
	String enc = "UTF-8";
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request,save,size,enc,dp);
	
	PboardDTO dto = new PboardDTO();
	
	dto.setNo(mr.getParameter("no"));
	dto.setName(mr.getParameter("name"));
	dto.setImg(mr.getFilesystemName("img"));
	dto.setMenual(mr.getParameter("menual"));
	dto.setCity(mr.getParameter("city"));
	dto.setKind(mr.getParameter("kind"));
	dto.setReadcount(mr.getParameter("readcount"));
	//객체생성후 메서드 호출
	AnimalDAO dao = AnimalDAO.getInstance();
	dao.insert(dto);
%>

<script>
	alert("등록되었습니다");
	location.href="list.jsp";
</script>
