
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginAction</title>
</head>
<body>
	<%
		//현재 세션상태 확인 scheck==세선체크
		String scheck=null;
		if(session.getAttribute("scheck")!=null){
			scheck=(String)session.getAttribute("scheck");
		}
		//중복 로그인 차단, 메인페이지로 이동
		if(scheck!=null){
			out.println("<script>");
			out.println("alert( '이미 로그인이 되어있습니다.')");
			out.println("location.href='mainpage.jsp'");
			out.println("</script>");
		}
		UserDAO userDAO=new UserDAO();
		int result=userDAO.login(user.getUserID(),user.getUserPassword());
		if(result==1){
			//PrintWriter script=response.getWriter(); out으로 해보고 안되면 script로 써보기
			//로그인 여부 확인하기 위한 세션 추가
			session.setAttribute("scheck",user.getUserID());
			
			out.println("<script>");
			out.println("alert( '로그인 성공')");
			out.println("location.href='mainpage.jsp'");
			out.println("</script>");
		}else if(result==0){
			out.println("<script>");
			out.println("alert( '비밀번호가 틀립니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else if(result==-1){
			out.println("<script>");
			out.println("alert( '존재하지 않는 아이디입니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else{
			out.println("<script>");
			out.println("alert( 'DB커넥션 오류')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	%>
</body>
</html>