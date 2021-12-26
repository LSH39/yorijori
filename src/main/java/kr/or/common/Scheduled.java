package kr.or.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.or.recipecontest.model.service.RecipeContestService;

@Component
public class Scheduled {
	@Autowired
	private RecipeContestService service;
	
	@org.springframework.scheduling.annotation.Scheduled(cron="0 0 12 25 * *")
	 public void selectWinners() {
		service.updateContestWinners();
		System.out.println("이번달 우승자 업데이트 작업 완료!");
	}
}
