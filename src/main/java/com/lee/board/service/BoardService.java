package com.lee.board.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.lee.board.vo.BoardVO;
import com.lee.board.vo.signVO;

public interface BoardService {

	public void create(BoardVO vo) throws Exception;

	public void signUp(signVO vo) throws Exception;
	
	public boolean loginChk(signVO vo, HttpSession session);
	
	public List<BoardVO> listAll() throws Exception;

	public BoardVO read(Integer bno) throws Exception;

	public void delete(Integer bno) throws Exception;

	public void update(BoardVO vo) throws Exception;
	
	public void hit(Integer vo) throws Exception;
}
