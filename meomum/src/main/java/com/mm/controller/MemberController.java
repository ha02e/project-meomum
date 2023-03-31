package com.mm.controller;


import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.mm.member.model.MemberDAO;
import com.mm.member.model.MemberDTO;

@Controller
public class MemberController {
	@Autowired
	private MemberDAO mdao;
	
	/*회원가입 페이지 이동*/
	@RequestMapping(value="/memberJoin.do",method = RequestMethod.GET)
	public String memberJoinForm() {
		return "member/memberJoin";
	}
	
	/*회원가입 확인*/
	@RequestMapping(value = "/memberJoin.do",method = RequestMethod.POST)
	public ModelAndView memberJoinSubmit(MemberDTO dto) {
		if(dto.getAddr_detail()==null) {
			dto.setAddr_detail("");
		}
		int result = mdao.insertJoin(dto);
		
		ModelAndView mav = new ModelAndView();
		String msg = result>0?"회원가입이 완료되었습니다.":"회원가입에 실패하였습니다.문의1234-1234";
		mav.addObject("msg", msg);
		mav.setViewName("msg");
		
		return mav;
	}
	
	
	/*로그인 페이지 이동*/
	@RequestMapping(value="/login.do",method = RequestMethod.GET)
	public String loginForm() {
		return "member/login";
	}
	
	/*로그인*/
	@RequestMapping(value="/login.do",method = RequestMethod.POST)
	public ModelAndView loginSubmit(@RequestParam("input_id")String input_id,
									@RequestParam("input_pwd")String input_pwd,
									HttpSession session ,
									HttpServletResponse res,
									@RequestParam(value="saveid",required = false)String saveid) {
		ModelAndView mav = new ModelAndView();
		int result = mdao.login(input_id, input_pwd);
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
			
			session.setAttribute("userinfo", dto);
			
			if(dto.getUser_info().equals("회원")) {
				mav.addObject("msg",dto.getUser_name()+"님 환영합니다.");
				mav.addObject("gopage","location.href='index.do';");
				mav.setViewName("mainMsg");
			}else {
				mav.addObject("msg",dto.getUser_name()+"님 오늘도 하루도 힘내세요");
				mav.addObject("gopage","location.href='admin.do';");
				mav.setViewName("mainMsg");
			}
			
		}else if(result==mdao.NOT_ID||result==mdao.NOT_PWD) {
			mav.addObject("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			mav.addObject("gopage","history.back();");

			mav.setViewName("mainMsg");
		}else {
			mav.addObject("msg", "고객센터로 연락바랍니다.");
			mav.addObject("gopage","location.href='index.do';");
			mav.setViewName("mainMsg");
		}
		
		return mav;
	}
	
	/*로그아웃*/

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index.do";
	}
	
	
	/*회원 정보 수정*/
	@RequestMapping("/infoEdit")
	public ModelAndView infoEditForm(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("userinfo")==null) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("gopage","location.href='index.do';");
			mav.setViewName("mainMsg");
		}else {
			MemberDTO dto = (MemberDTO) session.getAttribute("userinfo");
			
			if(dto.getUser_info().equals("관리자")) {
				mav.addObject("msg", "잘못된 접근입니다.");
				mav.addObject("gopage","location.href='index.do';");
				mav.setViewName("mainMsg");
			}else {
			mav.setViewName("member/infoEdit");
			}
		}
		return mav;
	}
	
	/**카카오 로그인*/
	@RequestMapping(value = "/kakao_login.do",method = RequestMethod.GET)
	public ModelAndView kakaoLogin(@RequestParam(value = "code", required = false) String code,HttpSession session) throws Throwable {

	
		String access_Token = mdao.getAccessToken(code);

		HashMap<String, Object> userInfo = mdao.getKakaoUserInfo(access_Token);

		ModelAndView mav = new ModelAndView();

		
		if(mdao.getUserInfo((String)userInfo.get("email"))==null){

			mav.addObject("msg", "회원 정보가 없습니다. <br>추가 정보 입력 후에 회원가입 가능합니다.");
			mav.addObject("gopage", "location.href='memberJoin.do?user_id="+userInfo.get("email")+"&user_name="+userInfo.get("nickname")+"';");
			mav.setViewName("mainMsg");

		}else {
			MemberDTO dto = mdao.getUserInfo((String)userInfo.get("email"));
			
			session.setAttribute("userinfo", dto);
			
			if(dto.getUser_info().equals("회원")) {
				mav.addObject("msg",dto.getUser_name()+"님 환영합니다.");
				mav.addObject("gopage","location.href='index.do';");
				mav.setViewName("mainMsg");
			}else {
				mav.addObject("msg",dto.getUser_name()+"님 오늘도 하루도 힘내세요");
				mav.addObject("gopage","location.href='admin.do';");
				mav.setViewName("mainMsg");
			}
		}
		
		return mav;	

	}
	
	
	
	
}
