package project.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import project.board.model.dto.BoardDTO;
import project.common.DB;


public class BoardDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	public int getTotalRecord(BoardDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "select count(*) counter from board where 1 = 1 ";
			
			if(paramDto.getSearchGubun().equals("writer_subject_content")) {
				sql += "and (writer like ? or subject like ? or content like ?)";
			} else if(paramDto.getSearchGubun().equals("writer")|| paramDto.getSearchGubun().equals("subject") || paramDto.getSearchGubun().equals("content")){
				sql += "and "+paramDto.getSearchGubun()+" like ?";
			} else {
				
			}
			pstmt = conn.prepareStatement(sql);
			int k = 0;
			if(paramDto.getSearchGubun().equals("writer_subject_content")) {
				pstmt.setString(++k, "%" + paramDto.getSearchData() +"%");
				pstmt.setString(++k, "%" + paramDto.getSearchData() +"%");
				pstmt.setString(++k, "%" + paramDto.getSearchData() +"%");
			} else if(paramDto.getSearchGubun().equals("writer")|| paramDto.getSearchGubun().equals("subject") || paramDto.getSearchGubun().equals("content")){
				pstmt.setString(++k, "%" + paramDto.getSearchData() +"%");
			} else {
				
			}
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("counter");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
		
	public ArrayList<BoardDTO> getSelectAll(BoardDTO paramDto) {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		conn = DB.dbConn();
		try {
			String basicsql ="select * from board where 1=1 ";
			
			if(paramDto.getSearchGubun().equals("writer_subject_content")) {
				basicsql += " and (writer like ? or subject like ? or content like ?)";
			} else if(paramDto.getSearchGubun().equals("writer")|| paramDto.getSearchGubun().equals("subject") || paramDto.getSearchGubun().equals("content")){
				basicsql += " and "+paramDto.getSearchGubun()+" like ?";
			} else {
				
			}
			
			basicsql += " order by noticeNo desc, refNo desc, levelNo asc ";
			
			String sql = "";
			sql += " select * from (select A.*, rownum rnum from(";
			sql += basicsql;
			sql += ") A) where rnum >= ? and rnum <= ?";
			
			pstmt = conn.prepareStatement(sql);
			
			int k = 0;
			
			if(paramDto.getSearchGubun().equals("writer_subject_content")) {
				pstmt.setString(++k, "%" + paramDto.getSearchData() +"%");
				pstmt.setString(++k, "%" + paramDto.getSearchData() +"%");
				pstmt.setString(++k, "%" + paramDto.getSearchData() +"%");
			} else if(paramDto.getSearchGubun().equals("writer")|| paramDto.getSearchGubun().equals("subject") || paramDto.getSearchGubun().equals("content")){
				pstmt.setString(++k, "%" + paramDto.getSearchData() +"%");
			} else {
				
			}
			
			pstmt.setInt(++k, paramDto.getStartRecord());
			pstmt.setInt(++k, paramDto.getLastRecord());
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNo(rs.getInt("no"));
				dto.setNum(rs.getInt("num"));
				dto.setTbl(rs.getString("tbl"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setEmail(rs.getString("email"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setRefNo(rs.getInt("refNo"));
				dto.setStepNo(rs.getInt("stepNo"));
				dto.setLevelNo(rs.getInt("levelNo"));
				dto.setParentNo(rs.getInt("parentNo"));
				dto.setHit(rs.getInt("hit"));
				dto.setIp(rs.getString("ip"));
				dto.setMemberNo(rs.getInt("memberNo"));
				dto.setNoticeNo(rs.getInt("noticeNo"));
				dto.setSecretGubun(rs.getString("secretGubun"));
				dto.setRegiDate(rs.getDate("regiDate"));
				dto.setAttachInfo(rs.getString("attachInfo"));
				list.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		} 
		return list;
	}

	public BoardDTO getSelectOne(BoardDTO paramDto) {
		conn = DB.dbConn();
		BoardDTO dto = new BoardDTO();
		try {
			String sql ="select * from (";
			
			sql += "select b.*, ";
			
			sql += "LAG(no) OVER (order by noticeNo desc, refNo desc, levelNo asc) preNo,";
			sql += "LAG(subject) over (order by noticeNo desc, refNo desc, levelNo asc) preSubject,";
			
			sql += "LEAD(no) OVER (order by noticeNo desc, refNo desc, levelNo asc) nxtNo,";
			sql += "LEAD(subject) over (order by noticeNo desc, refNo desc, levelNo asc) nxtSubject ";
			
			sql += "from board b where 1 = 1 ";
			
			
			if(paramDto.getSearchGubun() == null || paramDto.getSearchGubun().length() <= 0) {
				
			} else if(paramDto.getSearchGubun().equals("writer_subject_content")) {
				sql += "and (writer like ? or subject like ? or content like ?) ";
			} else if(paramDto.getSearchGubun().equals("writer")|| paramDto.getSearchGubun().equals("subject") || paramDto.getSearchGubun().equals("content")){
				sql += "and "+paramDto.getSearchGubun()+" like ?";
			} else {
				
			}
			
			sql += "order by noticeNo desc, refNo desc, levelNo asc";
			sql += ") where no = ? ";
				
			pstmt = conn.prepareStatement(sql);
			int k = 0;
			if(paramDto.getSearchGubun() == null || paramDto.getSearchGubun().length() <= 0) {
				
			} else if(paramDto.getSearchGubun().equals("writer_subject_content")) {
				pstmt.setString(++k, "%" + paramDto.getSearchData() +"%");
				pstmt.setString(++k, "%" + paramDto.getSearchData() +"%");
				pstmt.setString(++k, "%" + paramDto.getSearchData() +"%");
			} else if(paramDto.getSearchGubun().equals("writer")|| paramDto.getSearchGubun().equals("subject") || paramDto.getSearchGubun().equals("content")){
				pstmt.setString(++k, "%" + paramDto.getSearchData() +"%");
			} else {
				
			}
			pstmt.setInt(++k, paramDto.getNo());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setNum(rs.getInt("num"));
				dto.setTbl(rs.getString("tbl"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setEmail(rs.getString("email"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setRefNo(rs.getInt("refNo"));
				dto.setStepNo(rs.getInt("stepNo"));
				dto.setLevelNo(rs.getInt("levelNo"));
				dto.setParentNo(rs.getInt("parentNo"));
				dto.setHit(rs.getInt("hit"));
				dto.setIp(rs.getString("ip"));
				dto.setMemberNo(rs.getInt("memberNo"));
				dto.setNoticeNo(rs.getInt("noticeNo"));
				dto.setSecretGubun(rs.getString("secretGubun"));
				dto.setRegiDate(rs.getDate("regiDate"));
				dto.setAttachInfo(rs.getString("attachInfo"));
				
				dto.setPreNo(rs.getInt("preNo"));
				dto.setPreSubject(rs.getString("preSubject"));
				dto.setNxtNo(rs.getInt("nxtNo"));
				dto.setNxtSubject(rs.getString("nxtSubject"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		} 
		return dto;
	}

	public int setInsert(BoardDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql= "insert into board values("
					+ "seq_board.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,? ,? ,? ,? ,? ,? ,sysdate ,? "
					+ ")";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getNum());
			pstmt.setString(2, paramDto.getTbl());
			pstmt.setString(3, paramDto.getWriter());
			pstmt.setString(4, paramDto.getSubject());
			pstmt.setString(5, paramDto.getContent());
			pstmt.setString(6, paramDto.getEmail());
			pstmt.setString(7, paramDto.getPasswd());
			pstmt.setInt(8, paramDto.getRefNo());
			pstmt.setInt(9, paramDto.getStepNo());
			pstmt.setInt(10, paramDto.getLevelNo());
			pstmt.setInt(11, paramDto.getParentNo());
			pstmt.setInt(12, paramDto.getHit());
			pstmt.setString(13, paramDto.getIp());
			pstmt.setInt(14, paramDto.getMemberNo());
			pstmt.setInt(15, paramDto.getNoticeNo());
			pstmt.setString(16, paramDto.getSecretGubun());
			pstmt.setString(17,paramDto.getAttachInfo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}

	
	public int setUpdate(BoardDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "update board set "
					+ "subject = ?, "
					+ "content = ?, "
					+ "email = ?,"
					+ "noticeNo = ?,"
					+ "secretGubun = ?, "
					+ "attachInfo = ? "
					+ "where no = ? and passwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getSubject());
			pstmt.setString(2, paramDto.getContent());
			pstmt.setString(3, paramDto.getEmail());
			pstmt.setInt(4, paramDto.getNoticeNo());
			pstmt.setString(5, paramDto.getSecretGubun());
			pstmt.setString(6, paramDto.getAttachInfo());
			pstmt.setInt(7, paramDto.getNo());
			pstmt.setString(8, paramDto.getPasswd());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		
		return result;
	}

	public int setDelete(BoardDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "delete from board where no = ? and passwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getNo());
			pstmt.setString(2, paramDto.getPasswd());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		
		return result;
	}
	
	public int getMaxValueNumRefNoNoticeNo(String str) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "select nvl(max(";
			sql += str;
			sql += "), 0) maxValue from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("maxValue");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	
	
	public void setUpdateReLevel(BoardDTO paramDto) {
		conn = DB.dbConn();
		try {
			String sql = "update board set levelNo = (levelNo + 1) where refNo = ? and levelNo > ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getRefNo());
			pstmt.setInt(2, paramDto.getLevelNo());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
	}
}
