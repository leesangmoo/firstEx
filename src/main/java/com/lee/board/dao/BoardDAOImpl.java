package com.lee.board.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lee.board.vo.BoardVO;
import com.lee.board.vo.signVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	private static String namespace = "com.lee.mapper.mapper-boardMapper";

	// 게시판 글 추가s
	@Override
	public void create(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".insertBoard", vo);
	}

	// 게시판 보기
	@Override
	public List<BoardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".listBoard");
	}

	// 게시판 상세
	@Override
	public BoardVO read(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".detailBoard", bno);
	}

	// 게시판 수정
	@Override
	public void update(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".updateBoard", vo);
	}

	// 게시판 삭제
	@Override
	public void delete(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".deleteBoard", bno);
	}

	// 조회수
	@Override
	public void hit(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".hit", bno);
	}
	
	//회원가입
	@Override
	public void signUp(signVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".signUp", vo);
	}

	@Override
	public boolean loginChk(signVO vo) {
		// TODO Auto-generated method stub
		String name = sqlSession.selectOne(namespace+".login", vo);
		return (name == null) ? false : true;
	}

	@Override
	public List<BoardVO> listAllAjax(BoardVO boardvo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("daoMbti" + boardvo.getMbti_type());
		System.out.println(sqlSession.selectList(namespace + ".listAllAjax",boardvo).isEmpty());
		return sqlSession.selectList(namespace + ".listAllAjax",boardvo);
	}

}
