<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login.css">
<title>Insert title here</title>
</head>
<body>
	<div class="nav">
		<div class="inner">
			<div class="nav-title">JSP 게시판 웹 사이트</div>
			<div class="sub-menu">
				<ul>
					<li>메인</li>
					<li><a href="post.jsp"></a>게시판</li>
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
	<%
// 	String userID = null;
// 	if(session.getAttribute("userID") != null) {
// 		userID = (String) session.getAttribute("userID");
// 	}else {
		
// 	}
	%>
	<section class="login-section">
		<form method="post" action="loginAction.jsp" class="inner">
			<div class="title">로그인 화면</div>
			<input type="text" placeholder="아이디" name="userID" maxlength="20">
			<input type="password" placeholder="비밀번호" name="userPassword" maxlength="20">
			<input type="submit" class="btn-login" value="로그인">
		</form>
		
	</section>
</body>
</html>