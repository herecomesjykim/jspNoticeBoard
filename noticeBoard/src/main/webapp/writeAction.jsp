<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
<jsp:setProperty name="bbs" property="bbsTitle"/>
<jsp:setProperty name="bbs" property="bbsContent"/> 

   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WriteAction</title>
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
			}else{
				if(bbs.getBbsContent()==null||bbs.getBbsTitle()==null){//제목과 내용 필수사항으로 작성하게 하기
					out.println("<script>");
					out.println("alert( '제목과 내용은 필수사항입니다.')");
					out.println("history.back()");
					out.println("</script>");
				}else{
					BbsDAO bbsDAO=new BbsDAO();
					int result=bbsDAO.write(bbs.getBbsTitle(),scheck,bbs.getBbsContent());
					if(result==-1){
						out.println("<script>");
						out.println("alert( 'DB오류입니다 관리자에게 문의하세요. hiimjykim@gmail.com')");
						out.println("history.back()");
						out.println("</script>");
					}else{
						out.println("<script>");
						out.println("alert( '글쓰기 성공')");
						out.println("location.href='bbs.jsp'");
						
						out.println("</script>");
					}
				}
			}	
	%>
</body>
</html>