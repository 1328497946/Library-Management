<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.io.*,java.util.*,java.sql.* ,java.text.SimpleDateFormat"%>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>借阅</title>
	</head>
	<body>
		<%
		    String book_id = request.getParameter("book_id");
			String readerid = (String)session.getAttribute("readerid");
			if(readerid == null){
				out.print("请先登录");
			}else{
				Statement st = null;
				int rs ;
				Connection conn = null;
				Class.forName("com.mysql.cj.jdbc.Driver");  ////驱动程序名
				String url = "jdbc:mysql://localhost:3306/library?characterEncoding=utf-8&serverTimezone=UTC"; //数据库名
				String username = "root";  //数据库用户名
				String password = "123456";  //数据库用户密码
				//application.setAttribute("ser_num", "0"); 
				try{
					conn = DriverManager.getConnection(url, username, password);
					String ser_num;
					if(application.getAttribute("ser_num")==null){
						application.setAttribute("ser_num", "0");
						ser_num="0";
					}else{
						ser_num =(String) application.getAttribute("ser_num");
						int ser_num1 = Integer.parseInt(ser_num);
						ser_num1+=1;
						application.setAttribute("ser_num",Integer.toString(ser_num1));
					}
					java.util.Date now = new java.util.Date();
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
					String lend_date = dateFormat.format( now ); 
					Calendar calendar = Calendar.getInstance(); //得到日历
			        calendar.setTime(now);//把当前时间赋给日历
			        calendar.add(Calendar.DAY_OF_MONTH, 2); //设置为后2月，可根据需求进行修改
			        now = calendar.getTime();//获取2个月后的时间
			        String should_back_time = dateFormat.format( now );
			        String sql_insert = "insert into bookrend(ser_num,reader_id,book_id,lend_date,should_back_time) values('"+ser_num+","+readerid+","+book_id+","+lend_date+","+should_back_time+")";
			        st = conn.createStatement();
			        rs = st.executeUpdate(sql_insert);
			        if(rs>0){
			        	out.print("借阅成功");
			        }
				}catch(Exception e){
					out.print("数据库连接异常");
				}
			}
		%>
	</body>
</html>