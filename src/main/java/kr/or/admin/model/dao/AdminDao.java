package kr.or.admin.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.or.admin.model.vo.Member2;



@Repository
public class AdminDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Transactional
<<<<<<< HEAD
	public ArrayList<Member2> allMemberList(String searchType, String searchText, String searchDetail, String period, String start2, String end2, String moreless, String joinStart, String joinEnd,String detail,String memberLevel,String searchText2) {
		
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("searchType", searchType);
			map.put("searchText", searchText);
			map.put("memberLevel", memberLevel);
			map.put("searchDetail",searchDetail);
			map.put("period",period);
			map.put("start", start2);
			map.put("end", end2);
			map.put("moreless", moreless);
			map.put("joinStart", joinStart);
			map.put("joinEnd", joinEnd);
			map.put("searchText2", searchText2);
			map.put("detail", detail);
			List list = sqlSession.selectList("member.selectDetailMember",map);
			
			return (ArrayList<Member2>) list;
		}
	
=======
	public ArrayList<Member2> allMemberList() {
		List list = sqlSession.selectList("member.selectAllMember");
		return (ArrayList<Member2>) list;
	}

>>>>>>> refs/heads/master
	public int selectTotalCount() {
		int totalCount = sqlSession.selectOne("member.selectTotalCount");
		return totalCount;
	}
	public int addBlackMember(String memberNo) {
		StringTokenizer st = new StringTokenizer(memberNo, ",");
		String[] arr = new String[st.countTokens()];
		for(int i = 0; i<arr.length;i++) {
			arr[i]=st.nextToken();
		}
		int result = sqlSession.update("member.addBlackMember",arr);
		return result;
	}
		
		
}
