package bookProfile.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bookProfile.model.dto.BookProfileDTO;
import config.DB;

public class BookProfileDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; 
	String tableName_1 = "bookProfile";
	
	public ArrayList<BookProfileDTO> getSelectAll() {
		conn = DB.dbconn();
		ArrayList<BookProfileDTO> list = new ArrayList<>();
		try {
			String sql = "select * from " + tableName_1;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) { 
				BookProfileDTO resultDto = new BookProfileDTO();
				resultDto.setProfileNo(rs.getInt("profileNo"));
				resultDto.setProfile(rs.getString("profile"));
				resultDto.setRegiDate(rs.getDate("regiDate"));
				list.add(resultDto);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return list;
	}
	
	public BookProfileDTO getSelectOne(BookProfileDTO paramDto) {
		conn = DB.dbconn();
		BookProfileDTO resultDto = new BookProfileDTO();
		try {
			String sql = "select * from " + tableName_1 + " where profileNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getProfileNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultDto.setProfileNo(rs.getInt("profileNo"));
				resultDto.setProfile(rs.getString("profile"));
				resultDto.setRegiDate(rs.getDate("regiDate"));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return resultDto;
	}
	
	public int setInsert(BookProfileDTO paramDto) {
		conn = DB.dbconn();
		int result = 0;
		try {
			String sql = "insert into " + tableName_1 + " values(seq_bookProfile.nextval, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getProfile());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(BookProfileDTO paramDto) {
		conn = DB.dbconn();
		int result = 0;
		try {
			String sql = "delete from " + tableName_1 + " where profileNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getProfileNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(BookProfileDTO paramDto) {
		conn = DB.dbconn();
		int result = 0;
		try {
			String sql = "Update " + tableName_1 + " set profile = ? where profileNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getProfile());
			pstmt.setInt(2, paramDto.getProfileNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return result;
	}
	
	
	
}
