<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="jsp.JspDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="jsp" class="jsp.Jsp" scope="page" />
<jsp:setProperty name="jsp" property="jspID" />
<jsp:setProperty name="jsp" property="jspTitle" />
<jsp:setProperty name="jsp" property="jspDate" />
<jsp:setProperty name="jsp" property="userID" />
<jsp:setProperty name="jsp" property="jspContent" />
<jsp:setProperty name="jsp" property="jspAvailable" />
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
	if(jsp.getJspTitle()   == null ||
	   jsp.getJspContent() == null) {
	
		PrintWriter script = response.getWriter();
		script.println("<script>");	
		script.println("alert('입력이 안된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		JspDAO userDAO = new JspDAO();
		int result = userDAO.write(jsp.getJspTitle(), jsp.getUserID(), jsp.getJspContent());
		if(result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기에 실패하셨습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			session.setAttribute("userID", jsp.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'post.jsp'");
			script.println("</script>");
		}
	}
	%>
</body>
</html>