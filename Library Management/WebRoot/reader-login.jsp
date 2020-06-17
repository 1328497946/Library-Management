<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>读者登录</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<jsp:include page="include/header.jsp"/>
<form action="ReaderCheck" method="post">
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