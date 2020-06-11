<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.sql.*"%>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书搜索</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<%
	String str1 = (String)session.getAttribute("user");
	String type = (String)session.getAttribute("type");
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
		if(str1==null&&type==null){
			out.print("未登录");
		}else if(type=="admin"){
			out.print("<a href='logout.jsp'>管理员"+str1+"</a>");
		}else if(type=="reader"){
			out.print("<a href='logout.jsp'>读者"+str1+"</a>");
		};
	%></p>
</header>
<form action="" method="get">
	<label>Book Search
		<input type="search" name="search">
		<input type="submit" value="Search">
	</label>
</form>
<jsp:useBean id="conpool" class="mysql.ConnPool" scope="application"/>
<table>
<%
	String str = request.getParameter("search");
	if(str != null && str != "")
	{
		out.print("<h3>您搜索的字段是" + str + "</h3>");
		Statement st = null;
		ResultSet rs = null;
		Connection conn = null;
		conn = conpool.getOneCon();
			if(conn != null)
			{
			    st = conn.createStatement();
				String sql_search = "select * from contents where name like " + "'%" +str + "%'";
				rs = st.executeQuery(sql_search);
				if(rs.isBeforeFirst()==false) {
					out.print("对不起没有关于" + str + "的书");
					return;
				}else{
					
					out.print("<table >");
					out.print("<tr><th>书名</th><th>作者</th><th>出版</th><th>ISBN</th></tr>");
					while (rs.next()){
%>
						<tr>
						<td><%=rs.getString("name") %></td>
						<td><%=rs.getString("author") %></td>
						<td><%=rs.getString("publish") %></td>
						<td><%=rs.getString("ISBN") %></td>
						<td><a href="bookinfo.jsp?book_id=<%=rs.getString("book_id")%>">详细信息</a></td>    
						</tr>
<%
					}
					out.print("</table>");
					out.print("</form>");
				}
			}else{
				out.print("连接失败");
			}
	} else if(str == "")
	{
		out.print("请输入搜索的书名");
	}
	
%>
</table>
</body>
</html>