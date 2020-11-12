package kr.co.dao;

import java.util.List;

import kr.co.vo.ReplyVO;

public interface ReplyDAO {
	// 댓글 조회
	public List<ReplyVO> readReply(int bno) throws Exception;
	// 댓글 조회
	public void writeReply(ReplyVO vo) throws Exception;


}