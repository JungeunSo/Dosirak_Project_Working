package kr.co.service;

import java.util.List;

import kr.co.vo.ReplyVO;

public interface ReplyService {

	// 댓글 조회
	public List<ReplyVO> readReply(int bno) throws Exception;
	// 댓글 조회
	public void writeReply(ReplyVO vo) throws Exception;
	
	public void updateReply(ReplyVO vo) throws Exception;
	
	public void deleteReply(ReplyVO vo) throws Exception;
	
	public ReplyVO selectReply(int rno) throws Exception;

}
