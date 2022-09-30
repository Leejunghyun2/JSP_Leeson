package sihum.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import sihum._mybatisConfig.MybatisManager;
import sihum.member.model.dto.MemberDTO;


public class MemberDAO {
	String tableName01 = "member";
	
	public List<MemberDTO> getSelectAll(){
		Map<String, Object> map = new HashMap<>();
		map.put("tableName01", tableName01);
		SqlSession session = MybatisManager.getinstance().openSession();
		List<MemberDTO> list = session.selectList("member.getSelectAll", map);
		session.close();
		
		return list;
	}
	
	public MemberDTO getSelectOne(MemberDTO paramDto){
		Map<String, Object> map = new HashMap<>();
		map.put("tableName01", tableName01);
		map.put("dto", paramDto);
		
		SqlSession session = MybatisManager.getinstance().openSession();
		MemberDTO dto = session.selectOne("member.getSelectOne", map);
		session.close();
		
		return dto;
	}
	
	public int setInsert(MemberDTO paramDto) {
		Map<String, Object> map = new HashMap<>();
		map.put("tableName01", tableName01);
		map.put("dto", paramDto);
		
		SqlSession session = MybatisManager.getinstance().openSession();
		int result = session.insert("member.setInsert",map);
		session.commit();
		session.close();
		
		return result;
	}
	
}
