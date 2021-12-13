package kr.or.freeboard.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class FreeboardViewData {
	private ArrayList<FreeboardComment> commentList;
	private ArrayList<FreeboardFile> fileList;
	private Freeboard fb;
	private String profilePath;
	
	
	
	public FreeboardViewData(ArrayList<FreeboardComment> commentList, ArrayList<FreeboardFile> fileList, Freeboard fb,
			String profilePath) {
		super();
		this.commentList = commentList;
		this.fileList = fileList;
		this.fb = fb;
		this.profilePath = profilePath;
	}



	public FreeboardViewData() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
