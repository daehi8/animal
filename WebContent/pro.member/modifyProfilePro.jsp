<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page import="member.MemberDAO" %>
<%@ page import="member.MemberDTO" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<link rel="stylesheet" href="/animal/css/member.css">
	
</head>
<body>
    <%
    	// 한글 인코딩 처리 
    	request.setCharacterEncoding("UTF-8");
    %>
    
    <jsp:useBean id="dto" class="member.MemberDTO" />
    <jsp:setProperty property="*" name="dto"/>
    
    
    <%
    	String id= (String)session.getAttribute("memId");
    	MemberDAO dao = new MemberDAO();
        dto = dao.memberViewProfile(id);
    %>
    
    <div class="">
    	<div class="">
 			<div class="">
 				<font class="">회원정보가 수정되었습니다.</font><br>
    			<div class="">
					<font class="">&nbsp;&nbsp;개인정보 수정</font>
				</div>		
			</div>
			<div>
			<table class="" border="">
				<tr>
					<td width="80%" align="right" height="5%" colspan="2">
						<%=id%>님의 개인정보입니다.
       				</td>
				</tr>
				<tr>
					<td width="100%" height="5%" align="left" colspan="2"><font class="">등록정보</font></td>
					</tr>
					<tr>
					<td width="90%" height="45%" colspan="2">
								<table class="table2">
                 		 		<tr>
                    		<td width="30%" class="font3">닉네임 :</td>
                   			<td><%=dto.getMem_nickname() %></td>
                   		</tr>
                	     <tr>
                    		<td class="font3">프로필 :</td>
                   		 	<td><%=dto.getMem_img() %></td>
                    	</tr>
                		<tr>
                    		<td class="font3">자기소개 :</td>
                    		<td colspan="2"><%=dto.getMem_intro() %></td>
                    	</tr>
                    	<tr>
                    	<td>
				 			<hr class="">
				 			<input class="" type="button" value="확인" onclick="location.href = '/animal/form.member/loginMemberForm.jsp'"/>
						</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</div>
		</div>
	</div>
</body>
            	 
