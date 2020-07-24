<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<!-- 부트스트랩 참조하는 링크 -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<!-- 내비게이션 영역 -->
	<nav class="navbar navbar-default">
		<!-- 헤더 -->
		<div class="navbar-header">
			<!-- 모바일 기준 우측 상단 三 버튼 -->
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
				<li><a href-"main.jsp">메인</a></li>
				<li><a href-"bbs.jsp">게시판</a></li>
			</ul>
			<!-- 모바일 기준 우측 상단 드롭다운 영역 -->
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						araia-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>	
			</ul>
		</div>
	</nav>
	<!-- 로그인 양식 -->
	<div class="container">
		<div class="col-lg-4"></div>
			<div class="jumbotron" style="padding-top: 20px;">
			 	<form method="post" action="loginAction.jsp">
			 		<h3 style="text-align: center:">로그인 화면</h3>
			 		<!-- 아이디, 비밀번호 입력창 -->
			 		<div class="form-group">
			 			<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">	
			 		</div>
			 		<div class="form-group">
			 			<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">	
			 		</div>
			 		<!-- 로그인 버튼 -->
			 		<input type="submit" class="btn btn-primary form-control" value="로그인">
			 	</form>
			</div>
	</div>
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>