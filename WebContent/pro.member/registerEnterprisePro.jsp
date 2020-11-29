<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="member.MemberDAO" %>
<%@ page import="member.MemberDTO" %>

<link rel="stylesheet" href="/animal/css/member.css">
	<% 
		request.setCharacterEncoding("UTF-8");
	%>

    <jsp:useBean id="dto" class="member.MemberDTO" />
    <jsp:setProperty property="*" name="dto"/>
    
    
	<% 
		MemberDAO dao = new MemberDAO();
		dao.registerEnterprise(dto);
		
    %>
    
    
	<script> 
	window.alert("회원가입이 정상적으로 완료되었습니다.");
	</script>
	
	<body>
		<div class="">
			<div class="">
		    	<font class="">가입시 입력하였던 정보를 확인하세요.</font><br><br>	
            	<font class="">Project Animal</font><br><br>
         	</div>
        	<div>
          		<font color="blue"><%=dto.getMem_name() %></font>님 가입을 축하드립니다.<br><br>
        	</div>
          	<!-- 자바빈에서 입력된 값을 추출-->
        	<div>
          		<table>
            		<tr>
              			<td class="">아이디</td>
              			<td class=""><%=dto.getMem_id() %></td>
            		</tr>            
            		<tr>
              			<td class="">비밀번호</td>
              			<td class=""><%=dto.getMem_password() %></td>
            		</tr>
            		<tr>
              			<td class="">회사명</td>
              			<td><%=dto.getEp_name() %></td>
            		</tr>       
            		<tr>
              			<td class="">대표자명</td>
              			<td><%=dto.getMem_name() %></td>
            		</tr> 
            		<tr>
              			<td class="">업태</td>
              			<!-- 후에 배열 if문으로 값을 가져옴 -->
              			<td><%=dto.getEp_type() %></td>
            		</tr>    
            		<tr>
              			<td class="">이메일</td>
              			<td class=""><%=dto.getEmail1() %>@<%=dto.getEmail2() %></td>
            		</tr>     
            		<tr>
              			<td class="">휴대전화</td>
              			<td class=""><%=dto.getTel1() %>-<%=dto.getTel2() %>-<%=dto.getTel3() %></td>
            		</tr>
            		<tr>
              			<td class="">팩스번호</td>
              			<td class=""><%=dto.getTel1() %>-<%=dto.getTel2() %>-<%=dto.getTel3() %></td>
            		</tr>
            		<tr>
              			<td class="">주소</td>
              			<td><%=dto.getAddress1() %>  <%=dto.getAddress2() %></td>
            		</tr>
            		<tr>
              			<td class="">법인등록번호</td>
              			<td><%=dto.getReg_no1() %>-<%=dto.getReg_no2()%>-<%=dto.getReg_no3()%></td>
            		</tr>
            		<tr>
              			<td class="">사업자번호</td>
              			<td><%=dto.getBiz_no1()%>-<%=dto.getBiz_no2()%>-<%=dto.getBiz_no3()%>-<%=dto.getBiz_no4()%></td>
            		</tr>
        		</table><br>
        		<hr>
       			<div class="">
      				<button class="" onclick="location.href = '/animal/main/main.jsp'">확인</button>
	  			</div>    
    		</div>
		</div>
	</body>
</html>