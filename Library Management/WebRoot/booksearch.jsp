<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.sql.*"%>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>booksearch</title>
</head>
<body>
<form action="" method="get">
	<label>Book Search
		<input type="search" name="search">
		<input type="submit" value="Search">
	</label>
</form>
<%
	String str = request.getParameter("search");
	if(str != null && str != "")
	{
		out.print("<h3>您搜索的字段是" + str + "</h3>");
		Statement st = null;
		ResultSet rs = null;
		Connection conn = null;
		try{  
			Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
			String url = "jdbc:mysql://localhost:3306/library"; //数据库名
			String username = "root";  //数据库用户名
			String password = "root";  //数据库用户密码
			conn = DriverManager.getConnection(url, username, password);  //连接状态
			if(conn == null)
			{  
			    out.print("连接失败！");  
			}
			st = conn.createStatement();
			String sql_search = "select * from contents where name like " + "'%" +str + "%'";
			rs = st.executeQuery(sql_search);
			if(rs.wasNull() == true) {
				out.print("对不起没有关于" + str + "的书");
				return;
			}
			out.print("<table>");
			out.print("<tr><th>书名</th><th>作者</th><th>出版社</th><th>ISBN</th></tr>");
			while (rs.next()){
				out.print("<tr>");
				out.print("<td>" + rs.getString("name") + "</td>");
				out.print("<td>" + rs.getString("author") + "</td>");
				out.print("<td>" + rs.getString("publish") + "</td>");
				out.print("<td>" + rs.getString("ISBN") + "</td>");
				out.print("</tr>");
			}
	      	}catch(Exception e){        
				out.print("数据库连接异常！"); 
			}
			finally{
				rs.close();
				st.close();
				conn.close();
			}
	} else if(str == "")
	{
		out.print("请输入搜索的书名");
	}
	
%>
</body>
</html>