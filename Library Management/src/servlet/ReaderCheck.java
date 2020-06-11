package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

/**
 * Servlet implementation class AdminCheck
 */
@WebServlet("/ReaderCheck")
public class ReaderCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReaderCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().print("非法访问，3秒后自动跳转");
		response.setHeader("Refresh", "3;URL=reader-login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			response.getWriter().println(e.getStackTrace());
		}
		Connection con = null;
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?characterEncoding=utf-8", "root", "root");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.getWriter().println(e.getStackTrace());
		}
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Statement st = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		if(username == "" || password == "") {
			response.getWriter().println("<p>请输如用户名字与密码！</p>");
			//out.print("请输如用户名字和密码!");
			response.setHeader("Refresh", "3;URL=admin-login.jsp");
			return;
		}
		try {
			st = con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.getWriter().println(e.getStackTrace());
		}
		try {
			rs = st.executeQuery("select reader_id,password from readcard where reader_id='"+username+"' and password='"+password+"'");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.getWriter().println(e.getStackTrace());
		}
		try {
			if(rs.next()) {
				//out.print("登录成功");
				HttpSession session =  request.getSession();
				session.setAttribute("user", username);
				session.setAttribute("type", "reader");
				response.sendRedirect("readerinfo.jsp"+"?reader_id="+username);
			} else {
				response.getWriter().println("用户名密码错误!3秒后自动跳转");
				//out.print("用户名密码错误!3秒后自动跳转");
				response.setHeader("Refresh", "3;URL=reader-login.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.getWriter().println(e.getStackTrace());
		}
	}

}
