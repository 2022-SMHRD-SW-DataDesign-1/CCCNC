package com.plugspot.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.plugspot.db.SqlSessionManager;

public class citySpeedChargerDAO {

	private SqlSessionFactory sqlSessionFactory =SqlSessionManager.getSqlSession();
	
	public ArrayList<citySpeedChargerDTO> citySpeedCharger() {
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<citySpeedChargerDTO> citySpeedlist = (ArrayList)session.selectList("citySpeedCharger");
		session.close();
		return citySpeedlist;
	}
	
	
}
