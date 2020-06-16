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
	<jsp:include page="include/header.jsp"/>
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
			//conn = conpool.getOneCon();
			Class.forName("com.mysql.jdbc.Driver");
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