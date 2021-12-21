package kr.or.about.model.service;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.about.model.dao.AboutDao;
import kr.or.about.model.vo.FoodList;

@Service
public class AboutService {
	@Autowired
	private AboutDao dao;

	public int foodCount(FoodList f) {
		if(f.getFoodCategory().equals("전체")) {
			return dao.foodTotalCount();
		}else {
			return dao.foodCount(f);			
		}
	}
	
	public ArrayList<FoodList> foodList(FoodList f, int totalCount) {
		int arr[] = new int[4];
		for (int i=0; i<arr.length; i++) {
			int check = 0;
			int num = (int)(Math.random()*totalCount)+1;
			for(int j=0; j<arr.length; j++) {
				if(arr[j] == num) {
					i--;
					check = 1;
					break;
				}
			}
			if(check != 1) {
				arr[i] = num;
			}	
		}
		ArrayList<FoodList> newList = new ArrayList<FoodList>();
		for(int j=0; j<arr.length; j++) {
			f.setRNum(arr[j]);
			FoodList selectFood = dao.foodList(f);
			newList.add(selectFood);
		}
		for(int k=0; k<newList.size(); k++) {
			// google_img
			imgSrc(newList.get(k));
		}
		return newList;
	}
	
	public FoodList imgSrc(FoodList f) {
		String foodName = f.getFoodName();
		String newFoodName = foodName.replace(" ", "+");
    	String urlStr = "";
    	urlStr += "https://www.google.com/search?q=";
    	urlStr += newFoodName;
    	urlStr += "&source=lnms&tbm=isch&sa=X&ved=2ahUKEwiJiN3ixPH0AhWVH3AKHZ0OCm4Q_AUoAXoECAEQAw&biw=1669&bih=937&dpr=1";
		Document doc;
		try {
			doc = Jsoup.connect(urlStr).get();
			String imgSrc = doc.select("img.Q4LuWd").attr("data-src");
			f.setImgSrc(imgSrc);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return f;
	}


}
