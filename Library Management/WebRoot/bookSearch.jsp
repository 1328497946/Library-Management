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
			Class.forName("com.mysql.cj.jdbc.Driver");  ////驱动程序名
			String url = "jdbc:mysql://localhost:3306/library?characterEncoding=utf-8&serverTimezone=UTC"; //数据库名
			String username = "root";  //数据库用户名
			String password = "123456";  //数据库用户密码
			conn = DriverManager.getConnection(url, username, password);  //连接状态
			if(conn != null)
			{  
			    out.print("连接成功！");  
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
						<td><a href="详细信息.jsp?book_id=<%=rs.getString("book_id")%>">详细信息</a></td>    
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
</body>
</html>