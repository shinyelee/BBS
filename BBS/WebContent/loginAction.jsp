<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %> <!-- 클래스 사용 위해 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트 사용 위해 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 한글 깨짐 방지 위해 -->
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%  // 로그인 기능 구현
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		if (result == 1) { // 1 -> 로그인 성공
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		} else if (result == 0) { // 0 -> 비밀번호 다름
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 다릅니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (result == -1) { // -1 -> 아이디 다름
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (result == -2) { // -2 -> DB 오류
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</html>