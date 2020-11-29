<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="member.MemberDAO" %>
<%@ page import="member.MemberDTO" %>
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
    	System.out.println(dto.getTel1()+"-"+dto.getTel2()+"-"+dto.getTel3());
    	MemberDAO dao = MemberDAO.getInstance();
    	String mem_id = dao.findID2(dto.getMem_name(), dto.getTel1()+"-"+dto.getTel2()+"-"+dto.getTel3());


    	if(mem_id == null){
        %>
		<script type="text/javascript">
		
		alert("존재하지 않은 계정입니다");
		history.go(-1);
		</script>
		<%}else{%>
		<script>
		alert('찾으시는 계정은 '<%=mem_id%>'입니다.');
		</script>
		<%}%>

	<div class="">
 		<div class="">
 			<font class="">아이디를 찾았습니다.</font><br>
    	</div>
    	<div class="">
    		<font class=""><%=mem_id %>입니다.</font>
	   	</div>
	   	<div>
			<hr class="">
			<input class="btn1" type="button" value="확인" onclick="self.close()"/>
		</div>
	</div>
		
</body>
</html>
            	 