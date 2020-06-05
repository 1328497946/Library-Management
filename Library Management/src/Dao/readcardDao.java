package Dao;
import java.sql.*;
import mysql.ConnPool;
import entity.readcard;
public class readcardDao {
	    //��readcard���в�����Ϣ
		public int insertReadCard(readcard readcard1) {
			int rs = 0;
			ConnPool conn = new ConnPool();
			Connection con = conn.getOneCon();
			PreparedStatement pstm=null;
			String sql_insert = "insert into readcard(reader_id,password,available) values(?,?,?)";
			try {
				pstm = con.prepareStatement(sql_insert);
				pstm.setString(1,readcard1.getReader_id());
				pstm.setString(2,readcard1.getPassword());
				pstm.setString(3,readcard1.getAvailable());
				rs = pstm.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				conn.releaseCon(con);
			}
			return rs;
		}
		//��ѯreadcard������������
		public ResultSet queryReadCard() {
			PreparedStatement pstm=null;
			ResultSet rs = null;
			ConnPool conn = new ConnPool();
			Connection con = conn.getOneCon();
			String sql_query = "select * from readcard";
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
		//��ѯreadcard����ָ��id������
		public ResultSet selectBook(readcard readcard1) {
			PreparedStatement pstm=null;
			ResultSet rs = null;
			ConnPool conn = new ConnPool();
			Connection con = conn.getOneCon();
			String sql_select = "select * from readcard where reader_id=?";
			try {
				pstm = con.prepareStatement(sql_select);
				pstm.setString(1,readcard1.getReader_id());
				rs = pstm.executeQuery();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				conn.releaseCon(con);
			}
			return rs;
		}
		//��������
		public int updateReadCard(readcard readcard1) {
			int rs = 0;
			ConnPool conn = new ConnPool();
			Connection con = conn.getOneCon();
			PreparedStatement pstm=null;
			String sql_update="update contents set password=?,avaliable=? where reader_id=?";
			try {
				pstm = con.prepareStatement(sql_update);
				pstm.setString(1,readcard1.getPassword());
				pstm.setString(2,readcard1.getAvailable());
				pstm.setString(3,readcard1.getReader_id());
				rs = pstm.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				conn.releaseCon(con);
			}
			return rs;
		}
		//ɾ������
		public int deleteBook(readcard readcard1) {
			int rs = 0;
			ConnPool conn = new ConnPool();
			Connection con = conn.getOneCon();
			PreparedStatement pstm=null;
			String sql_delete="delete from readcard where reader_id=?";
			try {
				pstm = con.prepareStatement(sql_delete);
				pstm.setString(1, readcard1.getReader_id());
				rs = pstm.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				conn.releaseCon(con);
			}
			return rs;
		}
}

