<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.io.*,java.util.*,java.sql.*"%>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>详细信息</title>
	</head>
	<body>
		<h1>本书的详细信息如下：</h1>
		<%
			String book_id = request.getParameter("book_id");
			//out.print(ISBN);
			Statement st = null;
			ResultSet rs = null;
			Connection conn = null;
			Class.forName("com.mysql.cj.jdbc.Driver");  ////驱动程序名
			String url = "jdbc:mysql://localhost:3306/library?characterEncoding=utf-8&serverTimezone=UTC"; //数据库名
			String username = "root";  //数据库用户名
			String password = "123456";  //数据库用户密码
			conn = DriverManager.getConnection(url, username, password);  //连接状态
			if(conn != null){
				st = conn.createStatement();
				String sql_search = "select * from contents where book_id=" + book_id;
				rs = st.executeQuery(sql_search);
				if(rs.next()){
		%>     
		           <form action="借阅.jsp" method="get">
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