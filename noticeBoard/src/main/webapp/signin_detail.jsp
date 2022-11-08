<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container"> <!-- 하나의 영역 생성 -->
	<div class="col-lg-5"><!-- 영역 크기 -->
		<div class="jumbotron" style="padding-top:20px;">
			<form method="post" action="signAction.jsp">
				<h3 style="text-align:center;">회원가입을 환영합니다.</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="30">
					
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="30">
					
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="30">
					
				</div>
				<div class="form-group">
					<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="30">
					
				</div>
				<div class="form-group" style="text-align: center;">
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-primary active">
							<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
						</label>
						<label class="btn btn-primary active">
							<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
						</label>
					</div>
				</div>
				<input type="submit" class="btn btn-primary form-control" value="회원가입">	
			</form>		
		</div>
	</div>
</div>
