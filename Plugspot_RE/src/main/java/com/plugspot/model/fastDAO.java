package com.plugspot.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.plugspot.db.SqlSessionManager;

public class fastDAO {
	private SqlSessionFactory sqlSessionFactory =SqlSessionManager.getSqlSession();
	public ArrayList<fastDTO> fast() {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<fastDTO> list = (ArrayList)session.selectList("fast");
		System.out.println(list.size());
		session.close();
		
		return list;
	}
	
}
