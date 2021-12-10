package kr.or.profile.model.service;


import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.model.vo.Member;
import kr.or.mypage.model.vo.Follow;
import kr.or.profile.model.dao.ProfileDao;
import kr.or.recipe.model.vo.RecipeBoard;


@Service
public class ProfileService {

	@Autowired
	private ProfileDao dao;

	//프로필 정보
	public Member selectOneProfile(String memberId) {
		// TODO Auto-generated method stub
		Member member = dao.selectOneProfile(memberId);
		return member;
	}

	//팔로우
	public int selectOneFollow(int memberNo) {
		// TODO Auto-generated method stub
		int follow = dao.selectOneFollow(memberNo);
		return follow;
	}

	//팔로워
	public int selectOneFollower(int memberNo) {
		// TODO Auto-generated method stub
		int follower = dao.selectOneFollower(memberNo);
		return follower;
	}

	//레시피 게시물 수
	public int selectOneReceipeCnt(int memberNo) {
		// TODO Auto-generated method stub
		int rbCnt = dao.selectOneReceipeCnt(memberNo);
		return rbCnt;
	}

	//팔로우 하기
	public int insertFollow(int memberNo, int myMemberNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("myMemberNo", myMemberNo);
		map.put("memberNo", memberNo);
		int result = dao.insertFollow(map);
		return result;
	}

	//언팔로우 하기
	public int deleteFollow(int memberNo, int myMemberNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("myMemberNo", myMemberNo);
		map.put("memberNo", memberNo);
		int result = dao.deleteFollow(map);
		return result;
	}

	//팔로우 언팔로우 여부 조사
	public Follow checkOneFollow(int memberNo, int myMemberNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("myMemberNo", myMemberNo);
		map.put("memberNo", memberNo);
		Follow fl = dao.checkOneFollow(map);
		return fl;
	}
	
	//레시피 리스트 조회
	public ArrayList<RecipeBoard> selectAllList(int memberNo) {
		// TODO Auto-generated method stub
		ArrayList<RecipeBoard> list = dao.selectAllList(memberNo);
		return list;
	}
	
	
}
