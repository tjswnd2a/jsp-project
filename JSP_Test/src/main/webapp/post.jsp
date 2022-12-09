<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="jsp.JspDAO"%>
<%@ page import="jsp.Jsp"%>
<%@ page import="java.util.ArrayList"%>

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
	
	int pageNumber = 1;
	if(request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
	<section class="table-container">
		<div class="inner">
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
					<%
					JspDAO jspDAO = new JspDAO();
					ArrayList<Jsp> list = jspDAO.getList(pageNumber);
					for(int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%= list.get(i).getJspID() %></td>
						<td><a href="view.jsp?jspID=<%= list.get(i).getJspID()%>"><%= list.get(i).getJspTitle() %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getJspDate().substring(0,11) + list.get(i).getJspDate().substring(11,13)+"시" +list.get(i).getJspDate().substring(14,16)+"분" %></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<button>
				<a href="write.jsp">글쓰기</a>
			</button>
		</div>
	</section>


</body>
</html>