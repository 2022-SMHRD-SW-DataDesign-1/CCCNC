package com.plugspot.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.plugspot.db.SqlSessionManager;

import com.plugspot.model.MemberDTO;

public class MemberDAO {

private SqlSessionFactory sqlSessionFactory =SqlSessionManager.getSqlSession();
	
	
	
	public int join (MemberDTO dto) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		
		int row = session.insert("join", dto);
		
		session.close();
		
		return row;
}

	public boolean idCheck(String inputE) {
		SqlSession session=sqlSessionFactory.openSession(true);
		boolean checkE  = session.selectOne("idCheck", inputE);
		session.close();
		return checkE; 
		
}
	public MemberDTO login(MemberDTO dto) {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		MemberDTO info = session.selectOne("Login", dto);
		session.close();
		
		return info;
		
		
	}
	public int update(MemberDTO dto) {
		SqlSession session=sqlSessionFactory.openSession(true);
		int info = session.update("update", dto);
		session.close();
		
		return info;


}
	
}