package bookAuthor.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bookAuthor.model.dto.BookAuthorDTO;
import config.DB;

public class BookAuthorDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; 
	String tableName_1 = "bookAuthor";
	
	public ArrayList<BookAuthorDTO> getSelectAll() {
		conn = DB.dbconn();
		ArrayList<BookAuthorDTO> list = new ArrayList<>();
		try {
			String sql = "select * from " + tableName_1;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BookAuthorDTO resultDto = new BookAuthorDTO();
				resultDto.setAuthorNo(rs.getInt("authorNo"));
				resultDto.setAuthor(rs.getString("author"));
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
	
	public BookAuthorDTO getSelectOne(BookAuthorDTO paramDto) {
		conn = DB.dbconn();
		BookAuthorDTO resultDto = new BookAuthorDTO();
		try {
			String sql = "select * from " + tableName_1 + " where authorNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getAuthorNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultDto.setAuthorNo(rs.getInt("authorNo"));
				resultDto.setAuthor(rs.getString("author"));
				resultDto.setRegiDate(rs.getDate("regiDate"));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return resultDto;
	}
	
	public int setInsert(BookAuthorDTO paramDto) {
		conn = DB.dbconn();
		int result = 0;
		try {
			String sql = "insert into " + tableName_1 + " values(seq_bookauthor.nextval, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getAuthor());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(BookAuthorDTO paramDto) {
		conn = DB.dbconn();
		int result = 0;
		try {
			String sql = "delete from " + tableName_1 + " where authorNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getAuthorNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(BookAuthorDTO paramDto) {
		conn = DB.dbconn();
		int result = 0;
		try {
			String sql = "Update " + tableName_1 + " set author = ? where authorNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getAuthor());
			pstmt.setInt(2, paramDto.getAuthorNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return result;
	}
	
}
