<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="jsp.Jsp"%>
<%@ page import="jsp.JspDAO"%>
<%
request.setCharacterEncoding("UTF-8");
%>
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
	if( userID == null ) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	int jspID = 0;
	if(request.getParameter("jspID") != null) {
		jspID = Integer.parseInt(request.getParameter("jspID"));
	}
	if( jspID == 0 ) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'post.jsp'");
		script.println("</script>");
	}
	
	Jsp jsp = new JspDAO().getJsp(jspID);
	if(!userID.equals(jsp.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'post.jsp'");
		script.println("</script>");
	}
	%>
	<div class="nav">
		<div class="inner">
			<div class="nav-title">JSP 게시판 웹 사이트</div>
			<div class="sub-menu">
				<ul>
					<li><a href="main.jsp">메인</a></li>
					<li><a href="post.jsp">게시판</a></li>
					<li class="drop-box">회원관리
						<ul>
							<li><a href="logoutActive.jsp">로그아웃</a></li>
						</ul>
					</li>

				</ul>
			</div>
		</div>

	</div>
	<section class="write-box">
		<form method="post" action="updateAction.jsp?jspID=<%= jsp.getJspID()%>" class="inner">
			<div class="title">게시판 글쓰기 양식</div>
			<div class="post-title">
				<input name="jspTitle" type="text" placeholder="글 제목" value="<%= jsp.getJspTitle() %>">
			</div>
			<div class="post-content">
				<textarea name="jspContent" id="" cols="50" rows="20"
					placeholder="글 내용"><%= jsp.getJspContent() %></textarea>
			</div>
			<input type="submit" value="글수정">
		</form>
	</section>


</body>
</html>