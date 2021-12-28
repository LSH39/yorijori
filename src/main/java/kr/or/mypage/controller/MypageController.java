package kr.or.mypage.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.or.cookingCls.model.vo.CookingClsPageData;
import kr.or.cookingRsrv.model.vo.MyCookingRsrv;
import kr.or.coupon.model.vo.MyCouponPageData;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.ReadMember;
import kr.or.mypage.model.service.MypageService;
import kr.or.mypage.model.vo.ContestWin;
import kr.or.mypage.model.vo.DetailOrder;
import kr.or.mypage.model.vo.MyFreeBoardPageData;
import kr.or.mypage.model.vo.MyItem;
import kr.or.mypage.model.vo.MyLikeRecipePageData;
import kr.or.mypage.model.vo.MyPointPageData;
import kr.or.mypage.model.vo.MySellPageData;
import kr.or.mypage.model.vo.Mychat;
import kr.or.mypage.model.vo.MycontestPagedata;
import kr.or.mypage.model.vo.MymembershipPageData;
import kr.or.mypage.model.vo.Myorder;
import kr.or.mypage.model.vo.MyorderPageData;
import kr.or.mypage.model.vo.Mysell;
import kr.or.mypage.model.vo.ReadDm;
import kr.or.mypage.model.vo.followCount;
import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.review.model.vo.MyClassReview;
import kr.or.review.model.vo.MyItemReview;

@Controller
public class MypageController {
	@Autowired 
	private MypageService service;


	//내 정보보기(회원)
	@RequestMapping(value = "/mypage.do")
	public String mypage(String memberNickname, Model model,HttpSession session) {
		ReadMember rm =service.mypage(memberNickname);
        session.setAttribute("rm", rm);
	    model.addAttribute("rm", rm);
	    
		//Member m = service.mypage(memberId);
       //model.addAttribute("m", m);
		return "mypage/mypage";
	}
	
	//내 정보보기(전문가)
	@RequestMapping(value = "/selPage.do")
	public String selPage(String memberNickname, Model model,HttpSession session) {
		ReadMember rm =service.seller(memberNickname);
		   session.setAttribute("rm", rm);
			model.addAttribute("rm", rm);
			
		//Member m = service.sellerPage(memberId);
		//model.addAttribute("m", m);
		return "mypage/sellerProfile";
	}
	//내 자격증 조회
	@RequestMapping(value = "/selPath.do")
	public String selPath(String memberId, Model model) {
		Member m = service.sellerPage(memberId);
		model.addAttribute("m", m);
		return "mypage/updateFrm";
	}
	//내 프로필 조회
	@RequestMapping(value = "/profilePath.do")
	public String profilePath(String memberId, Model model) {
		Member m = service.profile(memberId);
		model.addAttribute("m", m);
		return "mypage/updateProfile";
	}

	//내 레시피내역
	@RequestMapping(value = "/myRecipe.do")
	public String myRecipe(int recipeWriter, Model model) {
		ArrayList<RecipeBoard> list= service.myRecipe(recipeWriter);
		model.addAttribute("list", list);
		return "mypage/myRecipe";
	}

	//예약 클래스내역
	@RequestMapping(value = "/myclass.do")
	public String myclass(int memberNo, Model model) {
		ArrayList<MyCookingRsrv> list= service.myclass(memberNo);
		model.addAttribute("list", list);
		return "mypage/myReserve";
	}
	//클래스후기
	@RequestMapping(value = "/myclassReview.do")
	public String myclassReview(String memberNickname, Model model) {
		ArrayList<MyClassReview> list= service.myclassReview(memberNickname);
		model.addAttribute("list", list);
		return "mypage/myClassReview";
	}
	//밀키트후기
	@RequestMapping(value = "/myitemReview.do")
	public String myitemReview(String memberNickname, Model model) {
		ArrayList<MyItemReview> list= service.myItemReview(memberNickname);
		model.addAttribute("list", list);
		return "mypage/myItemReview";
	}
	//역대우승자
	@RequestMapping(value = "/contestWinner.do")
	public String contestWinner(Model model) {
		ArrayList<ContestWin> list= service.contestWin();
		model.addAttribute("list", list);
		return "mypage/winnerList";
	}
	//내 밀키트상품조회
	@RequestMapping(value = "/myItem.do")
	public String myItem(int milkitWriter,Model model) {
		ArrayList<MyItem> list= service.myItem(milkitWriter);
		model.addAttribute("list", list);
		return "mypage/myItem1";
	}


	//내 채팅리스트
	@RequestMapping(value = "/myChatList.do")
	public String myChatList(int chatReceive,Model model) {
		ArrayList<Mychat> list= service.myChatList(chatReceive);
		model.addAttribute("list", list);
		return "mypage/chatList";
	}

	//내 주문내역보기
	@RequestMapping(value = "/myOrderList.do")
	public String myOrderList1(int memberNo,Model model,int reqPage) {
		MyorderPageData mpd =service.orderList(reqPage,memberNo);
		model.addAttribute("list", mpd.getList());
		model.addAttribute("pageNavi", mpd.getPageNavi());
		model.addAttribute("start", mpd.getStart());
		model.addAttribute("totalCount", mpd.getTotalCount());
		return "mypage/myOrder";

	}
	//내 쿠폰내역
	@RequestMapping(value = "/mycouponList.do")
	public String mycoupon(int memberNo, Model model,int reqPage) {
		MyCouponPageData cpd =service.mycouponList(reqPage,memberNo);
		model.addAttribute("list", cpd.getList());
		model.addAttribute("pageNavi", cpd.getPageNavi());
		model.addAttribute("start", cpd.getStart());
		model.addAttribute("totalCount", cpd.getTotalCount());

		return "mypage/myCoupon";
	}
	//내 참여대회내역
	@RequestMapping(value = "/myContestList.do")
	public String myContestList(int recipeWriter, Model model,int reqPage) {
		MycontestPagedata ctpd =service.mycontestList(reqPage,recipeWriter);
		model.addAttribute("list", ctpd.getList());
		model.addAttribute("pageNavi", ctpd.getPageNavi());
		model.addAttribute("start", ctpd.getStart());
		model.addAttribute("totalCount", ctpd.getTotalCount());

		return "mypage/myContest";
	}
	//내 팔로우리스트
	@RequestMapping(value = "/followList.do")
	public String followList(int memberNo,Model model) {
		followCount fct =service.followList(memberNo);
		model.addAttribute("list", fct.getList());
		model.addAttribute("totalCount", fct.getTotalCount());

		return "mypage/myFollow";
	}
	//내 dm 내역(쪽지)
	@RequestMapping(value = "/mydmList.do")
	public String myDmList(String dmReceiver,Model model,HttpSession session) {
		ReadDm rd =service.myDmList(dmReceiver);
		//ArrayList<Mydm> list= service.myDmList(dmReceiver);
		session.setAttribute("rm", rd);
		model.addAttribute("list", rd.getList());
		model.addAttribute("dmCount", rd.getDmCount());
		return "mypage/dmList";
	}
	//내 게시판리스트
	@RequestMapping(value = "/myBoardList.do")
	public String myBoardList(String freeWriter, Model model,int reqPage) {
		MyFreeBoardPageData fpd =service.myfreeBoardList(reqPage,freeWriter);
		model.addAttribute("list", fpd.getList());
		model.addAttribute("pageNavi", fpd.getPageNavi());
		model.addAttribute("start", fpd.getStart());
		model.addAttribute("totalCount", fpd.getTotalCount());

		return "mypage/myBoard";
	}
	/*
	@RequestMapping(value = "/likeRecipe.do")
	public String likeRecipe(int memberNo,Model model) {
		ArrayList<LikeRecipe> list= service.likeRecipe(memberNo);
		model.addAttribute("list", list);
		return "mypage/likeRecipe";
	}*/

	//내가 찜한 레시피내역
	@RequestMapping(value = "/myLikeList.do")
	public String myLikeList(int memberNo, Model model,int reqPage) {
		MyLikeRecipePageData rpd =service.likeRecipeList(reqPage,memberNo);
		model.addAttribute("list", rpd.getList());
		model.addAttribute("pageNavi", rpd.getPageNavi());
		model.addAttribute("start", rpd.getStart());
		model.addAttribute("totalCount", rpd.getTotalCount());

		return "mypage/likeRecipe";
	}
	//주문상세 내역
	@RequestMapping(value = "/detailOrder.do")
	public String detailOrder(int orderNo, Model model) {
		ArrayList<Myorder> list= service.orderDetail(orderNo);
		model.addAttribute("list", list);
		DetailOrder dd = service.myOrderDetail(orderNo);
		model.addAttribute("dd", dd);
		return "mypage/orderDetail";
	}

	@RequestMapping(value = "/sellList.do")
	public String sellList(int milkitWriter, Model model,int reqPage) {
		MySellPageData spd =service.mySellList1(reqPage,milkitWriter);
		model.addAttribute("list", spd.getList());
		model.addAttribute("pageNavi", spd.getPageNavi());
		model.addAttribute("start", spd.getStart());
		model.addAttribute("totalCount", spd.getTotalCount());
		model.addAttribute("reqPage", reqPage);
		return "mypage/sellerList";
	}
	//누적판매량
	@RequestMapping(value = "/totalSell.do")
	public String totalSell(int milkitWriter, Model model) {
		ArrayList<Mysell> list= service.totalSell(milkitWriter);
		model.addAttribute("list", list);
		return "mypage/myItem";
	}
	//전문가 정보변경
	@RequestMapping(value = "/updateSeller.do")
	public String updateSeller(Member m, Model model) {
		int result = service.updateSeller(m);

		if (result > 0) {
			model.addAttribute("msg", "정보변경 성공");
		} else {
			model.addAttribute("msg", "정보변경 실패");
		}
		model.addAttribute("loc", "/selPage.do?memberNickname="+m.getMemberNickname());
		return "common/msg";
	}
	//회원정보변경
	@RequestMapping(value = "/updateMember.do")
	public String updateMember(Member m, Model model) {

		int result = service.upMember(m);
		if (result > 0) {
			model.addAttribute("msg", "정보변경 성공");
		} else {
			model.addAttribute("msg", "정보변경 실패");
		}
		model.addAttribute("loc", "/mypage.do?memberNickname="+m.getMemberNickname());
		return "common/msg";
	}

	//포인트 내역확인하기

	@RequestMapping(value = "/myPoint.do")
	public String myPoint(int memberNo, Model model,int reqPage) {
	
		MyPointPageData ppd =service.pointList(reqPage,memberNo);
		model.addAttribute("list", ppd.getList());
		model.addAttribute("pageNavi",ppd.getPageNavi());
		model.addAttribute("start", ppd.getStart());
		model.addAttribute("totalCount", ppd.getTotalCount());
		model.addAttribute("totalPoint", ppd.getTotalPoint());
		model.addAttribute("usePoint", ppd.getUsePoint());
		return "mypage/myPoint";
	}
	//쿠킹 클래스
	@RequestMapping(value="/mycookingList.do")
	public String SelectAllClass(String memberNickname,int reqPage, Model model) {
		//새로
		CookingClsPageData ccpd = service.selectMyClass(reqPage,memberNickname);

		model.addAttribute("list", ccpd.getList());
		model.addAttribute("pageNavi", ccpd.getPageNavi());
		model.addAttribute("start", ccpd.getList());
		return "mypage/myCooking";


	}

	//자격증 변경하기(조리꾼,미인증 재제출)

	@RequestMapping(value="/updateCerPath.do")
	public String updateCerPath(Model model, Member m,MultipartFile upfile, HttpServletRequest request, String oldFilepath) {
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/member_certificate/");

		//기존 파일 삭제
		if(oldFilepath != null) {
			String fullPath = savePath + m.getCertificatePath();
			File f = new File(fullPath);
			if(f.isFile()) {
				f.delete();
			}
		}
	
		if(!upfile.isEmpty()) {
			savePath = request.getSession().getServletContext().getRealPath("/resources/upload/member_certificate/");
			
				String filename = upfile.getOriginalFilename();
				String onlyFilename = filename.substring(0,filename.indexOf("."));
				String extention = filename.substring(filename.indexOf("."));
				String filepath = null;
				int count=0;
				while(true) {  
					if(count == 0) {
						filepath = onlyFilename+extention;
					}else {
						filepath = onlyFilename+"_"+count+extention;
					}
					File checkFile = new File(savePath+filepath);
					if(!checkFile.exists()) {
						break;
					}
					count++;
				}
				//업로드 시작
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
					//보조스트림
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					//파일 업로드
					byte[] bytes = upfile.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					
					e.printStackTrace();
				} catch (IOException e) {
				
					e.printStackTrace();
				}
				m.setCertificatePath(filepath);

			}
		int result = service.updateCer(m);
	
		if(result >0) {
			model.addAttribute("msg", "자격증수정 완료");
		} else {
			model.addAttribute("msg", "자격증 다시 올려주십셔ㅠㅠ");
		}
		model.addAttribute("loc", "/selPath.do?memberId="+m.getMemberId());
		return "common/msg";

	}

	/*프로필 사진 변경하기*/
	@RequestMapping(value="/updateProfile.do")
	public String updateProfile(Model model, Member m,MultipartFile upfile, HttpServletRequest request, String oldFilepath) {
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/member_profile/");
		System.out.println("oldFilepath:"+oldFilepath);
		System.out.println("upfile:"+upfile.getOriginalFilename());

		//기존 파일 삭제
		if(oldFilepath != null) {
			
			String fullPath = savePath + m.getProfilePath();
			File f = new File(fullPath);
			if(f.isFile()) {
				f.delete();
			}
		}
	
		if(!upfile.isEmpty()) {
			savePath = request.getSession().getServletContext().getRealPath("/resources/upload/member_profile/");
			
				String filename = upfile.getOriginalFilename();
				String onlyFilename = filename.substring(0,filename.indexOf("."));
				String extention = filename.substring(filename.indexOf("."));
				String filepath = null;
				int count=0;
				while(true) {  
					if(count == 0) {
						filepath = onlyFilename+extention;
					}else {
						filepath = onlyFilename+"_"+count+extention;
					}
					File checkFile = new File(savePath+filepath);
					if(!checkFile.exists()) {
						break;
					}
					count++;
				}
				//업로드 시작
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
					//보조스트림
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					//파일 업로드
					byte[] bytes = upfile.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					
					e.printStackTrace();
				} catch (IOException e) {
				
					e.printStackTrace();
				}
				m.setProfilePath(filepath);

			}
	
		int result = service.updateSell(m);
	
		if(result >0) {
			model.addAttribute("msg", "프로필사진 수정 완료");
		} else {
			model.addAttribute("msg", "프로필 사진 수정 실패");
		}
		model.addAttribute("loc", "/profilePath.do?memberId="+m.getMemberId());
		return "common/msg";

	}

	//주문 상태 변경
	@RequestMapping(value="/updateOrder.do")
	public String updateOrder(Mysell ms, Model model,int reqPage) {
		System.out.println(ms.getMilkitWriter());
		//System.out.println("주문상태 : "+ms.getOrderStatus() );
       // System.out.println("옵션번호 : "+ms.getOrderOptionNo());
		int result = service.uporder(ms);
		
		if (result > 0) {
			model.addAttribute("msg", "주문상태 변경 성공");
		} else {
			model.addAttribute("msg", "주문상태 변경 실패");
		}

		if(ms.getOrderStatus()== 4) {
			System.out.println("수량 : "+ms.getOrderOptionAmount());	
			System.out.println("금액 : "+ms.getMilkitPrice());	
			result =service.raisePoint(ms);
			if (result > 0) {
				model.addAttribute("msg", "포인트 내역추가");
			}else
			{
				model.addAttribute("msg", "포인트 내역추가 실패");
			}
			System.out.println("회원번호:"+ms.getMemberNo());
			 int  result1 =service.updatePoint(ms);
			if (result1 > 0) {
				model.addAttribute("msg", "포인트 적립성공");
			}else
			{
				model.addAttribute("msg", "포인트 적립 실패");
			}
		}	
		System.out.println(ms.getMilkitWriter());
		
		model.addAttribute("loc", "/sellList.do?milkitWriter="+ms.getMilkitWriter()+"&reqPage="+reqPage);
		return "common/msg";
	}

	
	@RequestMapping(value = "/cancelOrder.do")
	public String cancelOrder(int orderNo,int orderSale,int memberNo,Model model) {
		System.out.println("orderNo"+orderNo);
		System.out.println("orderSale"+orderSale);
		System.out.println("memberNo"+memberNo);
		int result = service.cancelOrder(orderNo);
	    
		if (result > 0) {
			model.addAttribute("msg", "주문이 취소되었습니다.");
		} else {
			model.addAttribute("msg", "주문취소가 실패했습니다");
		}

		if(orderSale>0) {
			result=service.returnPoint(orderSale,memberNo);
			if (result > 0) {
				model.addAttribute("msg", "포인트 취소성공");
			}else {
				model.addAttribute("msg", "포인트 취소실패");
			}
			System.out.println("회원번호:"+memberNo);
			int result1 =service.upPoint(orderSale,memberNo);
			if (result1 > 0) {
				model.addAttribute("msg", "포인트 반환성공");
			}else
			{
				model.addAttribute("msg", "포인트 반환 실패");
			}
		}	

		model.addAttribute("loc", "/");
		return "common/msg";
	}
	
	//내 구독권내역조회
	@RequestMapping(value = "/myMembership.do")
	public String myMembership(int memberNo,Model model,int reqPage) {
		MymembershipPageData mem =service.membershipList(reqPage,memberNo);
		model.addAttribute("list", mem.getList());
		model.addAttribute("pageNavi", mem.getPageNavi());
		model.addAttribute("start", mem.getStart());
		model.addAttribute("totalCount", mem.getTotalCount());
		return "mypage/membership";

	}
}






/*
	@RequestMapping(value = "/myPoint.do")
	public String myPoint(String memberNo,Model model) {
		ArrayList<Mypoint> list= service.myPoint(memberNo);
		model.addAttribute("list", list);
		return "mypage/myPoint";
	}
 */
/*
	@RequestMapping(value = "/myBoard.do")
	public String myBoard(String freeWriter,Model model) {
		ArrayList<Freeboard> list= service.myBoard(freeWriter);
		model.addAttribute("list", list);
		return "mypage/myBoard";
	}*/
/*
	@RequestMapping(value = "/myOrderDetail.do")
	public String myOrderDetail(int orderNo, Model model) {
		Myorder mo = service.myOrderDetail(orderNo);
		model.addAttribute("mo", mo);

		return "mypage/orderDetail";
	}
 */
/*
	@RequestMapping(value = "/mycoupon.do")
	public String mycoupon(int memberNo, Model model) {
		ArrayList<MyCoupon> list= service.mycoupon(memberNo);
		model.addAttribute("list", list);
		return "mypage/myCoupon";
	}*/
/*
	@RequestMapping(value = "/myContest.do")
	public String myContest(int recipeWriter,Model model) {
		ArrayList<MyContest> list= service.myContest(recipeWriter);
		model.addAttribute("list", list);
		return "mypage/myContest";
	}*/
/*
	@RequestMapping(value = "/myOrder.do")
	public String myOrderList(int memberNo,Model model) {
		ArrayList<Myorder> list= service.myOrderList(memberNo);
		model.addAttribute("list", list);
		return "mypage/myOrder";
	}
 */

