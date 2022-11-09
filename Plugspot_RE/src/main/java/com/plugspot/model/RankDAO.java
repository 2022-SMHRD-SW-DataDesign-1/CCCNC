package com.plugspot.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.plugspot.db.SqlSessionManager;


public class RankDAO {
	private SqlSessionFactory sqlSessionFactory =SqlSessionManager.getSqlSession();
	
	
	public ArrayList<RankDTO> rank() {
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<RankDTO> rklist = (ArrayList)session.selectList("rank");
		session.close();
		return rklist;

	}
}
