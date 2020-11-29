<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<!--메인 로그인 화면에서 로그아웃 버튼을 누를시 로그아웃을 처리합니다 -->
    <title>Logout_Pro</title>
</head>
<body>
	<script>alert('로그아웃되었습니다.');</script>
    <%
    //session 초기화
    session.invalidate();
    
    //로그인 관련 쿠키 삭제
    Cookie[] cookies = request.getCookies();
    if(cookies!=null){
        for(Cookie tempCookie : cookies){
            if(tempCookie.getName().equals("memId")){
                tempCookie.setMaxAge(0);
                tempCookie.setPath("/");
                response.addCookie(tempCookie);
                
            }
        }
    }
    response.sendRedirect("/animal/form.member/loginMainForm.jsp"); 
%>
</body>
</html>