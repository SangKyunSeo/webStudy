package com.spring.shopping;

import java.io.File;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dto.CartVO;
import com.spring.dto.InquiryVO;
import com.spring.dto.ItemVO;
import com.spring.dto.MemberVO;
import com.spring.dto.OrderPageItemVO;
import com.spring.dto.OrderVO;
import com.spring.dto.PagingVO;
import com.spring.dto.ReviewVO;
import com.spring.service.CartService;
import com.spring.service.InquiryService;
import com.spring.service.ItemService;
import com.spring.service.MemberService;
import com.spring.service.OrderService;
import com.spring.service.ReviewService;
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
	@Inject
	private ReviewService reviewService;
	@Inject
	private InquiryService inquiryService;

	/**
     * Simply selects the home view to render by returning its name.
	 * @throws Exception 
     */
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String test(HttpSession session,Locale locale, Model model) throws Exception {
		MemberVO vo = (MemberVO)session.getAttribute("LoginVo");
		int cartCount = 0;
		if(vo!=null) {
			cartCount = cartService.calCount(vo.getMemberId());
		}
		
		List<ItemVO> list = itemService.list();
		model.addAttribute("itemList",list);
		model.addAttribute("user",vo);
		model.addAttribute("cartCount",cartCount);
	
		return "home";
	}
	@RequestMapping(value = "itemdetail/{idItem}", method = RequestMethod.GET)
	public String testitemdetail(@PathVariable("idItem")int idItem,HttpSession session, Model model) throws Exception {
		MemberVO vo = (MemberVO)session.getAttribute("LoginVo");
		ItemVO detailItem = itemService.detailList(idItem);
		List<ReviewVO> reviewList = reviewService.reviewList(idItem);
		List<InquiryVO> inquiryList = inquiryService.inquiryList(idItem);
		double sumReview =0;
		double avgReview =0;
		if(!reviewList.isEmpty()) {
			for(int i=0;i<reviewList.size();i++) {
				sumReview+=reviewList.get(i).getScoreReview();
			}
			avgReview = sumReview/reviewList.size();
		}
		
		int total = reviewService.countReview(idItem);
		int qnaTotal = inquiryList.size();
		int nowPage = 1;
		PagingVO pagingVo = new PagingVO(total,nowPage);
		PagingVO qnaPagingVo = new PagingVO(qnaTotal,nowPage);
		List<ReviewVO> list = reviewService.selectReview(pagingVo, idItem);
		List<InquiryVO> qnaList = inquiryService.selectInquiry(qnaPagingVo,idItem);
		model.addAttribute("paging",pagingVo);
		model.addAttribute("pagingList",list);
		model.addAttribute("qnaList",qnaList);
		model.addAttribute("qnaPaging",qnaPagingVo);
		
		DecimalFormat formatter = new DecimalFormat("#.#");
		DecimalFormat priceForm = new DecimalFormat("###,###,###");
		if(avgReview!=0) {
			model.addAttribute("avgReview",formatter.format(avgReview));
		}else {
			model.addAttribute("avgReview",0);
		}
		model.addAttribute("user",vo);
		model.addAttribute("date",currentDate.toString());
		model.addAttribute("inquiryList",inquiryList);
		model.addAttribute("item",detailItem);
		model.addAttribute("priceItem",priceForm.format(detailItem.getPriceItem()));
		model.addAttribute("reviewSize",reviewList.size());
		model.addAttribute("inquirySize",inquiryList.size());
		return "itemdetail";
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
	public void postSetItem(@RequestParam("file")MultipartFile file,ItemVO itemVo,HttpServletRequest req) throws Exception{
		logger.info("post Set Item");
		ServletContext servletContext = req.getSession().getServletContext(); 
		String webappRoot = servletContext.getRealPath("/");
		String relativeFolder = File.separator + "resources" + File.separator + "img" + File.separator;
		UUID uuid = UUID.randomUUID();
		String fileName= uuid.toString() + "_" + file.getOriginalFilename();
		
		FileCopyUtils.copy(file.getBytes(),new File(webappRoot + relativeFolder + fileName));
		
		itemVo.setImageItem(File.separator + "img" + File.separator + fileName);
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
	public String orderParsing(@RequestParam(value="amountItem")int amountItem,@RequestParam(value="idItem")int idItem,RedirectAttributes redirectAttributes)throws Exception{
		ItemVO detailList = itemService.detailList(idItem);
		redirectAttributes.addFlashAttribute("detailList",detailList);
		redirectAttributes.addFlashAttribute("orderNumber",orderNumber++);
		redirectAttributes.addFlashAttribute("date",currentDate.toString());
		redirectAttributes.addFlashAttribute("amountItem",amountItem);
		return "redirect:order";
	}
	
	
	@RequestMapping(value="/registCart",method=RequestMethod.GET)
	public String registCart(HttpSession session,CartVO cartVo,RedirectAttributes redirectAttributes) throws Exception{
		cartVo.setPriceCart(cartVo.getAmountCart()*cartVo.getPriceCart());
		cartService.register(cartVo);
		return "redirect:myCart";
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
		int total = 0;
		for(int i=0;i<list.size();i++) {
			total+=list.get(i).getPriceCart();
		}
		model.addAttribute("user",vo);
		model.addAttribute("myCartList",list);
		model.addAttribute("total",total);
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
	
	@RequestMapping(value="/regReview",method=RequestMethod.GET)
	public void registReview(ReviewVO reviewVo, Model model, HttpSession session) throws Exception{
		MemberVO vo = (MemberVO)session.getAttribute("LoginVo");
		model.addAttribute("user",vo);
		model.addAttribute("date",currentDate.toString());
	}
	
	@RequestMapping(value="/regReview",method=RequestMethod.POST)
	public String registReviewPost(ReviewVO reviewVo, Model model, HttpSession session) throws Exception{
		reviewService.regReview(reviewVo);
		String param = "/" + reviewVo.getIdItem();
		String url = "redirect:itemdetail"+param;
		return url;
	}
	
	@RequestMapping(value="/regQna",method=RequestMethod.GET)
	public void registQna(InquiryVO inquiryVo, Model model, HttpSession session) throws Exception{
		MemberVO vo = (MemberVO)session.getAttribute("LoginVo");
		
		
		model.addAttribute("user",vo);
		model.addAttribute("date",currentDate.toString());
	}
	
	@RequestMapping(value="/regQna",method=RequestMethod.POST)
	public String registQnaPost(InquiryVO inquiryVo, Model model, HttpSession session) throws Exception{
		inquiryService.regQna(inquiryVo);
		String param = "/" + inquiryVo.getIdItem();
		String url = "redirect:itemdetail" + param;
		return url;
	}
	
	@ResponseBody
	@RequestMapping(value="/reviewList",method=RequestMethod.POST)
	public Map<String,Object> reviewList(Model model,HttpServletRequest req) throws Exception {
		int idItem = Integer.parseInt(req.getParameter("idItem"));
		int total = reviewService.countReview(idItem);
		String nowPage = req.getParameter("nowPage");
		if(nowPage==null) {
			nowPage="1";
		}
		
		Map<String,Object> result = new HashMap<>();
		PagingVO pagingVo = new PagingVO(total,Integer.parseInt(nowPage));
		List<ReviewVO> list = reviewService.selectReview(pagingVo, idItem);
		result.put("paging",pagingVo);
		result.put("paginglist",list);
		String param = "/"+idItem;
		
		return result;
			
	}
}
