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
<jsp:include page="include/header.jsp"/>
<h1>图书馆所有的书籍</h1>
<table>
	<tr><th>书名</th><th>作者</th><th>出版社</th><th>出版日期</th><th>简介</th><th>ISBN</th><th>语言</th><th>价格</th><th>库存</th></tr>
	<jsp:useBean id="conpool" class="mysql.ConnPool" scope="application"/>
	<%
		Statement st = null;
		ResultSet rs = null;
		onnection con = null;
		try {
			//con = conpool.getOneCon();
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?characterEncoding=utf-8&serverTimezone=UTC", "root", "123456");
			if(con == null) {
				out.print("人数过多，稍后访问");
				return;
			}
			st = con.createStatement();
			rs = st.executeQuery("select * from contents");
			while(rs.next()) {
				out.print("<tr>");
				out.print("<td>"+rs.getString("name")+"</td>");
				out.print("<td>"+rs.getString("author")+"</td>");
				out.print("<td>"+rs.getString("publish")+"</td>");
				out.print("<td>"+rs.getString("pub_date")+"</td>");
				out.print("<td>"+rs.getString("introduction").subSequence(0,7)+"...</td>");
				out.print("<td>"+rs.getString("ISBN")+"</td>");
				out.print("<td>"+rs.getString("language")+"</td>");
				out.print("<td>"+rs.getString("price")+"</td>");
				out.print("<td>"+rs.getString("surplus")+"</td>");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				if(rs!=null)
					rs.close();
				if(st!=null)
					st.close();
				if(con!=null)
					conpool.releaseCon(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	%>
</table>
<h1>所有读者信息</h1>
<table>
	<tr><th>姓名</th><th>性别</th><th>生日</th><th>地址</th><th>电话</th><th>邮箱</th></tr>
	<%
		try {
			//con = conpool.getOneCon();
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?characterEncoding=utf-8&serverTimezone=UTC", "root", "123456");
			if(con == null) {
				out.print("人数过多，稍后访问");
				return;
			}
			st = con.createStatement();
			rs = st.executeQuery("select * from readers");
			while(rs.next()) {
				out.print("<tr>");
				out.print("<td>"+rs.getString("name")+"</td>"); 
				out.print("<td>"+rs.getString("sex")+"</td>");
				out.print("<td>"+rs.getString("birth")+"</td>");
				out.print("<td>"+rs.getString("address")+"</td>");
				out.print("<td>"+rs.getString("phone")+"</td>");
				out.print("<td>"+rs.getString("email")+"</td>");
				out.print("</tr>");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				if(rs!=null)
					rs.close();
				if(st!=null)
					st.close();
				if(con!=null)
					conpool.releaseCon(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	%>
</table>
<h1>借阅卡信息</h1>
<table>
	<tr><th>姓名</th><th>性别</th><th>生日</th><th>地址</th><th>电话</th><th>邮箱</th><th>是否可用</tr>
	<%
		try {
			//con = conpool.getOneCon();
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?characterEncoding=utf-8&serverTimezone=UTC", "root", "123456");
			if(con == null) {
				out.print("人数过多，稍后访问");
				return;
			}
			st = con.createStatement();
			rs = st.executeQuery("select * from readers left join readcard on readers.reader_id=readcard.reader_id");
			while(rs.next()) {
				out.print("<tr>");
				out.print("<td>"+rs.getString("name")+"</td>"); 
				out.print("<td>"+rs.getString("sex")+"</td>");
				out.print("<td>"+rs.getString("birth")+"</td>");
				out.print("<td>"+rs.getString("address") + "</td>");
				out.print("<td>"+rs.getString("phone")+"</td>");
				out.print("<td>"+rs.getString("email")+"</td>");
				out.print("<td>"+rs.getString("available")+"</td>");
				out.print("</tr>");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				if(rs!=null)
					rs.close();
				if(st!=null)
					st.close();
				if(con!=null)
					conpool.releaseCon(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	%>
</table>
</body>
</html>