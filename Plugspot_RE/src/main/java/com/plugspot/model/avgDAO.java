package com.plugspot.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.plugspot.db.SqlSessionManager;

public class avgDAO {
	private SqlSessionFactory sqlSessionFactory =SqlSessionManager.getSqlSession();
	public ArrayList<avgDTO> avg() {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<avgDTO> list = (ArrayList)session.selectList("avg");
		System.out.println(list.size());
		session.close();
		
		return list;
	}
	public ArrayList<avgDTO> lowavg() {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<avgDTO> list = (ArrayList)session.selectList("lowavg");
		System.out.println(list.size());
		session.close();
		
		return list;
	}
}

