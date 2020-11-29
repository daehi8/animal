<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="member.MemberDAO" %>
<%@ page import="member.MemberDTO" %>
<link rel="stylesheet" href="/animal/css/member.css">

<!-- 개인정보 변경후 입력했던 정보를 다시 확인 할 수 있으며 확인 버튼을 누르면 메인페이지로 넘어갑니다. -->
<title>변경 후 정보 확인화면</title>
<body>
    <%
    	// 한글 인코딩 처리 
    	request.setCharacterEncoding("UTF-8");
    %>
    
    <jsp:useBean id="dto" class="member.MemberDTO" />
    <jsp:setProperty property="*" name="dto"/>
    
    
    <%
    	String id= (String) session.getAttribute("memId");
        dto.setMem_id(id);
    	MemberDAO dao = new MemberDAO();
        dao.modifyMemberInfo(dto);
		ResultSet rs = null;
		
	%>
	
 	<font class="" color="">회원정보가 수정되었습니다.</font><br>
    <div>
		<font class="">&nbsp;&nbsp;개인정보 수정</font>
	 	<table class="" border="1">
			<tr>
				<td colspan="2"><%=dto.getMem_id() %>님의 개인정보입니다.</td>
			</tr>
			<tr>
				<td colspan="2"><font class="">Animal 등록 정보</font>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<table class="">
                 		 <tr>
                    		<td class="">닉네임 :</td>
                   			<td><%=dto.getMem_nickname() %></td>
                   		</tr>
                	     <tr>
                    		<td class="">비밀번호 :</td>
                   		 	<td><%=dto.getMem_password() %></td>
                    	</tr>
                		<tr>
                    		<td class="">이름 :</td>
                    		<td colspan="2"><%=dto.getMem_name() %></td>
                    	</tr>
                    	<tr>
                    		<td class="">성별 :</td>
                    		<td colspan="2"><%=dto.getMem_gender() %></td>
                    	</tr>
                		<tr>
                    		<td class="">이메일</td>
                    		<td colspan="2"><%=dto.getEmail1() %>@<%=dto.getEmail2() %></td>
                		</tr> 
                		<tr>
                    		<td class="">휴대전화</td>
                    		<td colspan="2"><%=dto.getTel1() %><span>&nbsp;-&nbsp;</span><%=dto.getTel2() %><span>&nbsp;-&nbsp;</span><%=dto.getTel3() %></td>
                		</tr>
                 		<tr>
                    		<td class="">전화번호</td>
                   			<td colspan="2"><%=dto.getLtel1() %><span>&nbsp;-&nbsp;</span><%=dto.getLtel2() %><span>&nbsp;-&nbsp;</span><%=dto.getLtel3() %></td>
                		</tr> 
                		<tr>
                    		<td class="">주소정보</td>
                    		<td colspan="2"><%=dto.getMem_zip_code() %><span>&nbsp;&nbsp;</span><%=dto.getAddress1() %><span>&nbsp;&nbsp;</span><%=dto.getAddress2() %></td>
                		</tr>
                 		<tr>
                    		<td class="">생년월일</td>
                   			<td colspan="2"><%=dto.getMem_birthdate() %>
                   		</tr>
						<tr>
							<td>
				 			<hr class="">
				 			<input class="" type="button" value="확인" onclick="location.href = '/animal/form.member/loginAdminForm.jsp'"/>
						</td>
					</tr>
				</table>
			</td>
			</tr>
		</table>
	</div>
</body>
</html>
            	 