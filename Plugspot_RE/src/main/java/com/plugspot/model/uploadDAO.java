package com.plugspot.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.plugspot.model.uploadDTO;
import com.plugspot.db.SqlSessionManager;


public class uploadDAO {
	private SqlSessionFactory sqlSessionFactory=
			SqlSessionManager.getSqlSession();

public int upload(uploadDTO dto) {
	SqlSession session = sqlSessionFactory.openSession(true);
	int row = session.update("upload",dto);
	session.close();
	
	return row;

	
	
}
}