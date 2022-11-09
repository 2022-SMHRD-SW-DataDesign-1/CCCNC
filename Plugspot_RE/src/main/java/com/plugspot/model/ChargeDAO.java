package com.plugspot.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.plugspot.db.SqlSessionManager;

public class ChargeDAO {
	private SqlSessionFactory sqlSessionFactory =SqlSessionManager.getSqlSession();
	
public int state (ChargeDTO dto) {
		
	SqlSession session = sqlSessionFactory.openSession(true);
		
		int row = session.insert("state", dto);
		
		session.close();
		
		return row;
}

public ArrayList<ChargeDTO> mystate(String member_num) {
	System.out.println("여기 도착-mystate");
	
	SqlSession session = sqlSessionFactory.openSession(true);
	ArrayList<ChargeDTO> list = (ArrayList)session.selectList("mystate",member_num);
	System.out.println("dao :"+list);
	session.close();
	return list;
}
}
