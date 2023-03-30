package com.mm.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mm.member.model.MemberDAO;
import com.mm.member.model.MemberDTO;

@Controller
public class MemberController {
	@Autowired
	private MemberDAO mdao;
	
	@RequestMapping(value="/memberJoin.do",method = RequestMethod.GET)
	public String memberJoinForm() {
		return "member/memberJoin";
	}
	
	
	@RequestMapping(value = "/memberJoin.do",method = RequestMethod.POST)
	public ModelAndView memberJoinSubmit(MemberDTO dto) {
		if(dto.getAddr_detail()==null) {
			dto.setAddr_detail("");
		}
		int result = mdao.insertJoinMM(dto);
		
		ModelAndView mav = new ModelAndView();
		String msg = result>0?"회원가입이 완료되었습니다.":"회원가입에 실패하였습니다.문의1234-1234";
		mav.addObject("msg", msg);
		mav.setViewName("member/memberJoin");
		
		return mav;
	}
	
	@RequestMapping(value="/login.do",method = RequestMethod.GET)
	public String loginForm() {
		return "member/login";
	}
	
	@RequestMapping(value="/login.do",method = RequestMethod.POST)
	public ModelAndView loginSubmit(@RequestParam("input_id")String input_id,
									@RequestParam("input_pwd")String input_pwd,
									HttpSession session ,
									HttpServletResponse res,
									@RequestParam(value="saveid",required = false)String saveid) {
		ModelAndView mav = new ModelAndView();
		int result = mdao.mmLogin(input_id, input_pwd);
		if(result==mdao.LOGIN_OK) {
			if(saveid==null) {
				Cookie ck = new Cookie("saveid",input_id);
				ck.setMaxAge(0);
				res.addCookie(ck);
			}else {
				Cookie ck = new Cookie("saveid",input_id);
				ck.setMaxAge(60*60*24*30);
				res.addCookie(ck);
			}
			
			
				MemberDTO dto = mdao.getUserInfo(input_id);
				
				session.setAttribute("dto", dto);
			mav.addObject("msg",dto.getUser_id()+"님 환영합니다.");
			
		}else if(result==mdao.NOT_ID||result==mdao.NOT_PWD) {
			mav.addObject("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			mav.addObject("gopage","login");
		}else {
			mav.addObject("msg", "고객센터로 연락바랍니다.");
			mav.addObject("gopage","index");
		}
		
		return mav;
	}

}
