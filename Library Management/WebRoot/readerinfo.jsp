<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<h1>读者信息</h1>
<%
	String str = (String)session.getAttribute("type");
	if(str == "admin" || str == null) {
		response.sendRedirect("reader-login.jsp");
		return;
	}
%>
<jsp:useBean id="conpool" class="mysql.ConnPool" scope="application"/>
<h1>所有读者信息</h1>
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
			rs = st.executeQuery("select * from readers");
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