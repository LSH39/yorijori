package kr.or.recipecontest.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.recipecontest.model.dao.RecipeContestDao;

@Service
public class RecipeContestService {
	@Autowired
	private RecipeContestDao dao;
}
