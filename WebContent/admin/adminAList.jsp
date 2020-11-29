<%@page import="ani.Pboard.PboardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ani.Pboard.PetDAO" %>
<%@ page import = "ani.Pboard.AnimalDAO" %>
<!DOCTYPE html>
	<%
	AnimalDAO dao1 = AnimalDAO.getInstance();
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	int pageSize = 10;
	int tCnt = 0;
	int number = 0;
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage -1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	
	tCnt = dao1.gettcnt();
	
	ArrayList list = dao1.getadmin(startRow, endRow);
	number = tCnt - (currentPage -1) * pageSize;
			

	
	%>
  		<table>
  			
  			<tr>
  				<td>번호</td>
  				<td>동물이름</td>
  				<td>지역</td>
  				<td>종류</td>
  				<td>조회수</td>
  				<td>날짜</td>
  			</tr>
  			<%
  				for(int i = 0; i < list.size(); i++){
  					PboardDTO dto = (PboardDTO)list.get(i);	 %>
  			<tr>
  				<td><%=number-- %></td>
  				<td><a href = "/animal/anipboard/detail.jsp?no=<%=dto.getNo()%>" ><%=dto.getName() %></a></td>
  				<td><%=dto.getCity() %></td>
  				<td><%=dto.getKind() %></td>
  				<% if(dto.getReadcount() == null){%>
  					<b>조회수: <%=0%> </b>
  				<%}else{ %>
  					<td><%=dto.getReadcount() %></td>
  				<%} %>
  				<td><%=dto.getReg() %></td>
  				<%%>
  				<%} %>
  			</tr>
  			
  		</table>
  		<%
  		System.out.println(tCnt);
	if(tCnt > 0){
		
		int pageCount = tCnt / pageSize + ( tCnt % pageSize == 0 ? 0 : 1);
	
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
		int endPage = startPage + pageBlock-1;
		if (endPage > pageCount) endPage = pageCount;
	
	    // 현재 페이지에서 -10페이지
   		if (startPage > 10) {    %>
   	 	<a href="/animal/admin/mainAdmin.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      	}
    
    	// 페이지 숫자 설정
   		for (int i = startPage ; i <= endPage ; i++) {  %>
    	<a href="/animal/admin/mainAdmin.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%
    	}
    
  	 	// 현재 페이지에서 +10페이지
  	 	if (endPage < pageCount) {  %>
  	 	<a href="/animal/admin/mainAdmin.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%
   	 	}
	}
%>
  		