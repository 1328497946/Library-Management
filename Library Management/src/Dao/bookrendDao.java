package Dao;
import java.sql.*;
import mysql.ConnPool;
import entity.bookrend;
import entity.reader;
public class bookrendDao {
	//往bookrend表中插入数据
	public int insertBookRend(bookrend bookrend1) {
		int rs = 0;
		ConnPool conn = new ConnPool();
		Connection con = conn.getOneCon();
		PreparedStatement pstm=null;
		String sql_insert = "insert into readers(reader_id,lend_date,should_back_time,back_date,book_id,timeout,timeout_days,ser_num) values(?,?,?,?,?,?,?,?)";
		try {
			pstm = con.prepareStatement(sql_insert);
			pstm.setString(1,bookrend1.getReader_id());
			pstm.setString(2,bookrend1.getLend_date());
			pstm.setString(3,bookrend1.getShould_back_time());
			pstm.setString(4,bookrend1.getBack_date());
			pstm.setString(5,bookrend1.getBook_id());
			pstm.setString(6,bookrend1.getTimeout());
			pstm.setString(7,bookrend1.getTimeout_days());
			pstm.setString(7,bookrend1.getTimeout_days());
			rs = pstm.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.releaseCon(con);
		}
		return rs;
	}
	//查询bookrend表中所有数据
	public ResultSet queryBookRend() {
		PreparedStatement pstm=null;
		ResultSet rs = null;
		ConnPool conn = new ConnPool();
		Connection con = conn.getOneCon();
		String sql_query = "select * from bookrend";
		try {
			pstm = con.prepareStatement(sql_query);
			rs = pstm.executeQuery();
		}catch(Exception e) {
				e.printStackTrace();
		}finally {
			conn.releaseCon(con);
		}
		return rs;
	}
	//查询bookrend表中指定流水号的数据
	public ResultSet selectReader(bookrend bookrend1) {
		PreparedStatement pstm=null;
		ResultSet rs = null;
		ConnPool conn = new ConnPool();
		Connection con = conn.getOneCon();
		String sql_select = "select * from bookrend where ser_num=?";
		try {
			
			pstm = con.prepareStatement(sql_select);
			pstm.setString(1,bookrend1.getSer_num());
			rs = pstm.executeQuery();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.releaseCon(con);
		}
		return rs;
	}
	//删除数据
	public int deleteReader(reader reader1) {
		int rs = 0;
		ConnPool conn = new ConnPool();
		Connection con = conn.getOneCon();
		PreparedStatement pstm=null;
		String sql_delete="delete from readers where reader_id=?";
		try {
			pstm = con.prepareStatement(sql_delete);
			pstm.setString(1, reader1.getReader_id());
			rs = pstm.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.releaseCon(con);
		}
			return rs;
		}
}
