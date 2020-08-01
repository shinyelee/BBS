<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %> <!-- write.jsp 일부 수정해 만듦 -->
<%@ page import="bbs.BbsDAO" %> <!-- 데이터베이스 접근 위해 추가 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 반응형 웹으로 설정 -->
<!-- CSS(부트스트랩 사용) -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		// 매개변수, 기본세팅 처리
		int bbsID = 0; // 존재하는 글
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) { // 존재하지 않는 글
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 글입니다.')"); 
			script.println("location.href = 'bbs.jsp'"); 
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
	%>
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
			<ul class="nav navbar-nav"> <!-- 내비게이션 바에 들어가는 메뉴 리스트 -->
				<li><a href="main.jsp">메인</a></li> <!-- 메인 활성화 -->
				<li class="active"><a href="bbs.jsp">게시판</a></li>
			</ul>
			<%
				if(userID == null) {
			%>
			<!-- 내비게이션바 우측 드롭다운 영역 -->
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<!-- #은 링크 없는거나 마찬가지(자기자신) -->
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>	
			</ul>
			<%		
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>	
			</ul>
			<%		
				}
			%>
		</div>
	</nav>
	<!-- 게시글 하나 보여주는 영역 -->
	<div class="container">
	<div class="row"> <!-- form 태그 삭제함 -->
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr> <!-- 글 제목 -->
						<th colspan="2" style="background-color: #eeeeee; text-align: center;"><%= bbs.getBbsTitle() %></th>
					</tr>
				</thead>
				<tbody> <!-- 작성자, 작성일 -->
					<tr>
						<td>작성자 | <%= bbs.getUserID() %></td>
						<td>작성일 | <%= bbs.getBbsDate().substring(0, 11)
								  		  + bbs.getBbsDate().substring(11, 13) + "시"
								  		  + bbs.getBbsDate().substring(14, 16) + "분" %></td>
					</tr>
					<tr> <!-- 글 내용 출력 -->
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= bbs.getBbsContent() %></td>
					</tr>
				</tbody>
			</table>
			<a href="bbs.jsp" class="btn btn-success">목록</a>
			<%	// 글 수정/삭제기능
				if(userID != null && userID.equals(bbs.getUserID())) { // 접속한 userID가 빈 값이 아닌 로그인 상태인 동시에 작성자와 일치할 때
			%>
					<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary pull-right">수정</a> <!-- 글 수정 페이지로 보냄 -->
					<a href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-danger pull-right">삭제</a> <!-- 글 삭제 페이지로 보냄 -->
			<%
				}
			%>
	</div>
	</div>
	<!-- CSS(부트스트랩 사용) -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>