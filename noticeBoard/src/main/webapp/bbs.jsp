<!-- 게시판 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>

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
		int pageNumber=1;//기본은 1페이지를 할당
		//파라미터로 넘어온 pageNumber 정수형으로 형변환해서 pageNumber변수에 저장
		//파라미터는 object로 넘어오기때문에 형변환 해줘야됨
		if(request.getParameter("pageNumber")!=null){
			pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
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
	
	<!-- 게시판부분 -->
	<div class="container">
	<div class="row">
		<table class="table table-striped" style="text-align: center; border:1px solid #dddddd;">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align:center;">번호</th>
					<th style="background-color: #eeeeee; text-align:center;">제목</th>
					<th style="background-color: #eeeeee; text-align:center;">작성자</th>
					<th style="background-color: #eeeeee; text-align:center;">작성일</th>
				</tr>
			</thead>
			<tbody>
				<%BbsDAO bs=new BbsDAO(); 
				ArrayList<Bbs> list =bs.getList(pageNumber);
				for(int i=0;i<list.size();i++){%>
				
				<tr>
					<td><%=list.get(i).getBbsID() %></td>
					<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID() %>"><!-- 링크 걸어두기 -->
					<%=list.get(i).getBbsTitle() %></a></td>
					<td><%=list.get(i).getUserID() %></td>
					<td><%=list.get(i).getBbsDate() %></td>
				</tr>
					<%}%>		
			</tbody>
		</table>
		<!--페이지 처리 -->
		<%
			if(pageNumber!=1){
		%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber-1 %>"
			class="btn btn-success btn-arraw-left">이전</a>
		<%
		}if(bs.nextPage(pageNumber+1)){
		%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber+1 %>"
			class="btn btn-success btn-arraw-left">다음</a>
		<%
		}
		%>
			
		<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
	</div>
</div>

	<!--부트스트랩 참조 영역 -->

	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
