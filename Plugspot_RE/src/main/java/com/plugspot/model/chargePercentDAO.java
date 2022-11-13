package com.plugspot.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.plugspot.db.SqlSessionManager;

public class chargePercentDAO {
	private SqlSessionFactory sqlSessionFactory =SqlSessionManager.getSqlSession();
	
	
	
	
	public ArrayList<chargePercentDTO> chargePercent() {	
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<chargePercentDTO> list = (ArrayList)session.selectList("chargePercent");
		session.close();
		return list;
	}
}
