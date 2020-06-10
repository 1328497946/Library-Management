<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.io.*,java.util.*,java.sql.* ,java.text.SimpleDateFormat"%>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>归还</title>
</head>
<body>
	<%
		String ser_num = request.getParameter("ser_num");
		PreparedStatement pstm=null;
		Statement st1 = null;
		ResultSet rs1 = null;
		int rs;
		Connection conn = null;
		Class.forName("com.mysql.cj.jdbc.Driver");  ////驱动程序名
		String url = "jdbc:mysql://localhost:3306/library?characterEncoding=utf-8&serverTimezone=UTC"; //数据库名
		String username = "root";  //数据库用户名
		String password = "123456";  //数据库用户密码
		conn = DriverManager.getConnection(url, username, password);
		java.util.Date now = new java.util.Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String back_date = dateFormat.format( now ); 
		String should_back_time = null;
		st1 = conn.createStatement();
		String sql_query = "select * from bookrend where ser_num="+ser_num;
		rs1 = st1.executeQuery(sql_query);
		if(rs1.next()){
			should_back_time = rs1.getString("should_back_time");
		}
		java.util.Date d1 = dateFormat.parse(back_date);
		java.util.Date d2 = dateFormat.parse(should_back_time);
		if(d1.before(d2)){
			String sql_update = "update bookrend set back_date=?,timeout=?,timeout_days=? where ser_num=?";
			pstm = conn.prepareStatement(sql_update);
			pstm.setString(1,back_date);
			pstm.setString(2, "否");
			pstm.setString(3, "0");
			pstm.setString(4, ser_num);
			rs = pstm.executeUpdate();
			if(rs>0){
				out.print("归还成功，请刷新借阅历史界面查看");
			}
		}else{
			long daysBetween=(d1.getTime()-d2.getTime()+1000000)/(60*60*24*1000);
			String timeout_days = String.valueOf(daysBetween);
			String sql_update = "update bookrend set back_date=?,timeout=?,timeout_days=? where ser_num=?";
			pstm = conn.prepareStatement(sql_update);
			pstm.setString(1,back_date);
			pstm.setString(2, "是");
			pstm.setString(3, timeout_days);
			pstm.setString(4, ser_num);
			rs = pstm.executeUpdate();
			if(rs>0){
				out.print("归还成功，请刷新借阅历史界面查看");
			}
		}
	%>
</body>
</html>