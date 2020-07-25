package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode;

// DAO(Data Access Object): �����ͺ��̽� ���� ��ü, DB���� ȸ�������� �ҷ����ų� ���� �� ���.
public class UserDAO {

	// �ܺ� ���̺귯�� �־���(import~)
	private Connection conn; // �ڹٿ� DB�� ����
	private PreparedStatement pstmt; // ������ ��� & ����
	private ResultSet rs; // ����� �޾ƿ���
	// ctl+space �Ǵ� ctl+shift+o
	
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
			if (rs.next()) { // ���̵� DB�� ������ ��
				if(rs.getString(1).equals(userPassword)) // ��й�ȣ�� ��ġ�Ѵٸ�
					return 1; // �α��� ���� -> ���� 1 ����
				 else
					return 0; // (ID�� DB�� ����������) ��й�ȣ�� �ٸ��ٸ� -> ���� 0 ����
			}
			return -1; // �������� �ʴ� ���̵��� -> ���� -1 ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // �����ͺ��̽��� �����ְų� ������ �ִٸ� -> ���� -2 ����
	}
	
	public int join(User user) {
		String SQL = "insert into user values (?, ?, ?, ?, ?)"; // ?�� �� ���̵�, ��й�ȣ, �̸�, ����, �̸��Ͽ� �ش�
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID()); // ù ��° ����ǥ(���̵�)
			pstmt.setString(2, user.getUserPassword()); // �� ��° ����ǥ(��й�ȣ)
			pstmt.setString(3, user.getUserName()); // �� ��° ����ǥ(�̸�)
			pstmt.setString(4, user.getUserGender()); // �� ��° ����ǥ(����)
			pstmt.setString(5, user.getUserEmail()); // �ټ� ��° ����ǥ(�̸���)
			return pstmt.executeUpdate(); // �ش� statement�� ������ ����� ��ȯ
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
}
