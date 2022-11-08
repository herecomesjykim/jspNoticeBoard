<!-- 회원가입 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device=width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>sign-in page</title>
</head>
<body>
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
				<li><a href="nboard.jsp">게시판</a>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button"
					aria-haspopup="true" aria-expanded="false">접속하기
					<span class="caret"></span>
					</a>
					<!-- 드랍다운 아이템 영역 -->
					<ul class="dropdown-menu">
						<li><a href="editInfo.jsp">회원정보수정</a></li>
						<li><a href="logout.jsp">로그아웃</a></li>
						<li><a href="bye.jsp">회원탈퇴</a></li>
					</ul>
				 </li>
			</ul>
		</div>


	</nav>
	<!-- 회원가입 양식 -->
<%@include file="signin_detail.jsp" %>

	<!--부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
