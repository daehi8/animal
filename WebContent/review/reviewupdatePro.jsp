<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ch08.board.BoardDAO" %>
<%@page import="ch08.board.BoardDTO" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<% request.setCharacterEncoding("UTF-8");String save = request.getRealPath("save");
	int size = 1024*1024*10;
	String enc = "UTF-8";
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request,save,size,enc,dp);
	
	BoardDTO dto = new BoardDTO();
	dto.setNum (Integer.parseInt(mr.getParameter("num")));
	dto.setWriter(mr.getParameter("writer"));
	dto.setSubject(mr.getParameter("subject"));
	dto.setContent (mr.getParameter("content"));
	dto.setImg (mr.getFilesystemName("img"));
	dto.setReg_date(new Timestamp(System.currentTimeMillis()));
	dto.setIp(mr.getParameter("ip"));
	String img = mr.getFilesystemName("chaImg");
	String sysImg = mr.getParameter("sysImg");
	if(img ==null){
		dto.setImg(sysImg);
	}else{
		dto.setImg(img);
	}
	System.out.println(dto.getImg());
	BoardDAO dao = BoardDAO.getInstance();
	dao.updateArticle(dto);
		
%>
      <script>      
      alert("수정되었습니다.");
		window.location="reviewcontent.jsp?num=<%=dto.getNum()%>";
     </script>

 