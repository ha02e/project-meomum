package com.mm.controller;


import java.util.HashMap;
import java.util.List;

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
		
			MemberDTO dto = mdao.getsessionInfo(input_id);
			
			session.setAttribute("ssInfo", dto);
			
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

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index.do";
	}
	
	
	/*회원 정보 수정 페이지 이동*/
	@RequestMapping(value="/infoEdit",method = RequestMethod.GET)
	public ModelAndView infoEditForm(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("ssInfo")==null) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("gopage","location.href='index.do';");
			mav.setViewName("mainMsg");
		}else {
			MemberDTO sdto =(MemberDTO) session.getAttribute("ssInfo");
			int user_idx = sdto.getUser_idx();
			
			MemberDTO userInfo = mdao.getuserInfo(user_idx);
					
			mav.addObject("info",userInfo);
			mav.setViewName("member/infoEdit");
			
		}
		return mav;
	}
	
	/**카카오 로그인*/
	@RequestMapping(value = "/kakao_login.do",method = RequestMethod.GET)
	public ModelAndView kakaoLogin(@RequestParam(value = "code", required = false) String code,HttpSession session) throws Throwable {

	
		String access_Token = mdao.getAccessToken(code);

		HashMap<String, Object> userInfo = mdao.getKakaoUserInfo(access_Token);

		ModelAndView mav = new ModelAndView();

		
		if(mdao.getsessionInfo((String)userInfo.get("email"))==null){

			mav.addObject("msg", "회원 정보가 없습니다. 추가 정보 입력 후에 회원가입 가능합니다.");
			mav.addObject("gopage", "location.href='memberJoin.do?user_id="+userInfo.get("email")+"&user_name="+userInfo.get("nickname")+"';");
			mav.setViewName("mainMsg");

		}else {
			MemberDTO dto = mdao.getsessionInfo((String)userInfo.get("email"));
			
			session.setAttribute("ssInfo", dto);
			
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
	
	@RequestMapping(value="/infoEdit.do",method = RequestMethod.POST)
	public ModelAndView infoEditSubmit(MemberDTO dto) {
		int result = mdao.updateUserInfo(dto);
		
		ModelAndView mav = new ModelAndView();
		String msg = result>0?"회원정보가 수정되었습니다.":"회원정보 수정에 실패하였습니다. 다시 시도해주세요.";
		mav.addObject("msg", msg);
		mav.addObject("link", "index.do");
		mav.setViewName("msg");
		return mav;
	}
	/*비밀번호 변경*/
	@RequestMapping(value="/pwdChange.do",method = RequestMethod.POST)
	public ModelAndView pwdChange(@RequestParam("user_idx")String user_idx,@RequestParam("newPwd")String newPwd ) {

		System.out.println("pwd="+newPwd);
		System.out.println("idx="+user_idx);
	    /*int result = mdao.updatePWD(pwd,Integer.parseInt(user_idx));
		String msg = result>0?"비밀번호가 수정되었습니다.":"비밀번호 수정에 실패하였습니다. 다시 시도해주세요.";

	    
	    mav.addObject("msg", msg);*/
		ModelAndView mav = new ModelAndView();
	    mav.addObject("msg", "성공");

	    return mav;
	}
	/**관리자 회원정보 수정*/
	@RequestMapping(value="/menMan.do",method = RequestMethod.GET)
	public ModelAndView memManList(@RequestParam(value="cp",defaultValue = "1")int cp) {
		int rtotalCnt = mdao.getuserTTCnt();
		int totalCnt = rtotalCnt==0?1:rtotalCnt;
		int listSize = 10;
		int pageSize = 5;
		String pageStr = com.mm.module.PageModule.makePage("menMan.do", totalCnt, listSize, pageSize, cp);
		
		List<MemberDTO> lists = mdao.memberList(cp, listSize);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memManList");
		
		mav.addObject("totalCnt",rtotalCnt);
		mav.addObject("lists",lists);
		mav.addObject("pageStr",pageStr);
		return mav;
	}
	
}
