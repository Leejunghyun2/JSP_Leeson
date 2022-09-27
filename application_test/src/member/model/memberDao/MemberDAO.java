package member.model.memberDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DB.testDB;
import member.model.memberDto.MemberDTO;
public class MemberDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public MemberDTO getSelectOne(MemberDTO paramDto) {
		MemberDTO dto = new MemberDTO();
		conn = testDB.dbConn();
		try {
			String sql = "select * from member where id = ? and passwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getId());
			pstmt.setString(2, paramDto.getPasswd());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setChangeDate(rs.getDate("changeDate"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			testDB.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public int setUpdate(MemberDTO paramDto) {
		int result = 0;
		conn = testDB.dbConn();
		try {
			String sql = "update member set passwd = ? where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getPasswd());
			pstmt.setString(2, paramDto.getId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			testDB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDateUpdate(MemberDTO paramDto) {
		int result = 0;
		conn = testDB.dbConn();
		try {
			String sql = "update member set changeDate = sysdate where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			testDB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int getDateChk(MemberDTO paramDto) {
		int result = 0;
		conn = testDB.dbConn();
		try {
			String sql = "select trunc(months_between(sysdate, changeDate)) no from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getId());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("no"); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			testDB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
}
