<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/join.css" />
<!-- <link rel="stylesheet" -->
<%-- 	href="${pageContext.request.contextPath}/css/login.css" /> --%>
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<div class="nav">
		<div class="inner">
			<div class="nav-title=">JSP 게시판 웹 사이트</div>
			<div class="sub-menu">
				<ul>
					<li>메인</li>
					<li>게시판</li>
					<li class="drop-box">접속하기▼
						<ul>
							<li><a href="login.jsp">로그인</a></li>
							<li><a href="join.jsp">회원가입</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<section class="sign-up-section">
		<form method="post" action="joinActive.jsp" class="inner">
			<div class="title">회원가입 화면</div>
			<input type="text" name="userID" placeholder="아이디"> <input
				type="password" name="userPassword" placeholder="비밀번호"> <input
				type="text" name="userName" placeholder="이름">
			<div class="gender-select">
				<div class="select">
					<input type="radio" name="userGender" autocomplete="off" value="남자">
					남자
				</div>
				<div class="select">
					<input type="radio" name="userGender" autocomplete="off" value="여자">
					여자
				</div>
			</div>
			<input type="email" name="userEmail" placeholder="이메일"> <input
				type="submit" value="회원가입">
		</form>
	</section>
</body>
</html>