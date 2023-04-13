package com.mm.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	
	@RequestMapping("/index.do")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/admin.do")
	public String admin() {
		return "admin";
	}
	@RequestMapping("/error")
    public ModelAndView handleError(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        Object status = request.getAttribute("javax.servlet.error.status_code");

        if (status != null) {
            int statusCode = Integer.parseInt(status.toString());
            if (statusCode == HttpStatus.NOT_FOUND.value()) {
                mav.setViewName("error/error404");
            } else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
                mav.setViewName("error/error500");
            }
        }
        return mav;
    }

}
