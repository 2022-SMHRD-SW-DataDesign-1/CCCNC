package com.plugspot.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.plugspot.db.SqlSessionManager;


public class kakaoDAO {
	private SqlSessionFactory sqlSessionFactory =SqlSessionManager.getSqlSession();
	public ArrayList<kakaoDTO> kakao() {
		
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<kakaoDTO> list = (ArrayList)session.selectList("kakao");
		session.close();
		
		return list;
		
		
	}
}
