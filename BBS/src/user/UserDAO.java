package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// DAO(Data Access Object): �����ͺ��̽� ���� ��ü, DB���� ȸ�������� �ҷ����ų� ���� �� ���.
public class UserDAO {

	private Connection conn; // �ڹٿ� DB�� ����
	private PreparedStatement pstmt; // ������ ��� & ����
	private ResultSet rs; // ����� �޾ƿ���
	// ctl+space �Ǵ� ctl+shift+o -> �ܺ� ���̺귯�� �־���(import~)
	
	public UserDAO() { // �⺻ ������, mysql�� ������ �� �ֵ��� �����ִ� ����.
		try {
			String dbURL="jdbc:mysql://localhost:3306/BBS"; // DB�� �������ִ� �ּ�
			String dbID = "root"; // mysql ���̵�
			String dbPassword = "1234"; // mysql ��й�ȣ
			Class.forName("com.mysql.jdbc.Driver"); // driver�� mysql�� �����ϵ��� �����ִ� ���̺귯�� �Ű�ü
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace(); // ���� �������� ���
		}
	}
	
	public int login(String userID, String userPassword) {
		// DB���� �Է��� ������ �̸� ���夤��
		String SQL = "select userPassword from user where userID = ?"; // �Ű����� userID�� userPassword ���ϱ�
		try {
			pstmt = conn.prepareStatement(SQL); // �̸� ������ sql�� �����ϴ� �ڵ�
			pstmt.setString(1, userID); // �������� 1��° ?�� userID ����
			rs = pstmt.executeQuery(); // ������ ���� �������� �����Ű�� ���� ������� rs�� ����
			if (rs.next()) {
				if(rs.getString(1).equals(userPassword))
					return 1; // �α��� ���� -> ���� 1 ����
				 else
					return 0; // ��й�ȣ�� �ٸ��ϴ� -> ���� 0 ����
			}
			return -1; // �������� �ʴ� ���̵��Դϴ� -> ���� -1 ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // �����ͺ��̽� ����
	}
	
}
