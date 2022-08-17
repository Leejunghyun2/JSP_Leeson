package haksaMember.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;
import haksaMember.model.dto.HaksaMemberDTO;

public class HaksaMemberDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<HaksaMemberDTO> getSelectAll() {
		conn =DB.dbconn();
		ArrayList<HaksaMemberDTO> list = new ArrayList<>();
		try {
			String sql = "select * from haksaMember";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HaksaMemberDTO dto = new HaksaMemberDTO();
				dto.setHakbun(rs.getInt("hakbun"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setParentPhone(rs.getString("parentPhone"));
				dto.setAddr1(rs.getString("addr1"));
				dto.setAddr2(rs.getString("addr2"));
				dto.setAddr3(rs.getString("addr3"));
				dto.setAddr4(rs.getString("addr4"));
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
	
	public HaksaMemberDTO getSelectOne(HaksaMemberDTO dto) {
		conn =DB.dbconn();
		HaksaMemberDTO resultDto = new HaksaMemberDTO();
		try {
			String sql = "select * from haksaMember where hakbun = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getHakbun());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultDto.setHakbun(rs.getInt("hakbun"));
				resultDto.setName(rs.getString("name"));
				resultDto.setPhone(rs.getString("phone"));
				resultDto.setParentPhone(rs.getString("parentPhone"));
				resultDto.setAddr1(rs.getString("addr1"));
				resultDto.setAddr2(rs.getString("addr2"));
				resultDto.setAddr3(rs.getString("addr3"));
				resultDto.setAddr4(rs.getString("addr4"));
				resultDto.setRegiDate(rs.getDate("regiDate"));
			}
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return resultDto;
	}
	public int setInsert(HaksaMemberDTO dto) {
		int result = 0;
		conn =DB.dbconn();
		try {
			String sql = "insert into haksaMember values(seq_haksaMember.nextval, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getParentPhone());
			pstmt.setString(4, dto.getAddr1());
			pstmt.setString(5, dto.getAddr2());
			pstmt.setString(6, dto.getAddr3());
			pstmt.setString(7, dto.getAddr4());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(HaksaMemberDTO dto) {
		int result = 0;
		conn =DB.dbconn();
		try {
			String sql = "update haksaMember set phone = ?, parentPhone = ?,addr1 = ?, addr2 = ?,addr3 = ?, addr4 = ?";
			sql += " where hakbun = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPhone());
			pstmt.setString(2, dto.getParentPhone());
			pstmt.setString(3, dto.getAddr1());
			pstmt.setString(4, dto.getAddr2());
			pstmt.setString(5, dto.getAddr3());
			pstmt.setString(6, dto.getAddr4());
			pstmt.setInt(7, dto.getHakbun());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(HaksaMemberDTO dto) {
		int result = 0;
		conn =DB.dbconn();
		try {
			String sql = "delete from haksaMember";
			sql += " where hakbun = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getHakbun());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return result;
	}
}
