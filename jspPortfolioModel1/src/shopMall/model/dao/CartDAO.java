package shopMall.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import config.DB;
import shopMall.model.dto.CartDTO;

public class CartDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ArrayList<CartDTO> getSelectCartProductGroup(){
		ArrayList<CartDTO> list = new ArrayList<>(); 
		conn = DB.dbConn();
		try {
			String sql = "";
			sql += "select p.productName, sum(c.amount * p.productPrice) buyMoney ";
			sql += "from cart c inner join product p on c.productCode = p.productCode ";
			sql += "group by p.productName ";
			sql += "order by productName asc ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CartDTO dto = new CartDTO();
				dto.setProductName(rs.getString("productName"));
				dto.setBuyMoney(rs.getInt("buyMoney"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return list;
	}
	
	public ArrayList<CartDTO> getSelectAll() {
		ArrayList<CartDTO> list = new ArrayList<>();
		conn = DB.dbConn();
		try {
			String sql = "select c.*, (";
				 //  sql +="select productName from product p where p.productCode = c.productCode";
				 // sql +=") productName, (";
				 // sql += "select productprice from product p where p.productCode = c.productCode";
				 //  sql += ") productPrice, (";
				   sql += "select productName || '/' || productprice || '/' || vendorCode || '/' || attachInfo  from product p where p.productCode = c.productCode";
				   sql += ") productInfo";
				   sql +=" from cart c";
				   sql +=" order by cartNo desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CartDTO dto = new CartDTO();
				dto.setCartNo(rs.getInt("cartNo"));
				dto.setMemberNo(rs.getInt("memberNo"));
				dto.setProductCode(rs.getInt("productCode"));
				dto.setAmount(rs.getInt("amount"));
				dto.setRegiDate(rs.getDate("regiDate"));
				//dto.setProductName(rs.getString("productName"));
				//dto.setProductPrice(rs.getInt("productPrice"));
				dto.setProductInfo(rs.getString("productInfo"));
				list.add(dto);
			}
		} catch (Exception e) {
			// e.printStackTrace();
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return list;
	}

	public CartDTO getSelectOne(CartDTO paramDto) {
		CartDTO dto = new CartDTO();
		conn = DB.dbConn();
		try {
			String sql = "select * from cart where cartNo = ? order by cartNo desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getCartNo());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setCartNo(rs.getInt("cartNo"));
				dto.setMemberNo(rs.getInt("memberNo"));
				dto.setProductCode(rs.getInt("productCode"));
				dto.setAmount(rs.getInt("amount"));
				dto.setRegiDate(rs.getDate("regiDate"));
			}
		} catch (Exception e) {
			// e.printStackTrace();
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public int setInsert(CartDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "insert into cart values (seq_cart.nextval, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getCartNo());
			pstmt.setInt(2, paramDto.getProductCode());
			pstmt.setInt(3, paramDto.getAmount());
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			// e.printStackTrace();
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return result;
	}

	public int setUpdate(CartDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "update cart set memberNo = ?, productCode = ?, amount = ? where cartNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getMemberNo());
			pstmt.setInt(2, paramDto.getProductCode());
			pstmt.setInt(3, paramDto.getAmount());
			pstmt.setInt(4, paramDto.getCartNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// e.printStackTrace();
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return result;
	}

	public int setDelete(CartDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "delete from cart where cartNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getCartNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// e.printStackTrace();
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDeleteBatch(String[] arg) {
		int result = 0;
		int[] count = new int[arg.length];
		conn = DB.dbConn();
		try {
			conn.setAutoCommit(false);
			
			String sql = "delete from cart where cartNo=?";
			pstmt = conn.prepareStatement(sql);
			
			for(int i=0; i<arg.length; i++) {
				pstmt.setInt(1, Integer.parseInt(arg[i]));
				pstmt.addBatch();
			}
			count = pstmt.executeBatch();
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch(Exception e3) {
				e3.printStackTrace();
			}
			result = count.length;
			DB.dbConnclose(rs, pstmt, conn);
			
		}
		return result;
	}
	
	
}
