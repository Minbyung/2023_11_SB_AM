package com.koreaIT.demo.service;

import org.springframework.stereotype.Service;

import com.koreaIT.demo.dao.ReplyDao;

@Service
public class ReplyService {
	
	private ReplyDao replyDao;
	
	public ReplyService(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}

	public void writeReply(int memberId, String relTypeCode, int relId, String body) {
		replyDao.writeReply(memberId, relTypeCode, relId, body);
	}

	public int getLastInsertId() {
		return replyDao.getLastInsertId();
	}
	
}