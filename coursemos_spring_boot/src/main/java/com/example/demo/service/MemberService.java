package com.example.demo.service;



import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.jpa.JpaMemberDao;
import com.example.demo.domain.Member;

@Service
@Transactional 
public class MemberService {
	@Autowired 
	private JpaMemberDao memberDao;
	
	public void insertMember(Member member) {
		memberDao.insertMember(member);		
	}

	
}
