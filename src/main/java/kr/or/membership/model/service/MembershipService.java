package kr.or.membership.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.membership.model.dao.MembershipDao;

@Service
public class MembershipService {
	@Autowired
	private MembershipDao dao;
}
