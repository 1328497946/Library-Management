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

	%>
	<jsp:include page="include/header.jsp"/>
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
				out.print("<tr>");
				out.print("<td>"+rs.getString("book_id")+"</td>");
				out.print("<td>"+rs1.getString("name")+"</td>");
				out.print("<td>"+rs.getString("lend_date")+"</td>");
				out.print("<td>"+rs.getString("should_backday")+"</td>");
				out.print("<td>"+rs.getString("back_date")+"</td>");
				out.print("<td>"+rs.getString("timeout")+"</td>");		
				out.print("<td>"+rs.getString("timeout_days")+"</td>");
				out.print("</td>");
			if(rs.getString("back_date")==null){
				out.print("<td><a href='归还.jsp?'>归还</a></td>");
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