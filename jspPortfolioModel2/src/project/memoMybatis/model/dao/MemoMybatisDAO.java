package project.memoMybatis.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import project._mybatisConfig.MybatisManager;
import project.memoMybatis.model.dto.MemoMybatisDTO;

public class MemoMybatisDAO {
	String tableName01 = "memo";
	public int getTotalRecord(MemoMybatisDTO paramDto) {
		Map<String, Object> map = new HashMap<>(); //보내야할 매개변수가 여러개 일때
		map.put("dto", paramDto); 
		map.put("tableName01", tableName01);
		
		SqlSession session = MybatisManager.getinstance().openSession();
		int result = session.selectOne("memoMybatis.getTotalRecord",map);
		session.close();
		return result;
	}
	
	public List<MemoMybatisDTO> getSelectAll(MemoMybatisDTO paramDto) {
		Map<String, Object> map = new HashMap<>(); //보내야할 매개변수가 여러개 일때
		map.put("dto", paramDto);
		map.put("tableName01", tableName01);
		
		SqlSession session = MybatisManager.getinstance().openSession();
		List<MemoMybatisDTO> list = session.selectList("memoMybatis.getSelectAll",map);
		session.close();
		
		return list;
	}

	public MemoMybatisDTO getSelectOne(MemoMybatisDTO paramDto) {
		
		Map<String, Object> map = new HashMap<>(); //보내야할 매개변수가 여러개 일때
		map.put("dto", paramDto); 
		map.put("tableName01", tableName01);
		
		SqlSession session = MybatisManager.getinstance().openSession();
		MemoMybatisDTO dto = session.selectOne("memoMybatis.getSelectOne",map);
		return dto;
	}

	public int setInsert(MemoMybatisDTO paramDto) {
		Map<String, Object> map = new HashMap<>(); //보내야할 매개변수가 여러개 일때
		map.put("dto", paramDto); 
		map.put("tableName01", tableName01);
		
		SqlSession session = MybatisManager.getinstance().openSession();
		//int result = session.insert("네임스페이스.태그아이디","물고갈 값");
		int result = session.insert("memoMybatis.setInsert",map);
		session.commit();
		session.close();
		return result;
	}

	public int setUpdate(MemoMybatisDTO paramDto) {
		Map<String, Object> map = new HashMap<>(); //보내야할 매개변수가 여러개 일때
		map.put("dto", paramDto); 
		map.put("tableName01", tableName01);
		
		SqlSession session = MybatisManager.getinstance().openSession();
		int result = session.update("memoMybatis.setUpdate",map);
		session.commit();
		session.close();

		return result;
	}

	public int setDelete(MemoMybatisDTO paramDto) {
		Map<String, Object> map = new HashMap<>(); //보내야할 매개변수가 여러개 일때
		map.put("dto", paramDto); 
		map.put("tableName01", tableName01);
		
		SqlSession session = MybatisManager.getinstance().openSession();
		int result = session.delete("memoMybatis.setDelete",map);
		session.commit();
		session.close();

		return result;
	}

}
