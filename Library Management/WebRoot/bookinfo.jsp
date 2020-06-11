<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.io.*,java.util.*,java.sql.*"%>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>详细信息</title>
		<link rel="stylesheet" type="text/css" href="css/styles.css">
	</head>
	<body>
	<%
	String str = (String)session.getAttribute("user");
	String type = (String)session.getAttribute("type");
	if(str == null) {
		str = "未登录";
	} else if(type == "admin") {
		str="管理员："+str;
	} else {
		str = "读者："+str;
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
	<jsp:useBean id="conpool" class="mysql.ConnPool" scope="application"/>
		<h1>本书的详细信息如下：</h1>
		<%
			String book_id = request.getParameter("book_id");
			//out.print(ISBN);
			Statement st = null;
			ResultSet rs = null;
			Connection conn = null;
			conn = conpool.getOneCon();
			if(conn != null){
				st = conn.createStatement();
				String sql_search = "select * from contents where book_id=" + book_id;
				rs = st.executeQuery(sql_search);
				if(rs.next()){
		%>     
		           <form action="lendbook.jsp" method="get">
		            	<span>书籍名称：</span>
		            	<span><%=rs.getString("name")%></span><br>
		            
		            	<span>书籍ID：</span>
		           		<input type="text" name="book_id" value=<%=rs.getString("book_id")%> /><br>
		            	<span>书籍简介：</span>
						<span><%=rs.getString("introduction")%></span><br>
						<input type="submit" value="借阅">
					</form>
		<%
				}
			}
		%>
		
	</body>
</html>