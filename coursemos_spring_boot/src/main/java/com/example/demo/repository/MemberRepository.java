package com.example.demo.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.domain.Member;

public interface MemberRepository extends CrudRepository<Member, String> {
	
	
	List<Member> findMemberByNickName(String nickName);

	Member findMemberById(Long id);

	
}
