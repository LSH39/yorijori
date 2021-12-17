package kr.or.notice.model.vo;

import lombok.Data;

@Data
public class NoticeViewData {
	private Notice n;
	private int pNo;
	private int nNo;
	private Notice pn;
	private Notice nn;
}
