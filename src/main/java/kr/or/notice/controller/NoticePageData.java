package kr.or.notice.controller;

import java.util.ArrayList;

import kr.or.notice.model.vo.Notice;
import lombok.Data;

@Data
public class NoticePageData {
	private ArrayList<Notice> list;
	private String pageNavi;
	private int start;
}
