package com.mm.controller;


import java.util.HashMap;	

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mm.member.model.MailSendService;
import com.mm.member.model.MemberDAO;
import com.mm.member.model.MemberDTO;
import com.mm.member.model.MemberListDTO;

@Controller
public class MemberController {
	@Autowired
	private MemberDAO mdao;
	@Autowired
	private MailSendService mailService;
	
	
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
		mav.addObject("link", "index.do");
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
			session.setMaxInactiveInterval(120*60); //
			
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
	
	/*회원 정보 수정을 위한 비밀번호 입력 페이지 이동*/
	@RequestMapping(value="/infoEdit.do",method = RequestMethod.GET)
	public ModelAndView infoEditForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("ssInfo")==null) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("gopage","location.href='index.do';");
			mav.setViewName("mainMsg");
			return mav;
		}
		
		
		mav.setViewName("member/infoEditForm");

		return mav;
	}
	/*회원 정보 수정 가능한 폼 페이지로 이동*/
	@RequestMapping(value="/infoEdit.do",method = RequestMethod.POST)
	public ModelAndView infoEditFormOK(HttpSession session,
									@RequestParam(value = "user_ok",defaultValue = "NO")String user_ok) {
	
		
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("ssInfo")==null) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("gopage","location.href='index.do';");
			mav.setViewName("mainMsg");
			return mav;
		}
		if(!user_ok.equals("OK")) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("gopage","location.href='index.do';");
			mav.setViewName("mainMsg");
			return mav;
		}
		
        MemberDTO sdto =(MemberDTO) session.getAttribute("ssInfo");
        int user_idx = sdto.getUser_idx();
		MemberDTO userInfo = mdao.getuserInfo(user_idx);
					
			mav.addObject("info",userInfo);
			mav.setViewName("member/infoEdit");
			
		
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
			mav.addObject("gopage", "location.href='memberJoin.do?user_id="+userInfo.get("email")+"&user_name="+userInfo.get("nickname")+"&user_jointype=카카오';");
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
	
	@RequestMapping(value="/infoEditOK.do",method = RequestMethod.POST)
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
	@ResponseBody
	public ModelAndView pwdChange(@RequestParam("user_idx")int user_idx,@RequestParam("newPassword")String newPwd ) {

	
	    int result = mdao.updatePWD(newPwd, user_idx);

	    
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
	    mav.setViewName("mmJson");
	    return mav;
	}
	/**관리자 회원정보 확인*/
	@RequestMapping(value="/menMan.do",method = RequestMethod.GET)
	public ModelAndView memManList(@RequestParam(value="cp",defaultValue = "1")int cp,
									@RequestParam(value="fvalue",defaultValue = "")String fvalue,
									@RequestParam(value="type",defaultValue = "no")String type,
									@RequestParam(value="orderby",defaultValue = "1")String orderby) {
		
		int rtotalCnt = mdao.getuserTTCnt(fvalue);
		int totalCnt = rtotalCnt==0?1:rtotalCnt;
		int listSize = 10;
		int pageSize = 5;
		
		String param = "&fvalue="+fvalue+"&type="+type+"&orderby="+orderby;
		String pageStr = com.mm.module.PageModule.makePageParam("menMan.do", totalCnt, listSize, pageSize, cp,param);
		
		List<MemberListDTO> lists = mdao.memberList(cp, listSize,type,fvalue,orderby);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memManList");
		
		mav.addObject("order",orderby);
		mav.addObject("type",type);
		mav.addObject("fvalue",fvalue);
		mav.addObject("totalCnt",rtotalCnt);
		mav.addObject("lists",lists);
		mav.addObject("pageStr",pageStr);
		return mav;
	}
	
	/**관리자로 변경 */
	@RequestMapping(value="/managerUpdate.do",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView managerInsert(@RequestParam("user_idx")int user_idx) {

		
	   
		int result = mdao.managerUpdate(user_idx);
	    String msg = result>0?"관리자로 등록되었습니다.":"관리자 등록에 실패하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
	    mav.setViewName("mmJson");
	    return mav;
	}
	/**회원 메모 변경 */
	@RequestMapping(value="/userMemoUpdate.do",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView userMemoUpdate(@RequestParam("user_idx")int user_idx,
									@RequestParam("user_memo")String user_memo) {

		
	   
		int result = mdao.userMemoUpdate(user_idx,user_memo);
	    String msg = result>0?"사용자 정보를 등록하였습니다.":"사용자 정보 등록에 실패하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
	    mav.setViewName("mmJson");
	    return mav;
	}
	
	
	/**관리자 관리자 정보 확인*/
	@RequestMapping(value="/managerList.do",method = RequestMethod.GET)
	public ModelAndView managerList(@RequestParam(value="cp",defaultValue = "1")int cp,
									@RequestParam(value="fvalue",defaultValue = "")String fvalue,
									@RequestParam(value="type",defaultValue = "no")String type,
									@RequestParam(value="orderby",defaultValue = "1")String orderby) {
		
		int rtotalCnt = mdao.getmanagerTTCnt(fvalue);
		int totalCnt = rtotalCnt==0?1:rtotalCnt;
		int listSize = 10;
		int pageSize = 5;
		
		String param = "&fvalue="+fvalue+"&type="+type+"&orderby="+orderby;
		String pageStr = com.mm.module.PageModule.makePageParam("managerList.do", totalCnt, listSize, pageSize, cp,param);
		
		List<MemberListDTO> lists = mdao.managerList(cp, listSize,type,fvalue,orderby);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/managerList");
		
		mav.addObject("order",orderby);
		mav.addObject("type",type);
		mav.addObject("fvalue",fvalue);
		mav.addObject("totalCnt",rtotalCnt);
		mav.addObject("lists",lists);
		mav.addObject("pageStr",pageStr);
		return mav;
	}
	
	/**관리자 회원으로 변경 */
	@RequestMapping(value="/managetDelete.do",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView managerDelete(@RequestParam("user_idx")int user_idx) {

		int result = mdao.managerDelete(user_idx);
	    String msg = result>0?"회원으로 변경되었습니다.":"회원으로 변경에 실패하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
	    mav.setViewName("mmJson");
	    return mav;
	}
	
	
	
	/**회원 아이디 찾기*/
	@RequestMapping(value="/findId.do",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView findID(@RequestParam("input_name")String input_name,
								@RequestParam("input_tel")String input_tel) {

	
	String user_id = mdao.findID(input_name, input_tel);
	ModelAndView mav = new ModelAndView();
	mav.addObject("user_id",user_id);
    mav.setViewName("mmJson");
    return mav;
	}
	
	/**회원 비밀번호 찾기*/
	@RequestMapping(value="/findPWD.do",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView findPWD(@RequestParam("input_name")String input_name,
								@RequestParam("input_tel")String input_tel,
								@RequestParam("input_id")String input_id) {


	Integer user_idx = mdao.findPWD(input_name, input_tel,input_id);
	ModelAndView mav = new ModelAndView();
	mav.addObject("user_idx",user_idx);
	mav.addObject("user_id",input_id);
    mav.setViewName("mmJson");
    return mav;
	}
	
	/**회원가입 아이디 중복 검사*/
	@RequestMapping(value="/idCheck.do",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView idCheck(@RequestParam("input_id")String input_id) {


	boolean result = mdao.memberIdcheck(input_id);
	ModelAndView mav = new ModelAndView();
	
    mav.addObject("result", result); 
    mav.setViewName("mmJson");
    return mav;
	}
	
	
	/**이메일 인증*/
	@RequestMapping("/mailCheck.do")
	@ResponseBody
	public String mailCheck (@RequestParam("email")String email) {

		return mailService.joinEmail(email);
	}
	
	/**회원 탈퇴*/
	
	@RequestMapping(value = "/memberDrop.do",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView memberDrop(@RequestParam("user_idx")int user_idx,@RequestParam("user_id")String user_id) {
		
		ModelAndView mav = new ModelAndView();
		int serviceIng = mdao.dropSelectInfo(user_idx);
		
		mav.setViewName("mmJson");
		
		if(serviceIng!=0) {
			System.out.println(serviceIng);
			mav.addObject("msg", "현재 진행중인 서비스를 완료하고 탈퇴할 수 있습니다.");
			return mav;
		}else {
			int result = mdao.deleteMember(user_idx, user_id);
			
			if(result>0) {
				mav.addObject("msg","탈퇴되었습니다. 머뭄을 이용해주셔서 감사합니다.");
				mav.addObject("drop", true);
				
			}else {
				mav.addObject("msg","탈퇴에 실패하였습니다.");
			}
		}
		return mav;
		
	}
	
	
	/*임시 비밀번호 발급*/
	@RequestMapping(value="/pwdChangeEmail.do",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView pwdChangeEmail(@RequestParam("user_idx")int user_idx,@RequestParam("user_id")String user_id ) {

	
		String newPwd = mailService.pwdChange(user_id);
		ModelAndView mav = new ModelAndView();
	    
		mav.setViewName("mmJson");
		
		if(newPwd.equals("")||newPwd==null) {
			mav.addObject("msg", "임시 비밀번호가 발급되었습니다.");
			
		}else {
			int result = mdao.updatePWD(newPwd, user_idx);
			if(result>0) {
				mav.addObject("msg", "임시 비밀번호가 전송되었습니다.");
			}else {
				mav.addObject("msg", "임시 비밀번호 발급에 실패하였습니다.");
			}
		}
		return mav;
	}

	
}

