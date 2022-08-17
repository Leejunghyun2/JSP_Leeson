package bookInfo.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bookAuthor.model.dto.BookAuthorDTO;
import bookInfo.model.dto.BookInfoDTO;
import config.DB;

public class BookInfoDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; 
	String tableName_1 = "bookInfo";
	
	public ArrayList<BookInfoDTO> getSelectAll() {
		conn = DB.dbconn();
		ArrayList<BookInfoDTO> list = new ArrayList<>();
		try {
			String sql = "select b.infoNo, b.subject, b.authorNo, a.author ,b.profileNo, c.profile, b.created";
				   sql += " from bookInfo b, bookAuthor a, bookProfile c";
				   sql += " where b.authorNo=a.authorNo and b.profileNo = c.profileNo";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BookInfoDTO resultDto = new BookInfoDTO();
				resultDto.setInfoNo(rs.getInt("infoNo"));
				resultDto.setSubject(rs.getString("subject"));
				resultDto.setAuthor(rs.getString("author"));
				resultDto.setAuthorNo(rs.getInt("authorNo"));
				resultDto.setProfile(rs.getString("profile"));
				resultDto.setProfileNo(rs.getInt("profileNo"));
				resultDto.setCreated(rs.getDate("created"));
				list.add(resultDto);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return list;
	}
	
	public BookInfoDTO getSelectOne(BookInfoDTO paramDto) {
		conn = DB.dbconn();
		BookInfoDTO resultDto = new BookInfoDTO();
		try {
			String sql = "select * from " + tableName_1 + " where infoNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getInfoNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultDto.setInfoNo(rs.getInt("infoNo"));
				resultDto.setSubject(rs.getString("subject"));
				resultDto.setAuthorNo(rs.getInt("authorNo"));
				resultDto.setProfileNo(rs.getInt("profileNo"));
				resultDto.setCreated(rs.getDate("created"));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return resultDto;
	}
	
	public int setInsert(BookInfoDTO paramDto) {
		conn = DB.dbconn();
		int result = 0;
		try {
			String sql = "insert into " + tableName_1 + " values(seq_bookInfo.nextval, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getSubject());
			pstmt.setInt(2, paramDto.getAuthorNo());
			pstmt.setInt(3, paramDto.getProfileNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(BookInfoDTO paramDto) {
		conn = DB.dbconn();
		int result = 0;
		try {
			String sql = "delete from " + tableName_1 + " where infoNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getInfoNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(BookInfoDTO paramDto) {
		conn = DB.dbconn();
		int result = 0;
		try {
			String sql = "Update " + tableName_1 + " set subject = ?,authorNo =?, profileNo = ? where infoNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getSubject());
			pstmt.setInt(2, paramDto.getAuthorNo());
			pstmt.setInt(3, paramDto.getProfileNo());
			pstmt.setInt(4, paramDto.getInfoNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return result;
	}
	
}
