<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.io.*,java.util.*,java.sql.* ,java.text.SimpleDateFormat"%>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>修改信息</title>
	</head>
	<body>
		<form action="提交.jsp" method="get">
			<span>借阅卡号：</span>
			<input type="text" name="reader_id" value=<%=request.getParameter("reader_id")%> readonly="readonly" /><br>
			<span>姓名：</span>
			<input type="text" name="reader_name" value=<%=request.getParameter("reader_name")%> /><br>
			<span>性别：</span>
			<input type="text" name="sex" value=<%=request.getParameter("sex")%> /><br>
			<span>生日：</span>
			<input type="text" name="birth" value=<%=request.getParameter("birth")%> /><br>
			<span>地址：</span>
			<input type="text" name="address" value=<%=request.getParameter("address")%> /><br>
			<span>电话：</span>
			<input type="text" name="phone" value=<%=request.getParameter("phone")%> /><br>
			<span>邮箱：</span>
			<input type="text" name="email" value=<%=request.getParameter("email")%> /><br>
			<input type="submit" value="提交">
		</form>
	</body>
</html>