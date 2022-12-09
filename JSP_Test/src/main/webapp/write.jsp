<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/write.css">
<title>Insert title here</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	<div class="nav">
		<div class="inner">
			<div class="nav-title">JSP 게시판 웹 사이트</div>
			<div class="sub-menu">
				<ul>
					<li><a href="main.jsp">메인</a></li>
					<li><a href="post.jsp">게시판</a></li>
					<%
					if (userID == null) {
					%>
					<li class="drop-box">접속하기▼
						<ul>
							<li><a href="login.jsp">로그인</a></li>
							<li><a href="join.jsp">회원가입</a></li>
						</ul>
					</li>
					<%
					} else {
					%>
					<li class="drop-box">회원관리
						<ul>
							<li><a href="logoutActive.jsp">로그아웃</a></li>
						</ul>
					</li>
					<%
					}
					%>


				</ul>
			</div>
		</div>

	</div>
	<section class="write-box">
		<form method="post" action="writeAction.jsp" class="inner">
			<div class="title">게시판 글쓰기 양식</div>
			<div class="post-title">
				<input name="jspTitle" type="text" placeholder="글 제목">
			</div>
			<div class="post-content">
				<textarea name="jspContent" id="" cols="50" rows="20"
					placeholder="글 내용"></textarea>
			</div>
			<input type="submit" value="글쓰기">
		</form>
	</section>


</body>
</html>