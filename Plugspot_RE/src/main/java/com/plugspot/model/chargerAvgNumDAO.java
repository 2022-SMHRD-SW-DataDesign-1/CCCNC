package com.plugspot.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.plugspot.db.SqlSessionManager;

public class chargerAvgNumDAO {
	private SqlSessionFactory sqlSessionFactory =SqlSessionManager.getSqlSession();
	
	
	
	public ArrayList<chargerAvgNumDTO> chargerAvgNum() {
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<chargerAvgNumDTO> chargerAvgNumList = (ArrayList)session.selectList("chargerAvgNum");
		session.close();
		return chargerAvgNumList;
	}
	
	
}
