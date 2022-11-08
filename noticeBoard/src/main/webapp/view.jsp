<!--쓴 글을 보여주는 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.Bbs" %>
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
		//bbsID초기화 데이터 넘어온 경우 인트로 형변환해서 변수에 담는다
		int bbsID =0;
		if(request.getParameter("bbsID")!=null){
			bbsID=Integer.parseInt(request.getParameter("bbsID"));
		}
		//넘어온 데이터가 없을경우
		if(bbsID==0){
			out.println("<script>");
			out.println("alert('유효하지 않은 글입니다.')");
			out.println("location.href='bbs.jsp'");
			out.println("</script>");
		}
		
		Bbs bbs=new BbsDAO().getBbs(bbsID);
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
			<%}
			%>
		</div>


	</nav>
	<!-- 글조회 양식 -->
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color:#eeeeee; text-align:center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:20%;">글 제목</td>
						<td colspan="2"><%=bbs.getBbsTitle() %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%=bbs.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%=bbs.getBbsDate() %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="height:200px;text-align:left;"><%=bbs.getBbsContent() %></td>
					</tr>
				</tbody>
			</table>
			<a href="bbs.jsp" class="btn-btn-primary">목록</a>
			
			<!-- 작성자만 수정 및 삭제 가능하도록 구현 -->
			<%
			if(scheck !=null&&scheck.equals(bbs.getUserID())){
			%>
			<a href="update.jsp?bbsID=<%=bbsID %>" class="btn btn-primary">수정</a>
			<a href="deleteAction.jsp?bbsID=<%=bbsID %>" class="btn btn-primary">삭제</a>
			<%
			}
			%>
		</div>
	</div>
	
	
	<!--부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
