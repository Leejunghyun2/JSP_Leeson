package project.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DB {
	
	public static Connection dbConn() {
		String dbDrv = "oracle.jdbc.driver.OracleDriver";
		String dbUrl = "jdbc:oracle:thin:@localhost:1521/xe";
		String dbId = "jspPortfolioModel2";
		String dbPw = "1234";
		
		Connection conn = null;
		try {
			Class.forName(dbDrv);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("DB접속 실패");
		}
		
		try {
			conn = DriverManager.getConnection(dbUrl,dbId,dbPw);
		} catch (Exception e) {
			System.out.println("DB접속 실패");
		}
		return conn;
	}
	
	public static void dbConnClose(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if(rs != null) { rs.close(); }
		} catch (Exception e) {
			//e.printStackTrace();		
		}
		
		try {
			if(pstmt != null) { pstmt.close(); }
		} catch (Exception e) {
			//e.printStackTrace();		
		}
		
		try {
			if(conn != null) { conn.close(); }
		} catch (Exception e) {
			//e.printStackTrace(); 		
		}
	}
	
}
