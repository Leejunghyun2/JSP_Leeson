package memberBasic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import config.DB;

public class MemberBasicDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	public void getSelectAll() {
		System.out.println("1");
	}

	public void getSelectOne() {
		System.out.println("완료");
	}

	public int setInsert(MemberBasicDTO paramDto) {
		conn = DB.dbconn();
		int result = 0;
		try {
			System.out.println("접속완료");
			String sql = "insert into memberBasic(no, id, passwd, name, phone, email, jumin, juso1, juso2, juso3, juso4, regiDate)"+
						" values(seq_memberBasic.nextval, ?, ?, ?, ? ,? ,? ,? ,? ,? ,?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getId());
			pstmt.setString(2, paramDto.getPasswd());
			pstmt.setString(3, paramDto.getName());
			pstmt.setString(4, paramDto.getPhone());
			pstmt.setString(5, paramDto.getEmail());
			pstmt.setString(6, paramDto.getJumin());
			pstmt.setString(7, paramDto.getJuso1());
			pstmt.setString(8, paramDto.getJuso2());
			pstmt.setString(9, paramDto.getJuso3());
			pstmt.setString(10, paramDto.getJuso4());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
			return result;
	}

	public void setUpdate() {
		System.out.println("완료");
	}

	public void setDelete() {
		System.out.println("완료");
	}
}
