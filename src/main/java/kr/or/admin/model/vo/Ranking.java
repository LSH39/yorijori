package kr.or.admin.model.vo;

import java.util.ArrayList;

import kr.or.freeboard.model.vo.Freeboard;
import kr.or.milkit.model.vo.product;
import kr.or.mypage.model.vo.Follow;
import kr.or.recipe.model.vo.RecipeBoard;

public class Ranking {
	private ArrayList<Freeboard> fbList;
	private ArrayList<RecipeBoard> rbList;
	private ArrayList<Member2> fList;
	private ArrayList<product> milList;
	public Ranking() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Ranking(ArrayList<Freeboard> fbList, ArrayList<RecipeBoard> rbList, ArrayList<Member2> fList,
			ArrayList<product> milList) {
		super();
		this.fbList = fbList;
		this.rbList = rbList;
		this.fList = fList;
		this.milList = milList;
	}
	public ArrayList<Freeboard> getFbList() {
		return fbList;
	}
	public void setFbList(ArrayList<Freeboard> fbList) {
		this.fbList = fbList;
	}
	public ArrayList<RecipeBoard> getRbList() {
		return rbList;
	}
	public void setRbList(ArrayList<RecipeBoard> rbList) {
		this.rbList = rbList;
	}
	public ArrayList<Member2> getfList() {
		return fList;
	}
	public void setfList(ArrayList<Member2> fList) {
		this.fList = fList;
	}
	public ArrayList<product> getMilList() {
		return milList;
	}
	public void setMilList(ArrayList<product> milList) {
		this.milList = milList;
	}
	
}