package memberBasic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;

public class MemberBasicDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	public ArrayList<MemberBasicDTO> getSelectAll() {
		conn = DB.dbconn();
		ArrayList<MemberBasicDTO> list = new ArrayList<>();
		try {
			String sql = "select * from memberBasic";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
			MemberBasicDTO dto = new MemberBasicDTO();	
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setJumin(rs.getString("jumin"));
				dto.setJuso1(rs.getString("juso1"));
				dto.setJuso2(rs.getString("juso2"));
				dto.setJuso3(rs.getString("juso3"));
				dto.setJuso4(rs.getString("juso4"));
				dto.setRegiDate(rs.getDate("regiDate"));
				list.add(dto);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return list;
	}

	public MemberBasicDTO getSelectOne(MemberBasicDTO paramDto) {
		MemberBasicDTO dto = new MemberBasicDTO();
		conn = DB.dbconn();
		try {
			String sql = "select * from memberBasic where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setJumin(rs.getString("jumin"));
				dto.setJuso1(rs.getString("juso1"));
				dto.setJuso2(rs.getString("juso2"));
				dto.setJuso3(rs.getString("juso3"));
				dto.setJuso4(rs.getString("juso4"));
				dto.setRegiDate(rs.getDate("regiDate"));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return dto;
	}

	public int setInsert(MemberBasicDTO paramDto) {
		conn = DB.dbconn();
		int result = 0;
		try {
			System.out.println("접속완료");
			String sql = "insert into memberBasic(no, id, passwd, name, phone, email, jumin, juso1, juso2, juso3, juso4, regiDate)"+
						" values(seq_memberBasic.nextval, ?, ?, ?, ? ,? ,? ,? ,? ,? ,?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getId());
			pstmt.setString(2, paramDto.getPasswd());
			pstmt.setString(3, paramDto.getName());
			pstmt.setString(4, paramDto.getPhone());
			pstmt.setString(5, paramDto.getEmail());
			pstmt.setString(6, paramDto.getJumin());
			pstmt.setString(7, paramDto.getJuso1());
			pstmt.setString(8, paramDto.getJuso2());
			pstmt.setString(9, paramDto.getJuso3());
			pstmt.setString(10, paramDto.getJuso4());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
			return result;
	}

	public int setUpdate(MemberBasicDTO paramDto) {
		conn = DB.dbconn();
		int result = 0;
		try {
			System.out.println("접속완료");
			String sql = "update memberBasic set phone = ?, email = ?, juso1 = ?, juso2 = ?, juso3 = ?, juso4 = ?" +
						 " where no = ? and passwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getPhone());
			pstmt.setString(2, paramDto.getEmail());
			pstmt.setString(3, paramDto.getJuso1());
			pstmt.setString(4, paramDto.getJuso2());
			pstmt.setString(5, paramDto.getJuso3());
			pstmt.setString(6, paramDto.getJuso4());
			pstmt.setInt(7, paramDto.getNo());
			pstmt.setString(8, paramDto.getPasswd());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
			return result;
	}

	public int setDelete(MemberBasicDTO paramDto) {
		conn = DB.dbconn();
		int result = 0;
		try {
			System.out.println("접속완료");
			String sql = "delete from memberBasic where no = ? and passwd = ?"; 
						 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getNo());
			pstmt.setString(2, paramDto.getPasswd());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
			return result;
	}
}
