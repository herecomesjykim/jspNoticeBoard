<!-- 글쓰기페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device=width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>login page</title>
</head>
<body>
	<%
		//현재 세션상태 확인 scheck==세선체크
		String scheck=null;
		if(session.getAttribute("scheck")!=null){
			scheck=(String)session.getAttribute("scheck");
		}
		if(scheck==null){
			out.println("<script>");
			out.println("alert('로그인하세요')");
			out.println("location.href='login.jsp'");
			out.println("</script>");
		}
		int bbsID=0;
		if(request.getParameter("bbsID")!=null){
			bbsID=Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID==0){
			out.println("<script>");
			out.println("alert('유효하지 않은 글입니다.')");
			out.println("location.href='bbs.jsp'");
			out.println("</script>");
		}
		
		Bbs bbs=new BbsDAO().getBbs(bbsID);
		if(!scheck.equals(bbs.getUserID())){
			out.println("<script>");
			out.println("alert('권한이 없습니다..')");
			out.println("location.href='bbs.jsp'");
			out.println("</script>");
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-examle-navbar-collapse-1"
			are	a-expanded="false">
			<!-- 화면이 좁아지면 우측에 나타남 -->
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			
			</button>
			<a class="navbar-brand" href="mainpage.jsp">
			게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="mainpage.jsp">메인</a>
				<li><a href="bbs.jsp">게시판</a>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button"
					aria-haspopup="true" aria-expanded="false">회원관리
					<span class="caret"></span>
					</a>
					<!-- 드랍다운 아이템 영역 -->
					<ul class="dropdown-menu">
						<li><a href="editInfo.jsp">회원정보수정</a></li>
						<li><a href="logout.jsp">로그아웃</a></li>
						<li><a href="bye.jsp">회원탈퇴</a></li>
		</div>
	</nav>
	<!-- 글수정 양식 -->
	<div class="container">
		<div class="row">
			<form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
				<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color:#eeeeee"; text-align:center;">게시판 글 수정 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="30" value="<%=bbs.getBbsTitle()%>"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="bbsContent"maxlength="4096" style="height:350pxl"><%=bbs.getBbsContent()%></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="수정하기">
			
			</form>
		</div>
	</div>
	
	
	
	<!--부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
