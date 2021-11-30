package kr.or.recipe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.recipe.model.service.RecipeService;

@Controller
public class RecipeController {
	@Autowired
	private RecipeService service;

	
}
