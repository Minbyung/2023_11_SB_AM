package com.koreaIT.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.koreaIT.demo.dao.ArticleDao;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.Article;
import com.koreaIT.demo.vo.ResultData;

@Service
public class ArticleService {
	
	private ArticleDao articleDao;
	
	public ArticleService(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}
	
	public void writeArticle(int memberId, int boardId, String title, String body) {
		articleDao.writeArticle(memberId, boardId, title, body);
	}
	
	public int getArticlesCnt(int boardId, String searchKeywordType, String searchKeyword) {
		return articleDao.getArticlesCnt(boardId, searchKeywordType, searchKeyword);
	}
	
	public List<Article> getArticles(int boardId, String searchKeywordType, String searchKeyword, int limitStart, int itemsInAPage) {
		return articleDao.getArticles(boardId, searchKeywordType, searchKeyword, limitStart, itemsInAPage);
	}
	
	public Article forPrintArticle(int id) {
		return articleDao.forPrintArticle(id);
	}
	
	public Article getArticleById(int id) {
		return articleDao.getArticleById(id);
	}
	
	public void modifyArticle(int id, String title, String body) {
		articleDao.modifyArticle(id, title, body);
	}
	
	public void deleteArticle(int id) {
		articleDao.deleteArticle(id);
	}

	public int getLastInsertId() {
		return articleDao.getLastInsertId();
	}

	public ResultData<Integer> increaseHitCount(int id) {
		
		int affectedRowsCnt = articleDao.increaseHitCount(id);
		
		if (affectedRowsCnt == 0) {
			return ResultData.from("F-1", Util.f("%d번 게시물은 존재하지 않습니다", id), affectedRowsCnt);
		}
		
		return ResultData.from("S-1", "조회수 증가", affectedRowsCnt);
	}

	public int getArticleHitCount(int id) {
		return articleDao.getArticleHitCount(id);
	}
}