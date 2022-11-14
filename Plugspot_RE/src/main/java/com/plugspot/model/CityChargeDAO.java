package com.plugspot.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.plugspot.db.SqlSessionManager;

public class CityChargeDAO {
	private SqlSessionFactory sqlSessionFactory =SqlSessionManager.getSqlSession();
	
	
	
	public ArrayList<CityChargeDTO> station(int loc_seq) {
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<CityChargeDTO> list = (ArrayList)session.selectList("station",loc_seq);
		System.out.println(list.size());
		session.close();
		
		return list;
	}
	

}