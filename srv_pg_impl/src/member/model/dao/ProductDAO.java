package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import config.Db;
import member.model.dto.ProductDTO;

public class ProductDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	public int setInsert(ProductDTO paramDto){
		int result = 0;
		conn = Db.dbConn();
		try {
			String sql = "insert Into product values(seq_product.nextval, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getCate());
			pstmt.setString(2, paramDto.getPname());
			pstmt.setInt(3, paramDto.getPrice());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Db.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
}
