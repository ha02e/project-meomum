package com.mm.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mm.emp.model.EmpDAO;
import com.mm.emp.model.EmpDTO;

@Controller
public class EmpController {
	@Autowired
	private EmpDAO empDao;
	
	@RequestMapping("/emp.do")
	public String empForm() {
		return "emp/emp";
	}
	
	@RequestMapping("/empAdd.do")
	public ModelAndView empAdd(EmpDTO dto) {
		int result = empDao.empAdd(dto);
		String msg = result>0? "사원정보 등록 완료!":"사원정보 등록 실패!";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("emp/empMsg");
		return mav;
	}
	
	@RequestMapping("/empDel.do")
	public ModelAndView empDel(@RequestParam("idx")int idx) {
		int result = empDao.empDel(idx);
		String msg = result>0? "사원정보 삭제!":"사원정보 삭제 실패!";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("emp/empMsg");
		return mav;
	}
	
	@RequestMapping("/empList.do")
	public ModelAndView empAllList() {
		List<EmpDTO> list = empDao.empAllList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("dtos", list);
		mav.setViewName("mmJson");
		return mav;
	}	
	

	


	
}
