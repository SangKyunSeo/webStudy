package com.spring.shopping;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dto.ItemVO;
import com.spring.dto.MemberVO;
import com.spring.dto.OrderPageItemListVO;
import com.spring.service.ItemService;
import com.spring.service.MemberService;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private MemberService memService;
	@Inject
	private ItemService itemService;
	/**
     * Simply selects the home view to render by returning its name.
	 * @throws Exception 
     */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "home";
	}
	
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public void getRegister() throws Exception{
		logger.info("get register");
	}
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public void postRegister(MemberVO memberVo) throws Exception{
		logger.info("post register");
		memService.register(memberVo);
		
	}

	@RequestMapping(value="/setitem", method = RequestMethod.GET)
	public void getSetItem() throws Exception{
		logger.info("get set Item");
	}
	
	@RequestMapping(value="/setitem", method = RequestMethod.POST)
	public void postSetItem(ItemVO itemVo) throws Exception{
		logger.info("post Set Item");
		itemService.register(itemVo);
		
	}
	
	@RequestMapping(value="/itemList", method = RequestMethod.GET)
	public String getList(Locale locale,Model model) throws Exception{
		List<ItemVO> list = itemService.list();
		model.addAttribute("itemList",list);
		return "itemList";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String LoginPage() {
	    return "login";
	}
	  
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session,RedirectAttributes rttr) {
		MemberVO login = memService.login(vo);
		String path="";
		if(login!=null) {
			session.setAttribute("LoginVo", login);
			return "redirect:itemList";
		}
		else
		{
			session.setAttribute("LoginVo", null);
			rttr.addFlashAttribute("msg",false);
			path="login";
		}
		return path;
	}
	
	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		mav.setViewName("login");
		mav.addObject("message","logout");
		return mav;
	}
	
	@RequestMapping(value="/order",method = RequestMethod.GET)
	public void orderPageGet(HttpSession session, Model model) throws Exception{
		MemberVO vo = (MemberVO)session.getAttribute("LoginVo");
		model.addAttribute("buyer",vo);
	}
}
