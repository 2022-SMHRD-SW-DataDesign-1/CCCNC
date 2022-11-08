package com.plugspot.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.plugspot.db.SqlSessionManager;

public class ChargeDAO {
	private SqlSessionFactory sqlSessionFactory =SqlSessionManager.getSqlSession();
	
public int state (ChargeDTO dto) {
		
	SqlSession session = sqlSessionFactory.openSession(true);
		
		int row = session.insert("state", dto);
		
		session.close();
		
		return row;
}
}
