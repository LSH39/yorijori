package kr.or.profile.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.profile.model.dao.ProfileDao;

@Service
public class ProfileService {

	@Autowired
	private ProfileDao dao;
	
}
