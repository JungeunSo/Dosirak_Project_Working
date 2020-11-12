package kr.co.dao;

import java.util.List;

import kr.co.vo.BoardVO;
import kr.co.vo.SearchCriteria;

public interface BoardDAO {

	// 게시글 작성
	public void write(BoardVO boardVO) throws Exception;
	
	public List<BoardVO> list(SearchCriteria scri) throws Exception;
	
	//게시물 총 갯수 
	public int listCount(SearchCriteria scri) throws Exception;
	
	public BoardVO read(int bno) throws Exception;
	
	public void update(BoardVO boardVO) throws Exception;
	
	public void delete(int bno) throws Exception;
	
	
}