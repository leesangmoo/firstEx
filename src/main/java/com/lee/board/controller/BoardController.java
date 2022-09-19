package com.lee.board.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lee.board.service.BoardService;
import com.lee.board.vo.BoardVO;
import com.lee.board.vo.signVO;

@Controller
@RequestMapping("/board/")
// url요청이 /board/로 시작하는 것은 여기서 처리한다. 
//ex)board/abc , board/123 board/create

public class BoardController {

	@Inject
	private BoardService service;
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void createGET(BoardVO board, Model model) throws Exception {
		System.out.println(" /board/create 입니다. GET방식");

	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String createPOST(BoardVO board, RedirectAttributes rttr) throws Exception {
		System.out.println("/board/create POST방식 입니다.");
		service.create(board);

		return "redirect:/board/listAll"; // listAll.jsp 이동
	}
	@RequestMapping(value = "/listAllView", method = RequestMethod.GET)
	public void listAllView(Model model) throws Exception {
		System.out.println("전체 목록 페이지");
		model.addAttribute("boardList", service.listAll());
	}
	
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listAll(Model model) throws Exception {
		System.out.println("전체 목록 페이지");
		model.addAttribute("boardList", service.listAll());
	}
	
	
	@RequestMapping(value= "/ajaxSearch", method=RequestMethod.GET)
	@ResponseBody
	public List<BoardVO> ajaxSearch(@RequestParam("mbti_type") String mbti_type, 
		 BoardVO boardVO, Model model) throws Exception {
		    System.out.println("ajax 컨트롤러" + mbti_type);
		    
		    BoardVO boardvo = new BoardVO();
		    boardvo.setMbti_type(mbti_type); //keyword
		    System.out.println(service.listAllAjax(boardvo));
		    return service.listAllAjax(boardvo);
	}	    
//		    BoardVO list = service.read(mbtiType);
//		    
//		    String listJson;
//		    System.out.println("ajax" + list.getBno());
//		    if(list != null) {
//		    	 System.out.println("ajax if" );
//		    	listJson = "{\"id\":\""+list.getBno()
//		    					+"\",\"writer\":\""+list.getWriter()
//		    					+"\",\"title\":\""+list.getTitle()
//		    					+"\",\"content\":\""+list.getContent()
//		    					+"\",\"date\":\""+list.getNow_date()
//								+"\",\"hit\":\""+list.getHit()+"\"}";
//		    }else {
//		    	System.out.println("null");
//		    	listJson = "null";
//		    }
//		    response.getWriter().print(listJson);
//	}
	
	//로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute signVO vo, HttpSession session) throws Exception {
		boolean result = service.loginChk(vo,session);
		ModelAndView model = new ModelAndView();
		
		if(result) {
			model.setViewName("/board/listAll");
			model.addObject("msg","success");
			model.addObject("boardList", service.listAll());
		}else {
			model.setViewName("/board/login");
			model.addObject("msg", "fail");
		}
		return model; // listAll.jsp 이동
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login(Model model) throws Exception {
		System.out.println("로그인 get");
//		model.addAttribute("boardList", service.listAll());
	}

	// 회원가입
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String signUp(signVO sign, RedirectAttributes rttr) throws Exception {
		System.out.println("/board/signup POST방식 입니다.");
		service.signUp(sign);

		return "redirect:/board/listAll"; // listAll.jsp 이동
	}

	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public void signUp(Model model) throws Exception {
		System.out.println("회원가입 get");
//			model.addAttribute("boardList", service.listAll());
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) throws Exception {
		System.out.println("로그아웃");
		session.invalidate();
		ModelAndView mv = new ModelAndView("redirect:/board/listAll");
		return mv;
	}
	// 게시판 상세보기 뷰
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(BoardVO boardVO, Model model) throws Exception {
		System.out.println("detail view");
		service.hit(boardVO.getBno());
		// 상세보기 시 조회수 증가
		model.addAttribute("detail", service.read(boardVO.getBno()));
		return "/board/detail";
	}

	// 게시판 수정뷰
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(BoardVO boardVO, Model model) throws Exception {
		System.out.println("update view");
		model.addAttribute("update", service.read(boardVO.getBno()));
		return "/board/updateView";
	}

	// 게시판 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardVO boardVO) throws Exception {
		System.out.println("update");
		service.update(boardVO);
		return "redirect:/board/listAll";
	}

	// 게시판 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(BoardVO boardVO) throws Exception {
		System.out.println("delete");
		service.delete(boardVO.getBno());
		return "redirect:/board/listAll";
	}

	// 게시판 삭제
	@RequestMapping(value = "/deleteP", method = RequestMethod.GET)
	public String deleteP(@RequestParam("bno") int bno) throws Exception {
		System.out.println("deleteP");
		service.delete(bno);
		return "redirect:/board/listAll";
	}
}