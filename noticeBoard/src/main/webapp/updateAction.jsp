<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>

   
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
			int bbsID=0;
			if(request.getParameter("bbsID")!=null){
				bbsID=Integer.parseInt(request.getParameter("bbsID"));
				
			}
			if (bbsID==0){
				out.println("<script>");
				out.println("alert( '유효하지 않은 글입니다.')");
				out.println("location.href='bbs.jsp'");
				out.println("</script>");
			}
			
			//통해 작성자 본인이 맞는지 체크
			Bbs bbs=new BbsDAO().getBbs(bbsID);
			if(!scheck.equals(bbs.getUserID())){
				out.println("<script>");
				out.println("alert( '권한이없습니다..')");
				out.println("location.href='bbs.jsp'");
				out.println("</script>");
			}
			
			else{
				if(request.getParameter("bbsTitle")==null||request.getParameter("bbsContent")==null){//제목과 내용 필수사항으로 작성하게 하기
					out.println("<script>");
					out.println("alert( '제목과 내용은 필수사항입니다.')");
					out.println("history.back()");
					out.println("</script>");
				}else{//정상적인 경우 수정 로직
					BbsDAO bbsDAO=new BbsDAO();
					int result=bbsDAO.update(bbsID,request.getParameter("bbsTitle"),request.getParameter("bbsContent"));
					if(result==-1){
						out.println("<script>");
						out.println("alert( 'DB오류입니다 관리자에게 문의하세요. hiimjykim@gmail.com')");
						out.println("history.back()");
						out.println("</script>");
					}else{
						out.println("<script>");
						out.println("alert( '수정 성공')");
						out.println("location.href='bbs.jsp'");
						
						out.println("</script>");
					}
				}
			}	
	%>
</body>
</html>