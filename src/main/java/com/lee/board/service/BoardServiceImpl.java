package com.lee.board.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.lee.board.dao.BoardDAO;
import com.lee.board.vo.BoardVO;
import com.lee.board.vo.signVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO dao;
	
	@Override
	public void create(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.create(vo);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll();
	}

	@Override
	public BoardVO read(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(bno);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(bno);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}
	
	@Override
	public void hit(Integer vo) throws Exception {
		// TODO Auto-generated method stub
		dao.hit(vo);
	}

	@Override
	public void signUp(signVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.signUp(vo);
	}

	@Override
	public boolean loginChk(signVO vo, HttpSession session) {
		// TODO Auto-generated method stub
		boolean result = dao.loginChk(vo);
		System.out.println(result + "aaaaaaaa");
		if(result) {
			System.out.println("true");
			session.setAttribute("id", vo.getId());
		}
		return result;
	}

	@Override
	public List<BoardVO> listAllAjax(BoardVO boardvo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("servcie mbti" + boardvo.getMbti_type());
		return dao.listAllAjax(boardvo);
	}

}
