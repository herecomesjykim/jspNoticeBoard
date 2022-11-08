<!-- 메인페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>

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
		String userID="";
		if(request.getParameter("userID")!=null){
			userID=(String)request.getParameter("userID");
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
			<%//로그인이 안되어있는 경우(세션체크 null값인경우)
				if(scheck==null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button"
					aria-haspopup="true" aria-expanded="false">접속하기
					<span class="caret"></span>
					</a>
					<!-- 드랍다운 아이템 영역 -->
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="signin.jsp">회원가입</a></li>
					</ul>
				 </li>
			</ul>
			<%}else{//로그인되어있을때 화면 구현 %>
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
			<%} %>
		</div>


	</nav>
	<!-- 메인페이지 영역 시작 -->
	<div class="container">
		<div class="jumbotron">
			<h1>웹 사이트 소개</h1>
			<pre>jsp로 만든 웹 사이트입니다. 
해당 게시판은
jsp연습차 유튜버 '동빈나' 채널과  https://www.youtube.com/c/dongbinna
https://happy-inside.tistory.com/ 티스토리 블로그를 참고하여 만들었습니다.
DB와 연동하여 웹에 표현하는 방법을 학습하고자 제작했으며

기존 유튜브 및 블로그에 없는
'회원정보수정 기능' 및 '회원탈퇴 기능'은 복습하는 과정에서 제가 직접 구현하여 추가한 기능입니다. </pre>
		</div>
	</div>

	<!--부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
