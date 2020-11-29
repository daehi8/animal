<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "animal.board.Request_bDataBean" %>
<%@ page import = "ani.Pboard.PetDAO" %> 
<%
List RequestNewList = null;
PetDAO dao = PetDAO.getInstance();	
RequestNewList = dao.getRequestNewList();
int count = RequestNewList.size();
%>
<table>
	<tr>
		<td>번호</td>
		<td>타입</td>
		<td>제목</td>
		<td>시간</td>
	</tr>
	<%
	for(int i = 0; i < RequestNewList.size(); i++){
		Request_bDataBean dto = (Request_bDataBean)RequestNewList.get(i);
	%>
	<tr>
		<td><%=count--%></td>
		<td><%=dto.getType()%></td>
		<td><a href = "/animal/request/content.jsp?num=<%=dto.getNum()%>&pageNum=<%="1"%>"><%=dto.getTitle()%></a></td>
		<td><%=dto.getReg_data()%></td>
	</tr>
	<%}%>
</table>