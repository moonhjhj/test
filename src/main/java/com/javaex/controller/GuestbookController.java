package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.dao.GuestbookDao;
import com.javaex.vo.GuestbookVo;

@Controller
public class GuestbookController {
	
	@Autowired
	private GuestbookDao dao;
	
//	@RequestMapping(value = "/main", method = RequestMethod.GET)
//	public String main() {
//		System.out.println("main");
//		
//		return "/WEB-INF/views/list.jsp";
//		
//	}
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(@ModelAttribute GuestbookVo guestbookVo) {
		
		dao.insert(guestbookVo);
		return "redirect:/list";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
		List<GuestbookVo> list = dao.getList();
		model.addAttribute("list", list);
		return "/WEB-INF/views/list.jsp";
	}
	@RequestMapping(value = "/deleteform", method = RequestMethod.GET)
	public String deleteform(@RequestParam("no") int no, Model model) {
		model.addAttribute("no", no);
		return "/WEB-INF/views/deleteform.jsp";
	}
	
	public String delete(@RequestParam("no") int no, @RequestParam("password") String password) {
		
		dao.delete(no, password);
		return "redirect:/list";
	}
}
