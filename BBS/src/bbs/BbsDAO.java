package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BbsDAO {
	// * 이 파일은 이 아래로 UserDAO.java를 일부 수정해 만들었음
	private Connection conn;
	// PrivatePreparedStatement rs; 삭제
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
	
	public String getDate() { // 현재 시간(서버 시간)을 가져오는 함수
		String SQL = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // SQL문 실행 준비단계로 만듦
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1); // 현재 날짜 반환
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}
	
	public int getNext() { // 게시글 번호를 가져오는 함수
		String SQL = "select bbsID from bbs order by bbsID desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // SQL문 실행 준비단계로 만듦
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1)+1; // 게시글 번호 반환
			}
			return 1; // 첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int write(String bbsTitle, String userID, String bbsContent) { // 게시글 작성하는 함수
		String SQL = "insert into bbs values (?, ?, ?, ?, ?, ?)"; // ? 6개
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // SQL문 실행 준비단계로 만듦
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
		return -1; // 데이터베이스 오류
	}
}