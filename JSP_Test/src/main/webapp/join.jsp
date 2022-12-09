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
<title>JSP �Խ��� �� ����Ʈ</title>
</head>
<body>
	<div class="nav">
		<div class="inner">
			<div class="nav-title=">JSP �Խ��� �� ����Ʈ</div>
			<div class="sub-menu">
				<ul>
					<li>����</li>
					<li>�Խ���</li>
					<li class="drop-box">�����ϱ��
						<ul>
							<li><a href="login.jsp">�α���</a></li>
							<li><a href="join.jsp">ȸ������</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<section class="sign-up-section">
		<form method="post" action="joinActive.jsp" class="inner">
			<div class="title">ȸ������ ȭ��</div>
			<input type="text" name="userID" placeholder="���̵�"> <input
				type="password" name="userPassword" placeholder="��й�ȣ"> <input
				type="text" name="userName" placeholder="�̸�">
			<div class="gender-select">
				<div class="select">
					<input type="radio" name="userGender" autocomplete="off" value="����">
					����
				</div>
				<div class="select">
					<input type="radio" name="userGender" autocomplete="off" value="����">
					����
				</div>
			</div>
			<input type="email" name="userEmail" placeholder="�̸���"> <input
				type="submit" value="ȸ������">
		</form>
	</section>
</body>
</html>