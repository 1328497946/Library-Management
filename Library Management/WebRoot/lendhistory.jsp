<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.io.*,java.util.*,java.sql.* ,java.text.SimpleDateFormat"%>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>借阅历史</title>
		<link rel="stylesheet" type="text/css" href="css/styles.css">
	</head>
	<body>
	<header>
	<%
			String readerid = (String)session.getAttribute("user");
			String str = readerid;
			String str1 = (String)session.getAttribute("user");
			String type = (String)session.getAttribute("type");
			//String readerid = "1";
			if(str1 ==null || type!="reader"){
				response.getWriter().print("请先登录，3秒后自动跳转");
				response.setHeader("Refresh", "3;URL=reader-login.jsp");
				return;
			}
			%>
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
	
	<jsp:useBean id="conpool" class="mysql.ConnPool" scope="application"/>
		<h1>借阅历史</h1>
		<table border="1">
			<tr>
				<td>图书号</td>
				<td>图书名</td>
				<td>借出日期</td>
				<td>应还日期</td>
				<td>归还日期</td>
				<td>是否逾期</td>
				<td>逾期天数</td>
				<td>归还状态</td>
			</tr>
			<%
	    	//String readerid = "1";
			Statement st = null;
			Statement st1 = null;
			ResultSet rs = null;
			ResultSet rs1 = null;
			Connection conn = null;
			//conn = conpool.getOneCon();
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?characterEncoding=utf-8&serverTimezone=UTC", "root", "123456");
			if(conn!=null){
				st = conn.createStatement();
				String sql_Query = "select * from bookrend where reader_id="+readerid;
				rs=st.executeQuery(sql_Query);
					
				while(rs.next()){
					String sql_query = "select * from contents where book_id="+rs.getString("book_id");
					st1 =conn.createStatement();
					rs1 =st1.executeQuery(sql_query);
					while(rs1.next()){
				out.print("<tr>");
				out.print("<td>"+rs.getString("book_id")+"</td>");
				out.print("<td>"+rs1.getString("name")+"</td>");
				out.print("<td>"+rs.getString("lend_date")+"</td>");
				out.print("<td>"+rs.getString("shuold_back_time")+"</td>");
				out.print("<td>"+rs.getString("back_date")+"</td>");
				out.print("<td>"+rs.getString("timeout")+"</td>");		
				out.print("<td>"+rs.getString("timeout_days")+"</td>");
				out.print("</td>");
			if(rs.getString("back_date")==null){
				out.print("<td><a href='归还.jsp?ser_num="+rs.getString("book_id")+"'>归还</a></td>");
			}else{
				out.print("<td>已归还</td>");
			}
					}
				}
			}
		%>
		</table>
	</body>
</html>