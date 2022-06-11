package com.example.demo.service;



import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.jpa.JpaMemberDao;
import com.example.demo.domain.Member;
import com.example.demo.repository.MemberRepository;

@Service
@Transactional 
public class MemberService {

	private JpaMemberDao memberDao;
	
	@Autowired
	private MemberRepository memberRepository;
	
	
	public void insertMember(Member member) {
		memberRepository.save(member);
	}
	
	public boolean findMemberByNickName(String nickName) {
		List<Member> member = (List<Member>) memberRepository.findMemberByNickName(nickName);
		if(member.size() == 0) {
			return true;
		} else {
			return false;
		}	
	}
	
	public Member findMemberByNickName2(String nickName) {
		List<Member> member = (List<Member>) memberRepository.findMemberByNickName(nickName);
		if(member.size() == 0)
			return null;
		return member.get(0);
	}
}
