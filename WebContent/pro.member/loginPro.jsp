<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO" %>
<%@ page import="member.MemberDTO" %>
<!-- java SQL 사용하지 않음-->
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<meta charset="UTF-8">
<!-- 로그인하는 회원에따라 관리되는 화면입니다. -->
<title>loginPro</title>
	<!--id : JSP 페이지에서 자바빈 객체에 접글할 때 사용할 이름 -->
	<!--class : 패키지이름을 포함한 자바빈 클래스의 완전한 이름  -->
 	<!--scope : 자바빈 객체가 저장될 영역을 지정한다. (page, request, session, application 중 하나, 기본값은 page)-->
 	<!--jsp:useBean id="빈이름" class="자바빈클래스이름" scope="범위"/-->
    <%
 		// 한글인코딩 처리
    	request.setCharacterEncoding("UTF-8"); 
        // 로그인 화면에 입력된 아이디와 비밀번호를 가져온다
        String mem_id= request.getParameter("mem_id");
        String mem_password = request.getParameter("mem_password");
        
        // DB에서 아이디, 비밀번호 확인
        MemberDAO dao = MemberDAO.getInstance();
        int check = dao.checkLogin2(mem_id, mem_password, request);
        // URL 및 로그인관련 전달 메시지
        String msg = "";  
        if(check == 1)    // 로그인 성공
        { 
            // 세션에 현재 아이디 세팅
            session.setAttribute("memId", mem_id);
            // 세션에 회원상태 받음
            String db_flag = (String) session.getAttribute("db_flag");
            
            if ("0".equals(db_flag) ) {
               
            	msg = "/animal/admin/mainAdmin.jsp"; //mem_flag가 0면 어드민
            
            } else if ("1".equals(db_flag) ) {
                
            	msg = "/animal/main/main.jsp"; //mem_flag가 1면 일반회원
			
            } else if ("2".equals(db_flag) ) {
                
            	msg = "/animal/main/main.jsp"; //mem_flag가 2면 기업회원
			
            } else {
               
            	msg = "/animal/form.member/loginMainForm.jsp"; //mem_flag가 3면 신고,탈퇴회원
            
            }
        }
        else if(check == 0) // 비밀번호가 틀릴경우
        {
        	msg = "/animal/form.member/loginMainForm.jsp?msg=0";
        }
        else    // 아이디가 틀릴경우
        {
            msg = "/animal/form.member/loginMainForm.jsp?msg=-1";
        }
         
        // sendRedirect(String URL) : 해당 URL로 이동
        // URL뒤에 get방식 처럼 데이터를 전달가능
        response.sendRedirect(msg);
        
    %>
