<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.io.*,java.util.*,java.sql.* ,java.text.SimpleDateFormat"%>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>提交</title>
	</head>
	<body>
		<%
			String reader_id = request.getParameter("reader_id");
			String name = request.getParameter("reader_name");
			String sex = request.getParameter("sex");
			String birth = request.getParameter("birth");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			PreparedStatement pstm=null;
			int rs ;
			Connection conn = null;
			Class.forName("com.mysql.cj.jdbc.Driver");  ////驱动程序名
			String url = "jdbc:mysql://localhost:3306/library?characterEncoding=utf-8&serverTimezone=UTC"; //数据库名
			String username = "root";  //数据库用户名
			String password = "123456";  //数据库用户密码
			
				conn = DriverManager.getConnection(url, username, password);
				String sql_update = "update readers set name=?,sex=?,birth=?,address=?,phone=?,email=? where reader_id=?";
				pstm = conn.prepareStatement(sql_update);
				pstm.setString(1,name);
				pstm.setString(2,sex);
				pstm.setString(3,birth);
				pstm.setString(4,address);
				pstm.setString(5,phone);
				pstm.setString(6,email);
				pstm.setString(7,reader_id);
				rs = pstm.executeUpdate();
				if(rs>0){
					out.print("修改成功,请刷新读者信息界面获得最新信息");
				}
			
			
		%>
	</body>
</html>