<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员登录</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<%
	String str = (String)session.getAttribute("user");
	String type = (String)session.getAttribute("type");
	if(null != str && type == "admin") {
		response.sendRedirect("admin-manager.jsp");
		return;
	}
%>
<header>
	<ul>
		<li><a href="booksearch.jsp">图书查询</a></li>
		<li><a href="readerinfo.jsp">读者信息</a></li>
		<li><a href="lendhistory.jsp">借阅历史</a></li>
		<li><a href="error.jsp">违章信息</a></li>
		<li><a href="rules.jsp">读者规则</a></li>
		<li><a href="admin-login.jsp">管理员界面</a>
	</ul>
	<h1><a href="index.jsp">图书管理系统</a></h1>
	<p><%
		if(str==null||type!="admin"){
			out.print("未登录");
		}else {
			out.print("<a href='logout.jsp'>管理员"+str+"</a>");
		};
	%></p>
</header>
<form action="AdminCheck" method="post">
		<label>用户：
			<input type="text" name="username">
		</label>
		<label>密码：
			<input type="password" name="password">
		</label>
		<input type="submit" name="submit" value="登录">
	</form>
</body>
</html>