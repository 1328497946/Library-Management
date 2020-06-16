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
		response.getWriter().print("闈炴硶璁块棶锛�3绉掑悗鑷姩璺宠浆");
		response.setHeader("Refresh", "3;URL=reader-login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			response.getWriter().println(e.getStackTrace());
		}
		Connection con = null;
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?characterEncoding=utf-8&serverTimezone=UTC", "root", "123456");
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
			response.getWriter().println("<p>璇疯緭濡傜敤鎴峰悕瀛椾笌瀵嗙爜锛�</p>");
			//out.print("璇疯緭濡傜敤鎴峰悕瀛楀拰瀵嗙爜!");
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
				//out.print("鐧诲綍鎴愬姛");
				HttpSession session =  request.getSession();
				session.setAttribute("user", username);
				session.setAttribute("type", "reader");
				response.sendRedirect("readerinfo.jsp");
			} else {
				response.getWriter().println("鐢ㄦ埛鍚嶅瘑鐮侀敊璇�!3绉掑悗鑷姩璺宠浆");
				//out.print("鐢ㄦ埛鍚嶅瘑鐮侀敊璇�!3绉掑悗鑷姩璺宠浆");
				response.setHeader("Refresh", "3;URL=reader-login.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.getWriter().println(e.getStackTrace());
		}
	}

}
