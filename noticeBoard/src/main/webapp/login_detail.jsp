<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container"> <!-- 하나의 영역 생성 -->
	<div class="col-lg-4"><!-- 영역 크기 -->
		<div class="jumbotron" style="padding-top:20px;">
			<form method="post" action="loginAction.jsp">
				<h3 style="text-align:center;">로그인 화면</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="30">
					
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="30">
					
				</div>
				<input type="submit" class="btn btn-primary form-control" value="로그인">	
			</form>		
		</div>
	</div>
</div>
