<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>读者信息</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<%
	String str = (String)session.getAttribute("user");
	String type = (String)session.getAttribute("type");
	if(str == null || type != "reader") {
		response.sendRedirect("reader-login.jsp");
		return;
	}
%>
<header>
	<ul>
		<li><a href="booksearch.jsp">图书查询</a></li>
		<li><a href="reader-login.jsp">读者信息</a></li>
		<li><a href="lendhistory.jsp">借阅历史</a></li>
		<li><a href="error.jsp">违章信息</a></li>
		<li><a href="rules.jsp">读者规则</a></li>
		<li><a href="admin-login.jsp">管理员界面</a>
	</ul>
	<h1><a href="index.jsp">图书管理系统</a></h1>
	<p><%
		if(str==null||type!="reader"){
			out.print("未登录");
		}else {
			out.print("<a href='logout.jsp'>读者"+str+"</a>");
		};
	%></p>
</header>
<h1>读者信息</h1>
<jsp:useBean id="conpool" class="mysql.ConnPool" scope="application"/>
<table>
	<tr><th>姓名</th><th>性别</th><th>生日</th><th>地址</th><th>电话</th><th>邮箱</th></tr>
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
			rs = st.executeQuery("select * from readers where reader_id="+str);
			while(rs.next()) {
				out.print("<tr>");
				out.print("<td>"+rs.getString("name")+"</td>"); 
				out.print("<td>"+rs.getString("sex")+"</td>");
				out.print("<td>"+rs.getString("birth")+"</td>");
				out.print("<td>"+rs.getString("address") + "</td>");
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
</body>
</html>