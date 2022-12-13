<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="jsp.JspDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="jsp" class="jsp.Jsp" scope="page" />
<jsp:setProperty name="jsp" property="jspID" />
<%-- <jsp:setProperty name="jsp" property="jspTitle" /> --%>
<%-- <jsp:setProperty name="jsp" property="jspDate" /> --%>
<%-- <jsp:setProperty name="jsp" property="userID" /> --%>
<%-- <jsp:setProperty name="jsp" property="jspContent" /> --%>
<%-- <jsp:setProperty name="jsp" property="jspAvailable" /> --%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 웹 사이트</title>
</head>
<body>
	
	<%
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String)session.getAttribute("userID");
		jsp.setUserID(userID);
	}
	int jspID = 0;
	if(request.getParameter("jspID") != null) {
		jspID = Integer.parseInt(request.getParameter("jspID"));
	}
		JspDAO userDAO = new JspDAO();
		int result = userDAO.delete(jspID);
		if(result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글 삭제에 실패하셨습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			session.setAttribute("userID", jsp.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'post.jsp'");
			script.println("</script>");
		}
	%>
</body>
</html>