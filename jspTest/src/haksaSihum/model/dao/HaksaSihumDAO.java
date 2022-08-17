package haksaSihum.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;
import haksaSihum.model.dto.HaksaSihumDTO;

public class HaksaSihumDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<HaksaSihumDTO> getSelectAll() {
		conn =DB.dbconn();
		ArrayList<HaksaSihumDTO> list = new ArrayList<HaksaSihumDTO>();
		try {
			String sql = "select * from haksaSihum";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HaksaSihumDTO dto = new HaksaSihumDTO();
				dto.setSihumNo(rs.getInt("sihumNo"));
				dto.setSihumName(rs.getString("sihumName"));
				dto.setSihumDate(rs.getDate("sihumDate"));
				dto.setRegiDate(rs.getDate("regiDate"));
				list.add(dto);
			}
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return list;
	}
	
	public HaksaSihumDTO getSelectOne(HaksaSihumDTO paramDto) {
		conn =DB.dbconn();
		HaksaSihumDTO dto = new HaksaSihumDTO();
		try {
			String sql = "select * from haksaSihum where sihumNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getSihumNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setSihumNo(rs.getInt("sihumNo"));
				dto.setSihumName(rs.getString("sihumName"));
				dto.setSihumDate(rs.getDate("sihumDate"));
				dto.setRegiDate(rs.getDate("regiDate"));
			}
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return dto;
	}
	public int setInsert(HaksaSihumDTO dto) {
		int result = 0;
		conn =DB.dbconn();
		try {
			String sql = "insert into haksaSihum values (seq_haksaSihum.nextval, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSihumName());
			pstmt.setDate(2, dto.getSihumDate());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(HaksaSihumDTO dto) {
		int result = 0;
		conn =DB.dbconn();
		try {
			String sql = "update haksaSihum set sihumName = ?, sihumDate = ?";
			sql += " where sihumNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSihumName());
			pstmt.setDate(2, dto.getSihumDate());
			pstmt.setInt(3, dto.getSihumNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(HaksaSihumDTO dto) {
		int result = 0;
		conn =DB.dbconn();
		try {
			String sql = "delete from haksaSihum";
			sql += " where sihumNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getSihumNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return result;
	}
}
