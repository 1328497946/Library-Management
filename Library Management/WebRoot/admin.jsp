<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书馆管理员后台</title>
</head>
<body>
<jsp:useBean id="conpool" class="mysql.ConnPool" scope="application"/>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	request.setCharacterEncoding("utf-8");
	String sub = request.getParameter("submit");
	if(sub == null) {
		out.print("非法访问");
		return;
	} else if(sub == "") {
		out.print("请输如用户名字和密码!");
	}
	con = conpool.getOneCon();
	st = con.createStatement();
	rs = st.executeQuery("select * from dbuser where username='" + username + "' and password='" + password + "'");
	if(rs.next()) {
		out.print("登录成功");
		session.setAttribute("login", true);
		response.sendRedirect("admin-manager.jsp");
	}
%>
</body>
</html>