<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>退出登录</title>
</head>
<body>
<% 
	response.setContentType("text/html; charset=utf-8");
	response.getWriter().print("已退出，3秒后自动跳转");
	session.removeAttribute("user");
	session.removeAttribute("type");
	response.setHeader("Refresh", "3;URL=index.jsp");
%>
</body>
</html>