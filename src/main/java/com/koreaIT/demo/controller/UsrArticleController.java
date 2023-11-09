package com.koreaIT.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.vo.Article;

@Controller
public class UsrArticleController {
	
	private List<Article> articles;
	private int lastArticleId;
	
	UsrArticleController() {
		this.articles = new ArrayList<>();
		this.lastArticleId = 0;
	}
	
	@RequestMapping("/usr/article/doWrite")
	@ResponseBody
	public Article doWrite(String title, String body) {
		
		this.lastArticleId++;
		
		Article article = new Article(this.lastArticleId, title, body);
		
		articles.add(article);
		
		return article;
	}
	
	@RequestMapping("/usr/article/showList")
	@ResponseBody
	public List<Article> showList() {
		return this.articles;
	}
	
}