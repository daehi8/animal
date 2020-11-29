<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "animal.board.Notice_DBBean" %>
<%@ page import = "animal.board.Notice_DataBean" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<% request.setCharacterEncoding("UTF-8");%>

<%
	String save = request.getRealPath("save");
	int size = 1024*1024*10;
	String enc = "UTF-8";
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request,save,size,enc,dp);
	
	Notice_DataBean dto = new Notice_DataBean();
	
	dto.setNum(Integer.parseInt(mr.getParameter("num")));
	dto.setTitle(mr.getParameter("title"));
	dto.setWriter(mr.getParameter("writer"));
	dto.setContents(mr.getParameter("contents"));
	dto.setImg(mr.getParameter("img"));
	dto.setReadcount(Integer.parseInt(mr.getParameter("readcount")));
	
	String img = mr.getFilesystemName("img");
	String sysImg = mr.getParameter("sysImg");
	if(img == null){
		dto.setImg(sysImg);
	}else{
		dto.setImg(img);
	}
	Notice_DBBean dao = Notice_DBBean.getInstance();
	dao.updateArticle(dto);
		
%>

     <script>
		alert("수정되었습니다.");
		window.location="noticeList.jsp";
	</script>

 