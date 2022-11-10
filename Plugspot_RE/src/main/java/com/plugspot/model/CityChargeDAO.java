package com.plugspot.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.plugspot.db.SqlSessionManager;

public class CityChargeDAO {
	private SqlSessionFactory sqlSessionFactory =SqlSessionManager.getSqlSession();
	public ArrayList<CityChargeDTO> station() {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<CityChargeDTO> list = (ArrayList)session.selectList("station");
		System.out.println(list.size());
		session.close();
		
		return list;
	}
	

}