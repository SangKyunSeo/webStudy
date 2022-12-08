package com.spring.shopping;

import java.text.DateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		logger.info("Welcome home! The client locale is {}.", locale);
		MemberVO vo = (MemberVO)session.getAttribute("LoginVo");
		if(vo==null)return "redirect:login";
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
	
	@RequestMapping(value="/detail",method=RequestMethod.GET)
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
