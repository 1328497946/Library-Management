package Dao;
import java.sql.*;
import mysql.ConnPool;
import entity.reader;
public class readerDao {
	//��readers���в�������
	public int insertReader(reader reader1) {
		int rs = 0;
		ConnPool conn = new ConnPool();
		Connection con = conn.getOneCon();
		PreparedStatement pstm=null;
		String sql_insert = "insert into readers(reader_id,name,sex,birth,address,phone,email) values(?,?,?,?,?,?,?)";
		try {
			pstm = con.prepareStatement(sql_insert);
			pstm.setString(1,reader1.getReader_id());
			pstm.setString(2,reader1.getName());
			pstm.setString(3,reader1.getSex());
			pstm.setString(4,reader1.getBirth());
			pstm.setString(5,reader1.getAddress());
			pstm.setString(6,reader1.getPhone());
			pstm.setString(7,reader1.getEmail());
			rs = pstm.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.releaseCon(con);
		}
		return rs;
	}
	//��ѯreaders������������
	public ResultSet queryReader() {
		PreparedStatement pstm=null;
		ResultSet rs = null;
		ConnPool conn = new ConnPool();
		Connection con = conn.getOneCon();
		String sql_query = "select * from readers";
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
	//��ѯreaders����ָ��ID������
	public ResultSet selectReader(reader reader1) {
		PreparedStatement pstm=null;
		ResultSet rs = null;
		ConnPool conn = new ConnPool();
		Connection con = conn.getOneCon();
		String sql_select = "select * from readers where reader_id=?";
		try {
			
			pstm = con.prepareStatement(sql_select);
			pstm.setString(1,reader1.getReader_id());
			rs = pstm.executeQuery();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.releaseCon(con);
		}
		return rs;
	}
	//��������
	public int updateReader(reader reader1) {
		int rs = 0;
		ConnPool conn = new ConnPool();
		Connection con = conn.getOneCon();
		PreparedStatement pstm=null;
		String sql_update="update contents set name=?,sex=?,birth=?,address=?,phone=?,email=? where reader_id=?";
		try {
			pstm = con.prepareStatement(sql_update);
			pstm.setString(1,reader1.getName());
			pstm.setString(2,reader1.getSex());
			pstm.setString(3,reader1.getBirth());
			pstm.setString(4,reader1.getAddress());
			pstm.setString(5,reader1.getPhone());
			pstm.setString(6,reader1.getEmail());
			pstm.setString(7,reader1.getReader_id());
			rs = pstm.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.releaseCon(con);
		}
		return rs;
	}
	//ɾ������
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
	//���Ŀ���ʧ
	public int report_loss(reader reader1) {
		int rs = 0;
		ConnPool conn = new ConnPool();
		Connection con = conn.getOneCon();
		PreparedStatement pstm=null;
		String sql_reportLoss = "updata readcard set available=? where reader_id=?";
		try {
			pstm = con.prepareStatement(sql_reportLoss);
			pstm.setString(1, "not available");
			pstm.setString(2,reader1.getReader_id());
			rs = pstm.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.releaseCon(con);
		}
		return rs;
	}
	//����Ա�����������ʧ
	public int de_report_loss(reader reader1) {
		int rs = 0;
		ConnPool conn = new ConnPool();
		Connection con = conn.getOneCon();
		PreparedStatement pstm=null;
		String sql_reportLoss = "updata readcard set available=? where reader_id=?";
		try {
			pstm = con.prepareStatement(sql_reportLoss);
			pstm.setString(1, "available");
			pstm.setString(2,reader1.getReader_id());
			rs = pstm.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.releaseCon(con);
		}
		return rs;
	}
}
