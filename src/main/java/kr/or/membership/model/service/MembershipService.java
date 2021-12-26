package kr.or.membership.model.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.membership.model.dao.MembershipDao;
import kr.or.membership.model.vo.Membership;
import kr.or.membership.model.vo.SubPayment;

@Service
public class MembershipService {
	@Autowired
	private MembershipDao dao;

	public int insertMembership(Membership m, SubPayment sp) {
		 int result =dao.insertMembership(m);
		 int membershipNo = 0;
		 if(result>0) {
			 int plusDate = m.getMembershipDate();
			 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			 LocalDate now = LocalDate.now();
			 LocalDate endDate = now.plusMonths(plusDate);
			 String endDate2 =formatter.format(endDate);
			 membershipNo = dao.selectMembershipNo();
			 sp.setMembershipNo(membershipNo);
			 sp.setPayAmount(m.getMembershipPrice());
			 sp.setMembershipEnd(endDate2);
			 result = dao.insertSubPayment(sp);
		 }
		 return result;
	}
}
