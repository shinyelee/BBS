<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 반응형 웹으로 설정 -->
<!-- 부트스트랩 참조하는 링크 -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<!-- 내비게이션 영역 -->
	<nav class="navbar navbar-default">
		<!-- 헤더(대충 로고 등 들어간다고 생각하면 됨) -->
		<div class="navbar-header">
			<!-- 모바일 기준 우측 상단 三 모양 버튼 -->
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<!-- 게시판 사이트 제목, 클릭하면 메인 페이지로 이동 -->
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<!-- 하위 메뉴 -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<!-- 모바일 기준 우측 상단 드롭다운 영역 -->
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu"> <!-- 이 아래로 login.jsp(로그인) 페이지를 살짝 수정해 join.jsp(회원가입) 페이지를 만들었음 -->
						<li><a href="login.jsp">로그인</a></li> <!-- 여기서 class="active" 지우고 -->
						<li class="active"><a href="join.jsp">회원가입</a></li> <!-- 여기로 복붙하면 드롭다운 영역의'회원가입'란 활성화 됨 -->
					</ul>
				</li>	
			</ul>
		</div>
	</nav>
	<!-- 회원가입 양식 -->
	<div class="container">
		<div class="col-lg-4"></div>
			<div class="jumbotron" style="padding-top: 20px;">
			 	<form method="post" action="joinAction.jsp"> <!-- 데이터를 joinAction.jsp로 보냄 -->
			 		<h3 style="text-align: center:">회원가입 화면</h3>
			 		<!-- 아이디, 비밀번호, 이름, 성별, 이메일 입력창 -->
			 		<div class="form-group">
			 			<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">	
			 		</div>
			 		<div class="form-group">
			 			<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">	
			 		</div>
			 		<div class="form-group"> <!-- 이름 입력란 추가 -->
			 			<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">	
			 		</div>
			 		<div class="form-group" style="text-align: center;"> <!-- 성별 선택 버튼 추가 -->
			 			<div class="btn-group" data-toggle="buttons">
			 				<label class="btn btn-primary active"> <!-- active 써 넣어서 성별 기본값을 남자로 설정 -->
			 					<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
			 				</label>
			 				<label class="btn btn-primary">
			 					<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
			 				</label>
			 			</div>
			 		</div>
			 		<div class="form-group"> <!-- 이메일 입력란 추가 -->
			 			<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">	
			 		</div>
			 		<!-- 회원가입 버튼 -->
			 		<input type="submit" class="btn btn-primary form-control" value="회원가입">
			 	</form>
			</div>
	</div>
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>