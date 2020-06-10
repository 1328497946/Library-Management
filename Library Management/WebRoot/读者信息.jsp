<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.io.*,java.util.*,java.sql.* ,java.text.SimpleDateFormat"%>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>读者信息</title>
	</head>
	<body>
		<%
			String readerid = (String)session.getAttribute("readerid");
		    //String readerid = "1";
			Statement st = null;
			ResultSet rs = null;
			Connection conn = null;
			Class.forName("com.mysql.cj.jdbc.Driver");  ////驱动程序名
			String url = "jdbc:mysql://localhost:3306/library?characterEncoding=utf-8&serverTimezone=UTC"; //数据库名
			String username = "root";  //数据库用户名
			String password = "123456";  //数据库用户密码
			conn = DriverManager.getConnection(url, username, password);
			if(conn!=null){
				st = conn.createStatement();
				String sql_Query = "select * from readers where reader_id="+readerid;
				rs=st.executeQuery(sql_Query);
				if(rs.next()){
		%>
			<form action="修改信息.jsp" method="get">
				<span>借阅卡号：</span>
				<input type="text" name="reader_id" value=<%=rs.getString("reader_id")%> readonly="readonly"/><br>
				<span>姓名：</span>
				<input type="text" name="reader_name" value=<%=rs.getString("name")%> readonly="readonly"/><br>
				<span>性别：</span>
				<input type="text" name="sex" value=<%=rs.getString("sex")%> readonly="readonly"/><br>
				<span>生日：</span>
				<input type="text" name="birth" value=<%=rs.getString("birth")%> readonly="readonly"/><br>
				<span>地址：</span>
				<input type="text" name="address" value=<%=rs.getString("address")%> readonly="readonly"/><br>
				<span>电话：</span>
				<input type="text" name="phone" value=<%=rs.getString("phone")%> readonly="readonly"/><br>
				<span>邮箱：</span>
				<input type="text" name="email" value=<%=rs.getString("email")%> readonly="readonly"/><br>
				<input type="submit" value="修改">
			</form>
		<% 
				}
			}
			
		%>
		
	</body>
	</html>