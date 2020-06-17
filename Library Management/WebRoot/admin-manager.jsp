<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书馆管理管理界面</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<%
	String str = (String)session.getAttribute("user");
	String type = (String)session.getAttribute("type");
	if(null == str || type != "admin") {
		response.sendRedirect("admin-login.jsp");
		return;
	}
%>
<jsp:include page="include/header.jsp"/>
<h1><a href="allbook.jsp">图书馆所有的书籍</a></h1>
<h1><a href="readercards.jsp">所有借阅卡信息</a></h1>
<h1><a href="readers.jsp">所有读者信息</a></h1>
</body>
</html>