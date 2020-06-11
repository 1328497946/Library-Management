<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.io.*,java.util.*,java.sql.* ,java.text.SimpleDateFormat"%>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<jsp:useBean id="conpool" class="mysql.ConnPool" scope="application"/>
	<head>
		<meta charset="utf-8">
		<title>违章信息</title>
		<link rel="stylesheet" type="text/css" href="css/styles.css">
		
	</head>
	<body>
	<%
	String str1 = (String)session.getAttribute("user");
	String type = (String)session.getAttribute("type");
	if(str1 == null || type != "reader") {
		response.getWriter().print("请先登录，3秒后自动跳转");
		response.setHeader("Refresh", "3;URL=reader-login.jsp");
		return;
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
		if(str1==null&&type==null){
			out.print("未登录");
		}else if(type=="admin"){
			out.print("<a href='logout.jsp'>管理员"+str1+"</a>");
		}else if(type=="reader"){
			out.print("<a href='logout.jsp'>读者"+str1+"</a>");
		};
	%></p>
</header>
		<h1>违章信息</h1>
		<table border="1">
			<tr>
				<td>流水号</td>
				<td>图书号</td>
				<td>图书名</td>
				<td>借出日期</td>
				<td>应还日期</td>
				<td>归还日期</td>
				<td>是否逾期</td>
				<td>逾期天数</td>
			</tr>
		<%
			String readerid = (String)session.getAttribute("readerid");
	    	//String readerid = "1";
			Statement st = null;
			Statement st1 = null;
			ResultSet rs = null;
			ResultSet rs1 = null;
			Connection conn = null;
			conn = conpool.getOneCon();
			if(conn!=null){
				st = conn.createStatement();
				String sql_Query = "select * from bookrend where reader_id="+readerid;
				rs=st.executeQuery(sql_Query);
					
				while(rs.next()){
					String sql_query = "select * from contents where book_id="+rs.getString("book_id");
					st1 =conn.createStatement();
					rs1 =st1.executeQuery(sql_query);
					while(rs1.next()){
		%>
			<tr>
				<td><%=rs.getString("ser_num") %></td>
				<td><%=rs.getString("book_id") %></td>
				<td><%=rs1.getString("name") %></td>
				<td><%=rs.getString("lend_date") %></td>
				<td><%=rs.getString("should_back_time") %></td>
				<td><%=rs.getString("back_date") %></td>
				<td><%=rs.getString("timeout") %></td>
				<td><%=rs.getString("timeout_days") %></td>
		<%
				}
				}
			}
		%>
		</table>
	</body>
</html>