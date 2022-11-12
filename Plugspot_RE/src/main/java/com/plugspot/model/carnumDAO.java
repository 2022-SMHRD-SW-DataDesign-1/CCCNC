package com.plugspot.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.plugspot.db.SqlSessionManager;

public class carnumDAO {
	private SqlSessionFactory sqlSessionFactory =SqlSessionManager.getSqlSession();
	
	
	
	
	public ArrayList<carnumDTO> carnum() {
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<carnumDTO> carlist = (ArrayList)session.selectList("carnum");
		session.close();
		return carlist;
	}
	
	
	
}
