/**
 * 
 */
/**
 * @author ÷Ï«Ï
 *
 */
package SQLConnect;
import java.sql.*;
public class SQLConnect {
	private String drv = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/library";
	private String user="root";
	private String password="123456";
	private Connection conn = null;
	public SQLConnect() {
		// TODO Auto-generated constructor stub
	}
	public String getDrv() {
		return drv;
	}
	public void setDrv(String drv) {
		this.drv = drv;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Connection getConn() {
		return conn;
	}
	public void setConn(Connection conn) {
		this.conn = conn;
	}
	public boolean createConn() {
		boolean success=false;
		try {
			Class.forName(drv).newInstance();
			conn = DriverManager.getConnection(url,user,password);
			success  = true;
		}catch(SQLException e){
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return success;
	}
	
}