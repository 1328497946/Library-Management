package Dao;
import java.sql.*;
import SQLConnect.SQLConnect;
import entity.book;
public class bookDao {
	//往contents表中插入信息
	public int insertBook(book book1) {
		int rs = 0;
		SQLConnect conn = new SQLConnect();
		Connection con = conn.getConn();
		PreparedStatement pstm=null;
		String sql_insert = "insert into contents(book_id,name,author,publish,ISBN,introduction,language,price,pub_data,class_id,surplus) values (?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstm = con.prepareStatement(sql_insert);
			pstm.setString(1,book1.getBook_id());
			pstm.setString(2,book1.getName());
			pstm.setString(3,book1.getAuthor());
			pstm.setString(4,book1.getPublish());
			pstm.setString(5,book1.getISBN());
			pstm.setString(6,book1.getIntroduction());
			pstm.setString(7,book1.getLanguage());
			pstm.setString(8,book1.getPrice());
			pstm.setString(9,book1.getPub_date());
			pstm.setString(10,book1.getClass_id());
			pstm.setString(11,book1.getSurplus());
			rs = pstm.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	//查询contents表中所有数据
	public ResultSet queryBook() {
		PreparedStatement pstm=null;
		ResultSet rs = null;
		SQLConnect conn = new SQLConnect();
		Connection con = conn.getConn();
		String sql_query = "select * from contents";
		try {
			pstm = con.prepareStatement(sql_query);
			rs = pstm.executeQuery();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	//查询contents表中指定id的数据
	public ResultSet selectBook(book book1) {
		PreparedStatement pstm=null;
		ResultSet rs = null;
		SQLConnect conn = new SQLConnect();
		Connection con = conn.getConn();
		String sql_select = "select * from contents where book_id=?";
		try {
			
			pstm = con.prepareStatement(sql_select);
			pstm.setString(1,book1.getBook_id());
			rs = pstm.executeQuery();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	public int updateBook(book,book1) {
		int rs = 0;
		SQLConnect conn = new SQLConnect();
		Connection con = conn.getConn();
		PreparedStatement pstm=null;
		String sql_update="update contents set name=?,author=?,publish=?,ISBN=?,introduction=?,language=?,price=?,pub_data=?,class_id=?,surplus=? where book_id=?";
		try {
			pstm = con.prepareStatement(sql_update);
			pstm.setString(1,book1.getName());
			pstm.setString(2,book1.getAuthor());
			pstm.setString(3,book1.getPublish());
			pstm.setString(4,book1.getISBN());
			pstm.setString(5,book1.getIntroduction());
			pstm.setString(6,book1.getLanguage());
			pstm.setString(7,book1.getPrice());
			pstm.setString(8,book1.getPub_date());
			pstm.setString(9,book1.getClass_id());
			pstm.setString(10,book1.getSurplus());
			pstm.setString(11,book1.getBook_id());
			rs = pstm.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	public int deleteBook(book book1) {
		int rs = 0;
		SQLConnect conn = new SQLConnect();
		Connection con = conn.getConn();
		PreparedStatement pstm=null;
		String sql_delete="delete from contents where book_id=?";
		try {
			pstm = con.prepareStatement(sql_delete);
			pstm.setString(1, book1.getBook_id());
			rs = pstm.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
}
