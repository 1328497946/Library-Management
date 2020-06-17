package mysql;
import java.sql.*;
import java.util.ArrayList;
public class ConnPool {
	ArrayList<Connection>list = new ArrayList<Connection>();
	public ConnPool() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		for(int i = 0; i < 15; i++) {
			try {
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?characterEncoding=utf-8", "root", "root");
				list.add(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public synchronized Connection getOneCon() {
		if(list.size() > 0) {
			return list.remove(0);
		} else {
			return null;
		}
	}
	public synchronized void releaseCon(Connection con) {
		list.add(con);
	}
}
