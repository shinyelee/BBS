package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BbsDAO {
	// * �� ������ �� �Ʒ��� UserDAO.java�� �Ϻ� ������ �������
	private Connection conn;
	// PrivatePreparedStatement rs; ����
	private ResultSet rs;
	
	public BbsDAO() {
		try {
			String dbURL="jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() { // ���� �ð�(���� �ð�)�� �������� �Լ�
		String SQL = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // SQL�� ���� �غ�ܰ�� ����
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1); // ���� ��¥ ��ȯ
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // �����ͺ��̽� ����
	}
	
	public int getNext() { // �Խñ� ��ȣ�� �������� �Լ�
		String SQL = "select bbsID from bbs order by bbsID desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // SQL�� ���� �غ�ܰ�� ����
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1)+1; // �Խñ� ��ȣ ��ȯ
			}
			return 1; // ù ��° �Խù��� ���
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
	
	public int write(String bbsTitle, String userID, String bbsContent) { // �Խñ� �ۼ��ϴ� �Լ�
		String SQL = "insert into bbs values (?, ?, ?, ?, ?, ?)"; // ? 6��
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // SQL�� ���� �غ�ܰ�� ����
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
}