package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// DAO(Data Access Object): 데이터베이스 접근 객체, DB에서 회원정보를 불러오거나 넣을 때 사용.
public class UserDAO {

	private Connection conn; // 자바와 DB를 연결
	private PreparedStatement pstmt; // 쿼리문 대기 & 설정
	private ResultSet rs; // 결과값 받아오기
	// ctl+space 또는 ctl+shift+o -> 외부 라이브러리 넣어줌(import~)
	
	public UserDAO() { // 기본 생성자, mysql에 접속할 수 있도록 도와주는 역할.
		try {
			String dbURL="jdbc:mysql://localhost:3306/BBS"; // DB와 연결해주는 주소
			String dbID = "root"; // mysql 아이디
			String dbPassword = "1234"; // mysql 비밀번호
			Class.forName("com.mysql.jdbc.Driver"); // driver는 mysql에 접속하도록 도와주는 라이브러리 매개체
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace(); // 무슨 오류인지 출력
		}
	}
	
	public int login(String userID, String userPassword) {
		// DB에서 입력할 쿼리문 미리 저장ㄴㄱ
		String SQL = "select userPassword from user where userID = ?"; // 매개변수 userID의 userPassword 구하기
		try {
			pstmt = conn.prepareStatement(SQL); // 미리 설정한 sql을 세팅하는 코드
			pstmt.setString(1, userID); // 쿼리문의 1번째 ?에 userID 대입
			rs = pstmt.executeQuery(); // 세팅이 끝난 쿼리문을 실행시키고 나온 결과값을 rs에 저장
			if (rs.next()) {
				if(rs.getString(1).equals(userPassword))
					return 1; // 로그인 성공 -> 정수 1 리턴
				 else
					return 0; // 비밀번호가 다릅니다 -> 정수 0 리턴
			}
			return -1; // 존재하지 않는 아이디입니다 -> 정수 -1 리턴
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}
	
}
