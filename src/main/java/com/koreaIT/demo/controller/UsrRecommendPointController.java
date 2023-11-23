package com.koreaIT.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.service.RecommendService;
import com.koreaIT.demo.vo.RecommendPoint;
import com.koreaIT.demo.vo.ResultData;
import com.koreaIT.demo.vo.Rq;

@Controller
public class UsrRecommendPointController {

	private RecommendService recommendService;
	private Rq rq;
	
	UsrRecommendPointController(RecommendService recommendService, Rq rq) {
		this.recommendService = recommendService;
		this.rq = rq;
	}
	
	@RequestMapping("/usr/recommendPoint/getRecommendPoint")
	@ResponseBody
	public ResultData<RecommendPoint> getRecommendPoint(String relTypeCode, int relId) {
		return recommendService.getRecommendPoint(rq.getLoginedMemberId(), relTypeCode, relId);
	}
	
	@RequestMapping("/usr/recommendPoint/insertRecommendPoint")
	@ResponseBody
	public String insertRecommendPoint(String relTypeCode, int relId) {
		
		recommendService.insertRecommendPoint(rq.getLoginedMemberId(),relTypeCode, relId);
		
		return "좋아요 성공";
	}
	
	@RequestMapping("/usr/recommendPoint/deleteRecommendPoint")
	@ResponseBody
	public String deleteRecommendPoint(String relTypeCode, int relId) {
		
		recommendService.deleteRecommendPoint(rq.getLoginedMemberId(),relTypeCode, relId);
		
		return "좋아요 취소";
	}
	
}