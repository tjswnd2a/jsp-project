<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="jsp.JspDAO"%>
<%@ page import="jsp.Jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/post.css">
<title>Insert title here</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int jspID = 0;
	if (request.getParameter("jspID") != null) {
		jspID = Integer.parseInt(request.getParameter("jspID"));
	}
	if (jspID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("</script>");
	}
	Jsp jsp = new JspDAO().getJsp(jspID);
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
	<section class="table-container">
		<div class="inner">
			<div><%=jsp.getJspTitle()%></div>
			<div><%=jsp.getJspContent().replaceAll(" ","&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></div>
			<div><%=jsp.getJspDate()%></div>
			<div><%=jsp.getUserID()%></div>
			<div><%=jsp.getJspID()%></div>
			<div class="btn-container">
				<a href="post.jsp"><button>목록</button></a>
				<%
				if(userID != null && userID.equals(jsp.getUserID())) {
				%>
				<a href="post.jsp"><button>수정</button></a>
				<a href="post.jsp"><button>삭제</button></a>
				<%
				}
				%>
			</div>
		</div>
	</section>


</body>
</html>