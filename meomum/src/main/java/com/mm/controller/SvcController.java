package com.mm.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mm.member.model.MemberDAO;
import com.mm.member.model.MemberDTO;
import com.mm.order.model.OrderProDTO;
import com.mm.payment.model.PaymentDAO;
import com.mm.payment.model.PaymentDTO;
import com.mm.point.model.PointDAO;
import com.mm.point.model.PointDTO;
import com.mm.point.model.ResultDTO;
import com.mm.svc.model.IdxDTO;
import com.mm.svc.model.SvcContentDTO;
import com.mm.svc.model.SvcDAO;
import com.mm.svc.model.SvcMemDTO;
import com.mm.svc.model.SvcSelectAllDTO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.mm.svc.model.SvcDetailDTO;
import com.mm.svc.model.SvcIngDTO;
import com.mm.svc.model.SvcDateDTO;


@Controller
public class SvcController {
	
	@Autowired
	private SvcDAO svcDao;
	@Autowired
	private MemberDAO mdao;
	@Autowired
	private PointDAO pdao;
	@Autowired
	private PaymentDAO payDao;
	
	/**방문 견적 신청 폼 이동*/
	@RequestMapping("/svc.do")
	public ModelAndView svc(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("ssInfo")==null) {
			mav.addObject("msg", "로그인 후 이용가능합니다");
			mav.addObject("link", "login.do");
			mav.setViewName("msg");
		}else {
			mav.setViewName("svc/svcForm");
		}
		return mav;
	}
	
	/**방문 견적 신청*/
	@RequestMapping("/svcFormSubmit.do")
	public ModelAndView svcFormSubmit(SvcMemDTO memDto,SvcDetailDTO detailDto, SvcDateDTO dateDto) {
		int memAdd = svcDao.svcMemInsert(memDto);
		int detailAdd = svcDao.svcDetailInsert(detailDto);
		int dateAdd = svcDao.svcDateInsert(dateDto);
		
		int result = memAdd+detailAdd + dateAdd;
		
		String msg = result>0?"방문견적 예약이 신청되었습니다":"다시 시도해주세요";
		String link = result>0?"index.do":"svcList.do";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("link",link);
		mav.setViewName("msg");
		return mav;
	}
	

	/**방문 견적 신청 시 예약된 시간 비활성화*/
	@RequestMapping(value = "/svcTimeSelect.do", method = RequestMethod.GET)
	@ResponseBody 
	public ModelAndView test(@RequestParam("svc_days")String days){
		List<String> times = svcDao.svcTimeSelect(days);
		ModelAndView mav = new ModelAndView();
		mav.addObject("times", times);
		mav.setViewName("mmJson");
		return mav; 
	}
	
	/**관리자 페이지-방문 견적 신청자 리스트*/
	@RequestMapping("/asvcList.do")
	public ModelAndView asvcList(@RequestParam(value="cp",defaultValue="1")int cp) {
		int totalCnt = svcDao.getTotalCnt();
		int listSize = 10;
		int pageSize = 5;
		String pageStr = com.mm.module.PageModule.makePage("asvcList.do", totalCnt, listSize, pageSize, cp);
		List<SvcSelectAllDTO> list = svcDao.svcAdminList(cp,listSize);
		ModelAndView mav = new ModelAndView();
		mav.addObject("svcDTO", list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("svc/a_svcList");
		return mav;
	}
	
	
	/**관리자-예약 세부 검색*/
	@RequestMapping("/svcSearch.do")
	@ResponseBody
	public ModelAndView svcSearch(@RequestParam("minDate") String minDate,
			@RequestParam("maxDate") String maxDate,
            @RequestParam(value="category",defaultValue="1") int category,
            @RequestParam("keyword") String keyword,
            @RequestParam("state[]") List<String> state,
            @RequestParam(value="cp",defaultValue="1")int cp){
		
	    int totalCnt = svcDao.svcSelectDetailCnt(minDate, maxDate, category, keyword, state);
	    int listSize = 10;
	    int pageSize = 5;

	    String pageStr = com.mm.module.PageModule.makePage("svcSearch.do", totalCnt, listSize, pageSize, cp);

		ArrayList<String> arr = new ArrayList<String>();
		for(int i=0;i<state.size();i++) {
			arr.add(state.get(i));
		}
		
		List<SvcSelectAllDTO> list = svcDao.svcSelectDetail(minDate,maxDate,category,keyword,arr,cp,listSize);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("mmJson");
		return mav;
	}
	
	/**관리자: 예약 삭제*/
	//예약확정, 예약취소일 경우
	@RequestMapping(value="/asvcDelete.do", method = RequestMethod.GET)
	public ModelAndView asvcDelete(@RequestParam("svc_idx")String idx) {
		System.out.println(idx);
		int memDelete = svcDao.svcMemDelete(idx);
		int detailDelete = svcDao.svcDetailDelete(idx);
		int dateDelete = svcDao.svcDateDelete(idx);
		
		int result = memDelete + detailDelete + dateDelete;
		String msg = result>0?"성공":"실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("mmJson");
		return mav;
	}
	
	@RequestMapping(value="/asvcIngDelete.do", method = RequestMethod.GET)
	public ModelAndView asvcIngDelete(@RequestParam("svc_idx")String idx) {
		System.out.println("ing"+idx);
		int memDelete = svcDao.svcMemDelete(idx);
		int detailDelete = svcDao.svcDetailDelete(idx);
		int dateDelete = svcDao.svcDateDelete(idx);
		int ingDelete = svcDao.svcIngDelete(idx);
		
		int result = memDelete + detailDelete + dateDelete+ ingDelete;
		String msg = result>0?"성공":"실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("mmJson");
		return mav;
	}
	
	/**관리자- 방문 견적 상세 보기*/
	@RequestMapping("/asvcContent.do")
	public ModelAndView asvcInfo(@RequestParam("svc_idx")String idx) {
		SvcContentDTO dto = svcDao.svcContent(idx);
		SvcIngDTO ingDto = svcDao.svcIngContent(idx);
		PaymentDTO payDTO = payDao.paymentSelect(idx);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto",dto);
		mav.addObject("ingdto", ingDto);
		mav.addObject("payDTO", payDTO);
		mav.setViewName("svc/a_svcContent");
		return mav;
	}
	
	/**관리자-정리일상 견적 추가 팝업창으로 이동*/
	@RequestMapping("/asvcIngPopup.do")
	public String asvcIngPopup() {
		return "svc/a_svcIngPopup";
	}

	/**관리자-정리일상 견적 추가*/
	@RequestMapping("/svcIngInsert.do")
	public ModelAndView svcIngInsert(SvcIngDTO dto) {
		int result = svcDao.svcIngInsert(dto);
		String link = result>0? "asvcContent.do?svc_idx="+dto.getSvc_idx():"asvcIngPopup.do";
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("link",link);
		mav.setViewName("svc/a_svcIngPopup");

		return mav;
	}
	
	/**관리자-정리일상 견적 상세 보기*/
	@RequestMapping("asvcIngContent.do")
	public ModelAndView asvcIngContent(@RequestParam("svc_idx")String idx) {
		SvcIngDTO ingDto = svcDao.svcIngContent(idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("ingdto", ingDto);
		mav.setViewName("svc/a_svcIngContent");
		return mav;
	}

	/**관리자 페이지-방문 견적 수정*/
	@RequestMapping("/asvcUpdate.do")
	public ModelAndView asvcUpdate(SvcMemDTO memDto,SvcDetailDTO detailDto, SvcDateDTO dateDto) {
		int memUpdate = svcDao.svcMemUpdate(memDto);
		int detailUpdate = svcDao.svcDetailUpdate(detailDto);
		int dateUpdate = svcDao.svcDateUpdate(dateDto);
		
		int result = memUpdate+detailUpdate+dateUpdate;
		
		String msg = result>0?"방문견적 예약이 수정되었습니다":"다시 시도해주세요";
		String link = result>0?"asvcList.do":"asvcContent.do";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("link",link);
		
		mav.setViewName("msg");
		
		return mav;
	}
	
	/**관리자-정리일상 견적 수정*/
	@RequestMapping("/asvcIngUpdate.do")
	public ModelAndView asvcIngUpdate(SvcIngDTO dto,SvcMemDTO memDto) {
		int ingUpdate = svcDao.svcIngUpdate(dto);
		/* int memUpdate = svcDao.svcStateUpdate(memDto); */
		ModelAndView mav = new ModelAndView();
	
		mav.setViewName("svc/a_svcIngContent");
		return mav;
	}


	/**마이페이지-방문 견적 예약 내역*/
	@RequestMapping("/svcList.do")
	public ModelAndView svcUserList(HttpSession session,@RequestParam(value="cp",defaultValue="1")int cp) {
		session.getAttribute("ssInfo");
		MemberDTO sdto =(MemberDTO) session.getAttribute("ssInfo");
		int user_idx = sdto.getUser_idx();
		
		int totalCnt = svcDao.svcUserListCnt(user_idx);
		int listSize = 5;
		int pageSize = 5;
		
		String pageStr = com.mm.module.PageModule.makePage("svcList.do", totalCnt, listSize, pageSize, cp);
		
		List<SvcSelectAllDTO> list = svcDao.svcUserList(cp,listSize,user_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);

		mav.setViewName("svc/svcList");
		return mav;
	}
	
	/**마이페이지-예약 상세 보기(방문 견적 예약 내역)*/
	@RequestMapping("/svcContent.do")
	public ModelAndView svcInfo(@RequestParam("svc_idx")String idx) {
		SvcContentDTO dto = svcDao.svcContent(idx);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("dto",dto);
		mav.setViewName("svc/svcContent");

		return mav;
	}
	
	/**사용자 페이지-방문 견적 예약 수정 폼*/
	@RequestMapping("/svcUpdateForm.do")
	public ModelAndView updateForm(@RequestParam("svc_idx")String idx) {
		SvcContentDTO dto = svcDao.svcContent(idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto",dto);
		mav.setViewName("svc/svcUpdate");
		return mav;
	}
	
	/**사용자 페이지-방문 견적 예약 수정*/
	@RequestMapping("/svcUpdate.do")
	public ModelAndView svcUpdate(SvcMemDTO memDto,SvcDetailDTO detailDto, SvcDateDTO dateDto) {
		int memUpdate = svcDao.svcMemUpdate(memDto);
		int detailUpdate = svcDao.svcDetailUpdate(detailDto);
		int dateUpdate = svcDao.svcDateUpdate(dateDto);
		
		int result = memUpdate+detailUpdate+dateUpdate;
		
		String msg = result>0?"방문견적 예약이 수정되었습니다":"다시 시도해주세요";
		String link = result>0?"svcList.do":"svcUpdate.do";
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("link",link);
		
		mav.setViewName("msg");
		
		return mav;
	}
	
	/**사용자-방문견적 예약 취소*/
	@RequestMapping("/svcCancle.do")
	public ModelAndView svcDelete(@ModelAttribute SvcContentDTO dto) {
		int stateResult=svcDao.svcStateCancle(dto);
		int dateResult = svcDao.svcDateCancle(dto);
		
		ModelAndView mav = new ModelAndView();
		
		String msg = stateResult+dateResult>0?"방문견적 예약이 취소되었습니다":"다시 시도해주세요";
		String link = stateResult+dateResult>0?"svcList.do":"svcContent.do";
		
		mav.addObject("msg",msg);
		mav.addObject("link",link);
		
		mav.setViewName("msg");
		
		return mav;
	}
	
	/**마이페이지-정리일상 진행 현황*/
	@RequestMapping("/svcIngList.do")
	public ModelAndView svcIngList(HttpSession session,@RequestParam(value="cp",defaultValue="1")int cp) {
		session.getAttribute("ssInfo");
		MemberDTO sdto =(MemberDTO) session.getAttribute("ssInfo");
		int user_idx = sdto.getUser_idx();

		int totalCnt = svcDao.svcIngListCnt(user_idx);
		int listSize = 5;
		int pageSize = 5;
		String pageStr = com.mm.module.PageModule.makePage("svcIngList.do", totalCnt, listSize, pageSize, cp);
		List<SvcIngDTO> list = svcDao.svcIngList(cp,listSize,user_idx);
	
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("svc/svcIngList");
		return mav;
	}
	
	/**마이페이지-예약 상세 보기(정리일상 진행 현황)*/
	@RequestMapping("/svcIngContent.do")
	public ModelAndView svcIngContent_a(@RequestParam("svc_idx")String idx,@RequestParam("user_idx")int user_idx) {
		SvcContentDTO dto = svcDao.svcContent(idx);
		SvcIngDTO ingdto = svcDao.svcIngContent(idx);
		/* PaymentDTO paydto = payDao.paymentSelect(idx); */
		
		int result = pdao.pointTotal(user_idx);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("dto",dto);
		mav.addObject("ingdto",ingdto);
		
		mav.addObject("result", result);
		/* mav.addObject("paydto",paydto); */
		/* System.out.println("정리일상 예약 상세:"+paydto); */
	
		mav.setViewName("svc/svcIngContent");
	
		return mav;
	}

	
	/**사용자: 정리일상 결제(payment 테이블 insert)*/
	@RequestMapping(value="/svcPay.do")
	public ModelAndView svcPay(@RequestBody Map<String,Object> data) {
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		PaymentDTO paydto = objectMapper.convertValue(data.get("PaymentDTO"), PaymentDTO.class);
	    PointDTO pdto = objectMapper.convertValue(data.get("PointDTO"), PointDTO.class);
	    IdxDTO idto = objectMapper.convertValue(data.get("IdxDTO"),IdxDTO.class);
	    
	   
		int payInsert = payDao.paymentInsert(paydto);
		int pointInsert = pdao.pointInsert(pdto);
		int svcUpdate = svcDao.updateSvcState(idto);
		int payUpdate = svcDao.updatePayState(idto);
		
		ModelAndView mav = new ModelAndView();
		
		int result = payInsert + pointInsert + svcUpdate + payUpdate;
		
		String msg = result>0?"결제가 완료되었습니다":"다시 시도해주세요";
		String link = result>0?"svcIngList.do":"svcIngContent.do";
		
		mav.addObject("msg", msg);
		mav.addObject("link", link);
		mav.setViewName("mmJson");
		
		return mav;
	}
	
	/**사용자: 정리일상 결제(point 테이블 insert)
	@RequestMapping(value="/insertPoint.do")
	public ModelAndView svcPay(@RequestBody PointDTO pdto) {
		
		int result = pdao.pointInsert(pdto);
		ModelAndView mav = new ModelAndView();
		
		String msg = result>0?"결제가 완료되었습니다":"다시 시도해주세요";
		String link = result>0?"svcIngList.do":"svcIngContent.do";
		
		mav.addObject("msg", msg);
		mav.addObject("link", link);
		mav.setViewName("mmJson");
		
		return mav;
	}*/
	
	/**정리일상 결제 시 상태 변경
	//svc_member
	@RequestMapping(value="/updateState.do")
	public ModelAndView updateState(@RequestBody IdxDTO dto) {
		int svcUpdate = svcDao.updateSvcState(dto);
		int payUpdate = svcDao.updatePayState(dto);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mmJson");
		return mav;
	}*/
	
	//svc_ing
	/**예약시간 가져오기*/
	@RequestMapping(value="/svcCalendar.do")
	public ModelAndView SvcCalendarForm(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();

		MemberDTO ssInfo = (MemberDTO) session.getAttribute("ssInfo");
		if(ssInfo==null||!ssInfo.getUser_info().equals("관리자")) {
			mav.addObject("msg", "관리자만 접근할 수 있습니다.");
			mav.addObject("gopage","location.href='index.do';");
			mav.setViewName("mainMsg");
			return mav;
		}
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		SimpleDateFormat sdf2 = new SimpleDateFormat("M월");
		String thisMonth = sdf.format(cal.getTime());
		String month = sdf2.format(cal.getTime());
		
		List<SvcSelectAllDTO> list = svcDao.svcAdminLista();
		List<SvcIngDTO> svcing = svcDao.svcIngCalList();
		
		JSONArray jsonArray = new JSONArray();
		int svcing_count = 0;
		int svc_cancel = 0;
		int svc_count = 0;
		for(SvcIngDTO dto: svcing) {
			
			// SVC_DATETIME 컬럼값을 문자열로 받아와서 이번달과 같은지 비교하기
			String svcDatetime = dto.getSvc_datetime(); // 예시로 dto에서 가져온 값
			if (svcDatetime.substring(0, 7).equals(thisMonth)) {
				svcing_count ++; // 
			}
			JSONObject jsonObject = new JSONObject();
			
			dto.getSvc_datetime();
			String name= svcDao.sveIngCalName(dto.svc_idx);
			
			jsonObject.put("title", name+"님 서비스 진행");
			jsonObject.put("start", dto.getSvc_datetime()+":00");
			jsonObject.put("backgroundColor", "red");
			jsonObject.put("textColor","white" ); // 폰트 색상을 지정
			jsonObject.put("borderColor", "red");
			jsonObject.put("borderWidth", "1px");
			jsonObject.put("url", "asvcContent.do?svc_idx="+dto.getSvc_idx());
			jsonObject.put("className", "serviceTitle");

			
			jsonArray.add(jsonObject);
			
			
		}
		
		for (SvcSelectAllDTO dto : list) {
			String svcDays = dto.getSvc_days().substring(0, 7);
		    if (svcDays.equals(thisMonth)) {
		    	svc_count++;
		    }
			if(dto.getSvc_state().equals("예약취소")) {
				svc_cancel++;
			}
			
			JSONObject jsonObject = new JSONObject();
			if (!dto.getSvc_time().startsWith("C")) { // dto.getSvc_time()의 값이 "C"로 시작하지 않는 경우에만 실행
				  jsonObject.put("title", dto.getUser_name() + "님 방문견적");
				  jsonObject.put("start", dto.getSvc_days() + "T" + dto.getSvc_time()+":00");
				
			 String timeStr = dto.getSvc_time();
			  int hour = Integer.parseInt(timeStr.substring(0, 2));

			    
			  if (hour == 10) {
			    jsonObject.put("className", "time1");
			  } else if (hour == 13) {
			   
		        jsonObject.put("className", "time2");
			  } else {
			   
		        jsonObject.put("className", "time3");
			  }
	
			  jsonObject.put("borderWidth", "1px");
			  jsonObject.put("url", "asvcContent.do?svc_idx="+dto.getSvc_idx());
		
			  jsonArray.add(jsonObject);
			}
			  
		}
		String jsonStr = jsonArray.toString();

		
		mav.addObject("svcing_count",svcing_count);
		mav.addObject("svc_cancel",svc_cancel);
		mav.addObject("svc_count",svc_count);
		mav.addObject("month",month);
		
		
			mav.addObject("svcDTO", list);
		    mav.addObject("svcJson", jsonStr); // jsonStr을 svcJson이라는 이름으로 전달
		    mav.setViewName("svc/svcCalendar");
		    return mav;
	}
}
