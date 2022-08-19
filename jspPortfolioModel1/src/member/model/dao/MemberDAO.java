package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;
import member.model.dto.MemberDTO;

public class MemberDAO {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
	public ArrayList<MemberDTO> getSelectAll() {
		conn = DB.dbConn();
		ArrayList<MemberDTO> list = new ArrayList<>();
		try {
			String sql = "select * from member order by no desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setJumin(rs.getString("jumin"));
				dto.setGrade(rs.getString("grade"));
				dto.setRegiDate(rs.getDate("regiDate"));
				dto.setAttachInfo(rs.getString("attachInfo"));
				list.add(dto);
			}
		} catch (Exception e) {
			// e.printStackTrace();
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return list;
	}

	public MemberDTO getSelectOne(MemberDTO paramDto) {
		MemberDTO dto = new MemberDTO();
		conn = DB.dbConn();
		try {
			String sql = "select * from member where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setJumin(rs.getString("jumin"));
				dto.setGrade(rs.getString("grade"));
				dto.setJuso1(rs.getString("juso1"));
				dto.setJuso2(rs.getString("juso2"));
				dto.setJuso3(rs.getString("juso3"));
				dto.setJuso4(rs.getString("juso4"));
				dto.setGrade(rs.getString("grade"));
				dto.setRegiDate(rs.getDate("regiDate"));
				dto.setAttachInfo(rs.getString("attachInfo"));

			}
		} catch (Exception e) {
			// e.printStackTrace();
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return dto;
	}

	public int setInsert(MemberDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "insert into member values (seq_member.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?)";
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
			pstmt.setString(11, paramDto.getGrade());
			pstmt.setString(12, paramDto.getAttachInfo());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// e.printStackTrace();
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return result;
	}

	public int setUpdate(MemberDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "update member set phone = ?, email = ?, juso1 = ?, juso2 = ?, juso3 = ?, juso4 = ?, grade = ?";
			sql += " where no = ? and passwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getPhone());
			pstmt.setString(2, paramDto.getEmail());
			pstmt.setString(3, paramDto.getJuso1());
			pstmt.setString(4, paramDto.getJuso2());
			pstmt.setString(5, paramDto.getJuso3());
			pstmt.setString(6, paramDto.getJuso4());
			pstmt.setString(7, paramDto.getGrade());
			pstmt.setInt(8, paramDto.getNo());
			pstmt.setString(9, paramDto.getPasswd());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// e.printStackTrace();
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return result;
	}

	public int setDelete(MemberDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "delete from member where no = ? and passwd = ?"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getNo());
			pstmt.setString(2, paramDto.getPasswd());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// e.printStackTrace();
		} finally {
			DB.dbConnclose(rs, pstmt, conn);
		}
		return result;
	}
}
