package com.spring.shopping;

import java.text.DateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dto.CartVO;
import com.spring.dto.ItemVO;
import com.spring.dto.MemberVO;
import com.spring.dto.OrderPageItemVO;
import com.spring.dto.OrderVO;
import com.spring.service.CartService;
import com.spring.service.ItemService;
import com.spring.service.MemberService;
import com.spring.service.OrderService;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	private static int orderNumber = 0;
	private static LocalDate currentDate = LocalDate.now(); 
	
	@Inject
	private MemberService memService;
	@Inject
	private ItemService itemService;
	@Inject
	private OrderService orderService;
	@Inject
	private CartService cartService;
	
	/**
     * Simply selects the home view to render by returning its name.
	 * @throws Exception 
     */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session,Locale locale, Model model) throws Exception {
		MemberVO vo = (MemberVO)session.getAttribute("LoginVo");
		List<ItemVO> list = itemService.list();
		model.addAttribute("itemList",list);
		model.addAttribute("user",vo);
		return "home";
	}
	
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public void getRegister() throws Exception{
		logger.info("get register");
	}
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String postRegister(@Valid MemberVO memberVo,BindingResult result,Model model) throws Exception{
		if(result.hasErrors()) {
			return "/register";
		}
		memService.register(memberVo);
		return "redirect:/login";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/idchk", method = RequestMethod.POST)
	public int idcheck(HttpServletRequest req) throws Exception{
		String id_member = req.getParameter("id_member");
		MemberVO idCheck = memService.idcheck(id_member);
		if(idCheck!=null)return 1;
		
		return 0;
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
	
	@RequestMapping(value="/searchItem", method = RequestMethod.GET)
	public String getSearchItem(@Valid @RequestParam(value="nameItem")String nameItem,Model model) throws Exception {
		List<ItemVO> list = itemService.searchItems(nameItem);
		boolean exist = false;
		if(list.size()!=0)exist=true;
		
		model.addAttribute("name",nameItem);
		model.addAttribute("itemList",list);
		model.addAttribute("exist",exist);
		return "searchItem";
	}
	//관리자 페이지
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
		return "login";
	}
	
	@RequestMapping(value="/loginCheck", method = RequestMethod.POST)
	public String login_check(@ModelAttribute MemberVO vo, HttpSession session,RedirectAttributes redirectAttributes)throws Exception {
		String email = memService.loginCheck(vo, session);
		if(email!=null) {
			return "redirect:/";
		}else {
			redirectAttributes.addFlashAttribute("msg","Error");
			return "redirect:/login";
		}
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
		memService.logout(session);
		redirectAttributes.addFlashAttribute("msg","logout");
		return "redirect:login";
	}
	
	@RequestMapping(value="/order",method = RequestMethod.GET)
	public void orderPageGet(HttpSession session, Model model,OrderVO orderVo) throws Exception{
		MemberVO vo = (MemberVO)session.getAttribute("LoginVo");
		model.addAttribute("buyer",vo);
		model.addAttribute("orderNumber",orderNumber++);
		model.addAttribute("date",currentDate.toString());
	}
	
	@RequestMapping(value="/successOrder", method=RequestMethod.POST)
	public void registOrder(OrderVO orderVo,Model model)throws Exception{
		List<OrderVO> list = orderService.getMaxOrderId(orderVo);
		if(list.size()==0)orderNumber++;
		else orderNumber=list.get(list.size()-1).getIdOrder()+1;
		orderVo.setIdOrder(orderNumber);
		orderService.register(orderVo);
		
		model.addAttribute("order",orderVo);
	}
	
	@RequestMapping(value="/orderParsing",method=RequestMethod.GET)
	public String orderParsing(@RequestParam(value="idItem")int idItem,RedirectAttributes redirectAttributes)throws Exception{
		ItemVO detailList = itemService.detailList(idItem);
		redirectAttributes.addFlashAttribute("detailList",detailList);
		redirectAttributes.addFlashAttribute("orderNumber",orderNumber++);
		redirectAttributes.addFlashAttribute("date",currentDate.toString());
		return "redirect:order";
	}
	
	
	@RequestMapping(value="/registCart",method=RequestMethod.GET)
	public String registCart(HttpSession session,@RequestParam(value="idItem")int idItem,RedirectAttributes redirectAttributes) throws Exception{
		MemberVO vo = (MemberVO)session.getAttribute("LoginVo");
		ItemVO cartItem = itemService.cartItem(idItem);
		redirectAttributes.addFlashAttribute("user",vo);
		redirectAttributes.addFlashAttribute("cartItem",cartItem);
		redirectAttributes.addFlashAttribute("date",currentDate.toString());
		return "redirect:cart";
	}
	
	@RequestMapping(value="/cart",method = RequestMethod.GET)
	public void cart(HttpSession session, Model model,CartVO cartVo) throws Exception{
		MemberVO vo = (MemberVO)session.getAttribute("LoginVo");
		model.addAttribute("user",vo);
		model.addAttribute("date",currentDate.toString());
	}
	
	@RequestMapping(value="/cartDetail", method=RequestMethod.POST)
	public void registOrder(CartVO cartVo,Model model)throws Exception{
		cartVo.setPriceCart(cartVo.getAmountCart()*cartVo.getPriceCart());
		cartService.register(cartVo);
		
		model.addAttribute("cart",cartVo);
	}
	
	@RequestMapping(value="/itemdetail",method=RequestMethod.GET)
	public void itemDetail(Model model)throws Exception{
		
	}
	
	@RequestMapping(value="/deleteCart",method=RequestMethod.GET)
	public String deleteCart(@RequestParam(value="memberCart")String memberCart,@RequestParam(value="itemCart")int itemCart)throws Exception{
		cartService.delete(memberCart,itemCart);
		return"redirect:myCart";
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String deleteItem(@RequestParam(value="idItem")int idItem)throws Exception {
		itemService.delete(idItem);
		return "redirect:itemList";
	}
	
	@RequestMapping(value="/myCart",method=RequestMethod.GET)
	public String myCartDetail(HttpSession session,Model model) throws Exception{
		MemberVO vo = (MemberVO)session.getAttribute("LoginVo");
		List<CartVO> list = cartService.search(vo.getMemberId());
		model.addAttribute("myCartList",list);
		return "myCart";
	}
	
	@RequestMapping(value="/updateInfo",method=RequestMethod.GET)
	public void updateInfoGET(HttpSession session,Model model, MemberVO memberVo) throws Exception{
		
	}
	@RequestMapping(value="/updateInfo",method=RequestMethod.POST)
	public void updateInfo(HttpSession session,Model model, MemberVO memberVo) throws Exception{
		MemberVO vo = (MemberVO)session.getAttribute("LoginVo");
		model.addAttribute("user",vo);
		System.out.println(vo.getMemberAge());
		memService.updateInfo(memberVo);
	}
	
	@RequestMapping(value="/updateItem",method=RequestMethod.GET)
	public void updateItem(@RequestParam(value="idItem")int idItem,Model model,ItemVO itemVo) throws Exception{
		ItemVO detailList = itemService.detailList(idItem);
		model.addAttribute("item",detailList);
		itemService.update(itemVo);
	}
		
}
