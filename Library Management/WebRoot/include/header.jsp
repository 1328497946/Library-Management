<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String str = (String)session.getAttribute("user");
	String type = (String)session.getAttribute("type");
	if(str == null) {
		str = "未登录";
	} else if(type == "admin") {
		str="管理员："+str;
	} else {
		str = "读者："+str;
	}
%>
<header>
	<ul>
		<li><a href="booksearch.jsp">图书查询</a></li>
		<li><a href="reader-login.jsp">读者信息</a></li>
		<li><a href="lendhistory.jsp">借阅历史</a></li>
		<li><a href="error.jsp">违章信息</a></li>
		<li><a href="rules.jsp">读者规则</a></li>
		<li><a href="admin-login.jsp">管理员界面</a>
	</ul>
	<h1><a href="index.jsp">图书管理系统</a></h1>
	<p>
		<span>
			<%if(str.equals("未登录")) {%>
				<a href="reader-login.jsp">读者登录</a>
			<%}else{%>
			<a href="logout.jsp"><%=str %></a>
			<%} %>
		</span>
	</p>
</header>