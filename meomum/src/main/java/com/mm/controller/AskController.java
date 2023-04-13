package com.mm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mm.ask.model.AskDAO;
import com.mm.ask.model.AskDTO;
import com.mm.ask.model.CommentsDTO;
import com.mm.member.model.MemberDAO;
import com.mm.member.model.MemberDAOImple;
import com.mm.member.model.MemberDTO;

@Controller
public class AskController {
	
	@Autowired
	private AskDAO adao;
	@Autowired
	private MemberDAO mdao;
	
	/**간단문의 리스트*/
	@RequestMapping("/askList.do")
	public ModelAndView askList(@RequestParam(value="cp",defaultValue = "1")int cp,
								@RequestParam(value="fvalue",defaultValue = "")String fvalue,
								@RequestParam(value="type",defaultValue = "no")String type) {

		
		//페이징
		int rtotalCnt = adao.askCnt(fvalue);
		int totalCnt = rtotalCnt==0?1:rtotalCnt;
		int listSize = 10;
		int pageSize = 5;
		
		String param = "&fvalue="+fvalue+"&type="+type;
		String pageStr = com.mm.module.PageModule.makePageParam("askList.do", totalCnt, listSize, pageSize, cp,param);

		
		List<AskDTO> lists = adao.askList(cp, listSize,type,fvalue);
		
		for (AskDTO dto : lists) {
		    String askDate;
		    if (dto.getAsk_wdateYMD().equals(LocalDate.now().toString())) {
		        askDate = dto.getAsk_wdateTime();
		        dto.setNewicon(true);
		    } else {
		        askDate = dto.getAsk_wdateYMD();
		        dto.setNewicon(false);

		    }
		    dto.setAsk_date(askDate);
		}
		
		  // 작성자 이름 가운데 * 처리
		for (AskDTO dto : lists) {
		    String name = dto.getAsk_writer();
		    if (name != null && name.length() > 0) {
		        int len = name.length();
		        String maskedName = "";
		        if (len == 1) {
		            maskedName = "*";
		        } else if (len % 2 == 0) {
		            int mid = len / 2;
		            maskedName = name.substring(0, mid - 1) + "*" + name.substring(mid, len - 1);
		        } else {
		            int mid = len / 2;
		            maskedName = name.substring(0, mid) + "*" + name.substring(mid + 1, len);
		        }
		        dto.setAsk_writer(maskedName);
		    }
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ask/askList");
		
		mav.addObject("totalCnt",rtotalCnt);
		mav.addObject("lists",lists);
		mav.addObject("pageStr",pageStr);
		return mav;
	}
	
	/**간단문의 글작성 페이지 이동*/
	@RequestMapping(value="/askWrite.do", method = RequestMethod.GET)
	public String askWriteForm() {

		return "ask/askWriteForm";
	}
	
	/**간단문의 글작성 submit*/
	@RequestMapping(value="/askWrite.do", method = RequestMethod.POST)
	public ModelAndView askWriteSubmit(AskDTO dto,@RequestParam(value="file",required = false)MultipartFile file,HttpServletRequest request) {
		
		
		if(file != null&& !file.isEmpty()) {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String today = sdf.format(calendar.getTime());
		
		String extension = "." + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
		String originalFileName = today + "_" + dto.getAsk_writer()+"고객 첨부";
		
		
		// 중복 방지를 위해 파일 이름에 숫자를 붙임
		int num = 0;
		String fileName = originalFileName+extension;
		
			while (adao.existsFile(fileName)) {
			    num++;
			    fileName = originalFileName +"_"+num + extension;
			}
		dto.setAsk_file(fileName);
		
		copyInto(file, request,fileName);
		
		
		}else{
			dto.setAsk_file("");
		}
		
		int result = adao.askInsert(dto);
		ModelAndView mav = new ModelAndView();
		
		if(result>0){
			mav.addObject("msg","간단문의 작성이 등록되었습니다.빠른시일내로 답변드리겠습니다.");
			mav.addObject("link","askList.do");
			mav.setViewName("msg");
		}else {
			mav.addObject("msg","간단문의 작성에 실패하였습니다.");
			mav.addObject("gopage","history.back();");
			mav.setViewName("mainMsg");
		}
		return mav;
		
	}
	
	/**간단문의 본문 보기*/
	@RequestMapping(value="/askContent.do",method = RequestMethod.POST)
	public ModelAndView askContent(@RequestParam("ask_idx")int ask_idx,
									@RequestParam("ask_ok")String ask_ok
									) {
		ModelAndView mav = new ModelAndView();

		if(!ask_ok.equals("OK")) {
			mav.addObject("msg","잘못된 접근입니다.");
			mav.addObject("gopage","history.back()");
			mav.setViewName("mainMsg");
			return mav;
		}
		
		AskDTO dto = adao.askContent(ask_idx);
		CommentsDTO comm = adao.commList(ask_idx);
		mav.addObject("ask",dto);
		mav.addObject("comm",comm);
		mav.setViewName("ask/askContent");
		return mav;
	}
	
	/**간단문의 파일 저장하기*/
	public void copyInto(MultipartFile file, HttpServletRequest req,String fileName) {
	    try {
	        byte[] bytes = file.getBytes();

	        String rootPath = req.getSession().getServletContext().getRealPath("/");
	        String filePath = rootPath + "/images/askFile/" + fileName;
	        File outFile = new File(filePath);

	        FileOutputStream fos = new FileOutputStream(outFile);
	        fos.write(bytes);
	        fos.close();
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	}
	
	/**파일 다운로드 경로*/
	@RequestMapping("/filedown.do")
	public ModelAndView filedown(@RequestParam("filename")String filename,HttpServletRequest req) {
		
		
		String rootPath = req.getSession().getServletContext().getRealPath("/");
		String filePath = rootPath + "/images/askFile/" + filename;
		File f = new File(filePath);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("downloadFile",f);
		mav.setViewName("mmDown");
		return mav;
		
	}
	
	/**관리자 간단문의 관리 이동*/
	@RequestMapping("/askList_a.do")
	public ModelAndView askList_a(@RequestParam(value="cp",defaultValue = "1")int cp,HttpSession session,
									@RequestParam(value="fvalue",defaultValue = "")String fvalue,
									@RequestParam(value="type",defaultValue = "no")String type,
									@RequestParam(value="checklist",defaultValue = "1")String checklist) {
		ModelAndView mav = new ModelAndView();
		MemberDTO ssInfo = (MemberDTO) session.getAttribute("ssInfo");
		if(ssInfo==null||!ssInfo.getUser_info().equals("관리자")) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("gopage","location.href='index.do';");
			mav.setViewName("mainMsg");
			return mav;
		}
		
		//페이징
		int rtotalCnt = adao.askCnt_a(fvalue,checklist);
		int totalCnt = rtotalCnt==0?1:rtotalCnt;
		int listSize = 10;
		int pageSize = 5;
		String param = "&fvalue="+fvalue+"&type="+type+"&checklist="+checklist;
		String pageStr = com.mm.module.PageModule.makePageParam("askList_a.do", totalCnt, listSize, pageSize, cp,param);

		List<AskDTO> lists = adao.askList_a(cp, listSize,type,fvalue,checklist);
		
		
		//게시글 작성 시간 구분
		for (AskDTO dto : lists) {
		    String askDate;
		    if (dto.getAsk_wdateYMD().equals(LocalDate.now().toString())) {
		        askDate = dto.getAsk_wdateTime();
		        dto.setNewicon(true);
		    } else {
		        askDate = dto.getAsk_wdateYMD();
		        dto.setNewicon(false);

		    }
		    dto.setAsk_date(askDate);
		}
		mav.addObject("totalCnt",rtotalCnt);
		mav.addObject("checklist",checklist);
		mav.addObject("type",type);
		mav.addObject("fvalue",fvalue);
		mav.addObject("lists",lists);
		
		
		mav.setViewName("ask/askList_a");
		mav.addObject("pageStr",pageStr);
		return mav;
	}
	/**관리자 간단문의 본문 보기*/
	@RequestMapping("/askContent_a.do")
	public ModelAndView askContent_a(@RequestParam("ask_idx")int ask_idx,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO ssInfo = (MemberDTO) session.getAttribute("ssInfo");
		
		if(ssInfo==null||!ssInfo.getUser_info().equals("관리자")) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("gopage","location.href='index.do';");
			mav.setViewName("mainMsg");
			return mav;
		}
		
		
		AskDTO dto = adao.askContent(ask_idx);
		CommentsDTO comm = adao.commList(ask_idx);

		if(comm!=null) {
			MemberDTO mdto = mdao.getuserInfo(comm.getUser_idx());
			mav.addObject("mInfo",mdto);
		}
		
		mav.addObject("ask",dto);
		mav.addObject("comm", comm);
		mav.setViewName("ask/askContent_a");
		return mav;
	}
	
	/**관리자 댓글 쓰기*/
	@RequestMapping(value="/aksComm.do",method = RequestMethod.POST)
	public ModelAndView askCommWrite(CommentsDTO dto) {
		int result = adao.commentsInsert(dto);
		ModelAndView mav = new ModelAndView();
		
		if(result>0) {
			mav.addObject("msg", "댓글 작성을 완료하였습니다.");
			mav.addObject("link","askContent_a.do?ask_idx="+dto.getAsk_idx());
			mav.setViewName("msg");

		}else {
			mav.addObject("msg", "댓글 작성에 실패하였습니다.");
			mav.addObject("gopage","history.back()");
			mav.setViewName("mainMsg");
		}
		return mav;
	}
	
	/**글 삭제*/
	@RequestMapping(value="/askDelete.do", method = RequestMethod.POST)
    public ModelAndView deleteAsk(@RequestBody AskDTO askDto, HttpServletRequest req) {
       
		int result = adao.deleteAsk(askDto.getAsk_idx());
		
		//글삭제시 파일까지 같이 삭제
		String rootPath = req.getSession().getServletContext().getRealPath("/");
		String filePath = rootPath + "/images/askFile/" + askDto.getAsk_file();
		File f = new File(filePath);
		if (f.exists()) {
			f.delete();
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg","성공");
		mav.setViewName("mmJson");
		
		
		return mav;
    }
	
	/**관리자 댓글 삭제*/
	@RequestMapping(value="/askCommDel.do",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView askCommDel(@RequestParam("ask_idx")int ask_idx) {
		
		int result = adao.deleteComm(ask_idx);
		ModelAndView mav = new ModelAndView();
		String msg = result>0?"댓글이 삭제 되었습니다.":"댓글 삭제에 실패하였습니다.";
		mav.addObject("msg", msg);
		mav.setViewName("mmJson");
		
	  return mav;
	}
	
	
	
	/**비밀번호 정보 보내기*/
	@RequestMapping(value="/getPassword.do",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getPassword(@RequestParam("ask_idx")int ask_idx) {
		
		AskDTO dto = adao.askContent(ask_idx);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pwd", dto.getAsk_pwd());
		mav.setViewName("mmJson");
		
	  return mav;
	}
	
	
	/**나의 간단견적문의 내역(마이페이지)*/
	@RequestMapping(value="/myAskList.do",method = RequestMethod.GET)
	public ModelAndView myAskList(HttpSession session,@RequestParam(value="cp",defaultValue = "1")int cp) {
		
		
		ModelAndView mav = new ModelAndView();
		MemberDTO sdto =(MemberDTO) session.getAttribute("ssInfo");
		
		if(sdto==null) {
			mav.addObject("msg", "잘못된 접근입니다.");
			mav.addObject("gopage","location.href='index.do';");
			mav.setViewName("mainMsg");
			return mav;
		}
		
        int user_idx = sdto.getUser_idx();
        
		int rtotalCnt = adao.myaskCnt(user_idx);
		int totalCnt = rtotalCnt==0?1:rtotalCnt;
		int listSize = 10;
		int pageSize = 5;
		
		String pageStr = com.mm.module.PageModule.makePage("myAskList.do", totalCnt, listSize, pageSize, cp);

		
		List<AskDTO> lists = adao.myaskList(cp, listSize, user_idx);
		
		for (AskDTO dto : lists) {
		    String askDate;
		    if (dto.getAsk_wdateYMD().equals(LocalDate.now().toString())) {
		        askDate = dto.getAsk_wdateTime();
		        dto.setNewicon(true);
		    } else {
		        askDate = dto.getAsk_wdateYMD();
		        dto.setNewicon(false);

		    }
		    dto.setAsk_date(askDate);
		}
		
		
		mav.addObject("totalCnt",rtotalCnt);
		mav.addObject("lists",lists);
		mav.addObject("pageStr",pageStr);

		mav.setViewName("ask/myAskList");

		return mav;
	}
	
}
