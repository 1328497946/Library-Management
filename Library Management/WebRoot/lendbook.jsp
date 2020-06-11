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
	<jsp:useBean id="conpool" class="mysql.ConnPool" scope="application"/>
	<body>
		<%
			String book_id = request.getParameter("book_id");
		out.print(book_id);
			String str1 = (String)session.getAttribute("user");
			String type = (String)session.getAttribute("type");
			//String readerid = "1";
			if(str1 ==null || type!="reader"){
				response.getWriter().print("请先登录，3秒后自动跳转");
				response.setHeader("Refresh", "3;URL=reader-login.jsp");
			}else{
				PreparedStatement pstm=null;
				int rs ;
				Connection conn = null;
				//application.setAttribute("ser_num", "0"); 
			
					conn = conpool.getOneCon();
					java.util.Date now = new java.util.Date();
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					String lend_date = dateFormat.format( now ); 
					Calendar calendar = Calendar.getInstance(); //得到日历
			        calendar.setTime(now);//把当前时间赋给日历
			        calendar.add(Calendar.DAY_OF_MONTH, 60); //设置为后2月，可根据需求进行修改
			        now = calendar.getTime();//获取2个月后的时间
			        String back_date = dateFormat.format( now );
			        //out.print(should_back_time);
			        String sql_insert = "insert into bookrend(reader_id,book_id,lend_date,back_date) values("+Integer.parseInt(str1)+','+Integer.parseInt(book_id)+","+"'"+lend_date+"'"+","+"'"+back_date+"'"+");";
			        pstm=conn.prepareStatement(sql_insert);
			        //pstm.setString(6, "未归还");
			        try {
			        	rs =pstm.executeUpdate();
			        	if(rs>0){
				        	response.getWriter().print("借阅成功，3秒后自动跳转");
				    		response.setHeader("Refresh", "3;URL=lendhistory.jsp");
				        }
			        } catch(SQLException e) {
						e.printStackTrace();
			        }	
			}
		%>
	</body>
</html>