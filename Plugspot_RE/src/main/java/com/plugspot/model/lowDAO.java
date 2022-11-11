package com.plugspot.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.plugspot.db.SqlSessionManager;

public class lowDAO {
	private SqlSessionFactory sqlSessionFactory =SqlSessionManager.getSqlSession();
	public ArrayList<lowDTO> low() {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<lowDTO> list = (ArrayList)session.selectList("low");
		System.out.println(list.size());
		session.close();
		
		return list;
	}
	
}

