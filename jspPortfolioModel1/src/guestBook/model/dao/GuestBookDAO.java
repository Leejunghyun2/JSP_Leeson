package guestBook.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;
import guestBook.model.dto.GuestBookDTO;

public class GuestBookDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ArrayList<GuestBookDTO> getSelectAll() {
		ArrayList<GuestBookDTO> list = new ArrayList<>();
		conn = DB.dbConn();
		try {
			String sql = "select * from guestBook";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				GuestBookDTO dto = new GuestBookDTO();
				dto.setNo(rs.getInt("no"));
				dto.setRegiDate(rs.getDate("regiDate"));
				list.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return list;
	}
}
