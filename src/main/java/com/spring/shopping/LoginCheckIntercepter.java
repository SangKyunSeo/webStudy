package com.spring.shopping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dto.MemberVO;

public class LoginCheckIntercepter implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		MemberVO vo = (MemberVO)request.getSession().getAttribute("LoginVo");
		if(vo!=null) {
			return true;
		}
		else {
			String destUri = request.getRequestURI();
			String queryString = request.getQueryString();
			String dest = "";
			if(queryString == null)
				dest = destUri;
			else
				dest = destUri + "?" + queryString;
			request.getSession().setAttribute("dest", dest);
			response.sendRedirect("/login");
			return false;
		}

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	
}
