package com.lee.board.dao;

import com.lee.board.vo.BoardVO;
import com.lee.board.vo.signVO;

import java.util.*;

import javax.servlet.http.HttpSession;

public interface BoardDAO {
	public void create(BoardVO vo) throws Exception;

	public void signUp(signVO vo) throws Exception;
	 
	public boolean loginChk(signVO vo);
	
	public List<BoardVO> listAll() throws Exception;

	public BoardVO read(Integer bno) throws Exception;

	public void delete(Integer bno) throws Exception;

	public void update(BoardVO vo) throws Exception;
	
	public void hit(Integer vo) throws Exception;
}
