package jsp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class JspDAO {
	private Connection conn; // 데이터베이스를 접근하게 해주는 객체
	private ResultSet rs; // 어떠한 정보를 담을 수 있는 하나의 객체
	public JspDAO() {
		
		try {
			String dbURL = "jdbc:mysql://localhost:3306/JSP";
			String dbID = "root";
			String dbPassword = "456456";
			Class.forName("com.mysql.jdbc.Driver"); // 드라이버 로드
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e){
			
			e.printStackTrace(); // 오류를 출력하게 만들어줌
			System.out.println(e.getMessage());
		}
	}
	public String getDate() {
		String SQL = "SELECT NOW()"; //  현재의 시간을 가져오는 MYSQL의 문법
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return ""; // 데이터베이스 오류
	}
	
	public int getNext() {
		String SQL = "SELECT jspID FROM JSP ORDER BY jspID DESC"; //  현재의 시간을 가져오는 MYSQL의 문법
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return -1; // 데이터베이스 오류
	}
	
	public int write(String jspTitle, String userID, String jspContent) {
		String SQL = "INSERT INTO JSP VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, jspTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, jspContent);
			pstmt.setInt(6, 1);
//			rs = pstmt.executeQuery();
//			rs = pstmt.executeUpdate();
			return pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return -1;
	}
	
	public ArrayList<Jsp> getList(int pageNumber) {
		String SQL = "SELECT * FROM JSP WHERE JspID < ? AND JspAvailable = 1 ORDER BY jspID DESC LIMIT 10";
		ArrayList<Jsp> list = new ArrayList<Jsp>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1 ) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Jsp jsp = new Jsp();
				jsp.setJspID(rs.getInt(1));
				jsp.setJspTitle(rs.getString(2));
				jsp.setUserID(rs.getString(3));
				jsp.setJspDate(rs.getString(4));
				jsp.setJspContent(rs.getString(5));
				jsp.setJspAvailable(rs.getInt(6));
				list.add(jsp);
			}
		}catch(Exception e) {
			System.out.println("ArrayList Function ERROR");
			System.out.println(e.getMessage());
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM JSP WHERE jspID < ? AND jspAvailbale = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1 ) * 10);
			rs = pstmt.executeQuery();
			if(rs.next() ) {
				return true;
			}
		}catch(Exception e) {
			System.out.println("nextPage Function ERROR");
			System.out.println(e.getMessage());
		}
		
		return false;
	}
	
	public Jsp getJsp(int jspID) {
		String SQL = "SELECT * FROM JSP WHERE jspID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, jspID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Jsp jsp = new Jsp();
				jsp.setJspID(rs.getInt(1));
				jsp.setJspTitle(rs.getString(2));
				jsp.setUserID(rs.getString(3));
				jsp.setJspDate(rs.getString(4));
				jsp.setJspContent(rs.getString(5));
				jsp.setJspAvailable(rs.getInt(6));
				return jsp;
			}
		}catch(Exception e) {
			System.out.println("getJsp Function ERROR");
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	public int update(int jspID, String jspTitle, String jspContent) {
		String SQL = "UPDATE JSP SET jspTitle = ?, jspContent = ?, WHERE jspID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, jspTitle);
			pstmt.setString(2, jspContent);
			pstmt.setInt(3, jspID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("update Function ERROR");
			System.out.println(e.getMessage());
		}
		return -1;
	}
}
 