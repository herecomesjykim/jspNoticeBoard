<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/> 
<jsp:setProperty name="user" property="userName"/> 
<jsp:setProperty name="user" property="userEmail"/> 
<jsp:setProperty name="user" property="userGender"/> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signAction</title>
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
		if(user.getUserID()==null||user.getUserPassword()==null||user.getUserName()==null||user.getUserName()==null||user.getUserGender()==null){//필수 입력사항 이므로 null인지 여부 확인
			out.println("<script>");
			out.println("alert('모두 입력해 주시기 바랍니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else{
			UserDAO uD=new UserDAO();
			int result=uD.sign(user);//sign메소드 리턴값이 -1인경우 아이디 중복(아이디를 primary key했기 떄문에 중복불가)
			if(result==-1){
				out.println("<script>");
				out.println("alert('중복된 아이디입니다. 다른 아이디를 입력하세요.')");
				out.println("history.back()");
				out.println("</script>");
			}else{
				out.println("<script>");
				out.println("alert('회원가입을 환영합니다.')");
				out.println("location.href='mainpage.jsp'");
				out.println("</script>");
			}
			
		}
	%>
</body>
</html>