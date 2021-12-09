package kr.or.profile.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Member;
import kr.or.mypage.model.vo.Follow;
import kr.or.recipe.model.vo.RecipeBoard;

@Repository
public class ProfileDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//프로필 정보
	public Member selectOneProfile(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectOneProfile", memberId);
	}

	//팔로우 수
	public int selectOneFollow(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("follow.selectOneFollow", memberNo);
	}

	//팔로워 수
	public int selectOneFollower(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("follow.selectOneFollower", memberNo);
	}

	//레시피 수
	public int selectOneReceipeCnt(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recipe.selectOneReceipeCnt", memberNo);
	}

	//팔로우
	public int insertFollow(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("follow.insertFollow", map);
	}

	//언팔로우
	public int deleteFollow(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("follow.deleteFollow", map);
	}

	//팔로우 언팔로우 확인
	public Follow checkOneFollow(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("follow.checkOneFollow", map);
	}

	//레시피 목록 리스트
	public ArrayList<RecipeBoard> selectAllList(int memberNo) {
		// TODO Auto-generated method stub
		List<RecipeBoard> list = sqlSession.selectList("recipe.selectAllList", memberNo);
		return (ArrayList<RecipeBoard>) list;
	}
	
	
	
}
