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
		
		makeTestData();
	}
	
	private void makeTestData() {
		for (int i = 1; i <= 10; i++) {
			String title = "제목" + i;
			String body = "내용" + i;
			
			writeArticle(title, body);
		}
	}
	
	private Article writeArticle(String title, String body) {
		this.lastArticleId++;
		
		Article article = new Article(lastArticleId, title, body);
		
		this.articles.add(article);
		
		return article;
	}
	
	private Article getArticleById(int id) {
		for (Article article : articles) {
			if (article.getId() == id) {
				return article;
			}
		}
		return null;
	}
	
	private void deleteArticle(Article article) {
		this.articles.remove(article);
	}
	
	@RequestMapping("/usr/article/doWrite")
	@ResponseBody
	public Article doWrite(String title, String body) {
		
		Article article = writeArticle(title, body);
		
		return article;
	}
	
	@RequestMapping("/usr/article/showList")
	@ResponseBody
	public List<Article> showList() {
		return this.articles;
	}
	
	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	public String doDelete(int id) {
		
		Article article = getArticleById(id);
		
		if (article == null) {
			return id + "번 게시물은 존재하지 않습니다";
		}
		
		deleteArticle(article);
		
		return id + "번 게시물을 삭제했습니다";
	}
	
}