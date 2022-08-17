package haksaSungjuk.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;
import haksaSungjuk.model.dto.HaksaSungjukDTO;

public class HaksaSungjukDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<HaksaSungjukDTO> getSelectAll() {
		conn =DB.dbconn();
		ArrayList<HaksaSungjukDTO> list = new ArrayList<>();
		try {
			String sql = "select * from haksaSungjuk";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HaksaSungjukDTO dto = new HaksaSungjukDTO();
				dto.setSungjukNo(rs.getInt("sungjukNo"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setSci(rs.getInt("sci"));
				dto.setHis(rs.getInt("his"));
				dto.setTot(rs.getInt("tot"));
				dto.setAvg(rs.getDouble("avg"));
				dto.setGrade(rs.getString("grade"));
				dto.setHakbun(rs.getInt("hakbun"));
				dto.setSihumNo(rs.getInt("sihumNo"));
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
	
	public HaksaSungjukDTO getSelectOne(HaksaSungjukDTO paramDto) {
		conn =DB.dbconn();
		HaksaSungjukDTO dto = new HaksaSungjukDTO();
		try {
			String sql = "select * from haksaSungjuk where sungjukNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getSungjukNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setSungjukNo(rs.getInt("sungjukNo"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setSci(rs.getInt("sci"));
				dto.setHis(rs.getInt("his"));
				dto.setTot(rs.getInt("tot"));
				dto.setAvg(rs.getDouble("tot"));
				dto.setGrade(rs.getString("grade"));
				dto.setHakbun(rs.getInt("hakbun"));
				dto.setSihumNo(rs.getInt("sihumNo"));
				dto.setRegiDate(rs.getDate("regiDate"));
			}
			
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return dto;
	}
	public int setInsert(HaksaSungjukDTO dto) {
		int result = 0;
		conn =DB.dbconn();
		try {
			String sql = "insert into haksaSungjuk values(";
			sql += "seq_haksaSungjuk.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getKor());
			pstmt.setInt(2, dto.getEng());
			pstmt.setInt(3, dto.getMat());
			pstmt.setInt(4, dto.getSci());
			pstmt.setInt(5, dto.getHis());
			pstmt.setInt(6, dto.getTot());
			pstmt.setDouble(7, dto.getAvg());
			pstmt.setString(8, dto.getGrade());
			pstmt.setInt(9, dto.getHakbun());
			pstmt.setInt(10, dto.getSihumNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(HaksaSungjukDTO dto) {
		int result = 0;
		conn =DB.dbconn();
		try {
			String sql = "update haksaSungjuk set";
			sql += " kor = ?, eng = ?, mat = ?, sci = ?, his = ?, tot = ?, avg = ?, grade = ?";
			sql += " where sungjukNo = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getKor());
			pstmt.setInt(2, dto.getEng());
			pstmt.setInt(3, dto.getMat());
			pstmt.setInt(4, dto.getSci());
			pstmt.setInt(5, dto.getHis());
			pstmt.setInt(6, dto.getTot());
			pstmt.setDouble(7, dto.getAvg());
			pstmt.setString(8, dto.getGrade());
			pstmt.setInt(9, dto.getSungjukNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(HaksaSungjukDTO dto) {
		int result = 0;
		conn =DB.dbconn();
		try {
			String sql = "delete from haksaSungjuk where sungjukNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getSungjukNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return result;
	}
}
