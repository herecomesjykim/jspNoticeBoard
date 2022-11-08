<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>

   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateAction</title>
</head>
<body>
	<%
	//현재 세션상태 확인 scheck==세선체크
			String scheck=null;
			if(session.getAttribute("scheck")!=null){
				scheck=(String)session.getAttribute("scheck");
			}
			//로그인 여부 확인
			if(scheck==null){
				out.println("<script>");
				out.println("alert( '로그인을 하세요.')");
				out.println("location.href='login.jsp'");
				out.println("</script>");
			}
			String userID=scheck;
			
			if(request.getParameter("userPassword")==null|| request.getParameter("userPassword")==""){//비번이 없는경우
				out.println("<script>");
				out.println("alert( '비밀번호는 필수사항입니다.')");
				out.println("history.back()");
				out.println("</script>");
			}else{//정상적인 경우 수정 로직
					UserDAO userDAO=new UserDAO();
				int result=userDAO.edit(userID,request.getParameter("userPassword"),request.getParameter("userEmail"));
					if(result==-1){
						out.println("<script>");
						out.println("alert( 'DB오류입니다 관리자에게 문의하세요. hiimjykim@gmail.com')");
						out.println("history.back()");
						out.println("</script>");
					}else{
						session.invalidate();
						out.println("<script>");
						out.println("alert( '탈퇴 성공')");
						out.println("location.href='mainpage.jsp'");//세션invalidate시키고 메인페이지로 보내기
						
						out.println("</script>");
					}
				}
			
	%>
</body>
</html>