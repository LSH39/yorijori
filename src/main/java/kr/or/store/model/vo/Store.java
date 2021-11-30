package kr.or.store.model.vo;

import lombok.Data;

@Data
public class Store {
	//롬복 라이브러리 생성자, gt, st 자동으로 생성
	private int storeNo;
	private String storeName;
	private String storePostcode;
	private String storeAddr1;
	private String storeAddr2;
}
