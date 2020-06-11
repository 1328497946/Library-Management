<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javabean.JavaBean.*"%>
<%@ page import="mysql.ConnPool.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书馆管理系统</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<%
	String str = (String)session.getAttribute("user");
	if(str == null) {
		str = "未登录";
	}
	String type = (String)session.getAttribute("type");
	if(type == null) {
		type="";
	}
%>
<header>
	<ul>
		<li><a href="booksearch.jsp">图书查询</a></li>
		<li><a href="reader-login.jsp">读者信息</a></li>
		<li><a href="#">借阅历史</a></li>
		<li><a href="#">违章信息</a></li>
		<li><a href="#">读者规则</a></li>
		<li><a href="admin-login.jsp">管理员界面</a>
	</ul>
	<h1><a href="index.jsp">图书管理系统</a></h1>
	<p><%
			out.print(type);
			out.print(str);
	%></p>
</header>
<h2>最新上架的30本书</h2>
<table>
<tr><th>书名</th><th>出版社</th><th>作者</th><th>出版日期</th><th>简介</th><th>ISBN</th><th>语言</th><th>价格</th><th>库存</th></tr>
	<jsp:useBean id="conpool" class="mysql.ConnPool" scope="application"/>
	<%
		Statement st = null;
		ResultSet rs = null;
		Connection con = null;
		try {
			con = conpool.getOneCon();
			if(con == null) {
				out.print("人数过多，稍后访问");
				return;
			}
			st = con.createStatement();
			rs = st.executeQuery("select * from contents limit 0,30");
			while(rs.next()) {
				out.print("<tr><td>"+rs.getString("name")+"</td>");
				out.print("<td>"+rs.getString("author")+"</td>");
				out.print("<td>"+rs.getString("publish")+"</td>");
				out.print("<td>"+rs.getString("pub_date")+"</td>");
				out.print("<td>"+rs.getString("introduction").subSequence(0,7)+"...</td>");
				out.print("<td>"+rs.getString("ISBN")+"</td>");
				out.print("<td>"+rs.getString("language")+"</td>");
				out.print("<td>"+rs.getString("price")+"</td>");
				out.print("<td>"+rs.getString("surplus")+"</td></tr>");
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
<footer>
<small>All rights reserved. Copyright&copy; Mr.Zhu Mr.Yao Mr.Wang</small>
</footer>
</body>
</html>