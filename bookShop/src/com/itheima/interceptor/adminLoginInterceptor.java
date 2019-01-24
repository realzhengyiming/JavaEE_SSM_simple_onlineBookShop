package com.itheima.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.itheima.po.Admins;
import com.itheima.po.Users;


public class adminLoginInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override    
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		String url = request.getRequestURI();
		
		
		/*System.out.println(url.indexOf("/admin"));*/
		System.out.println(url);
		

		
		HttpSession session = request.getSession();
		Admins admins = (Admins) session.getAttribute("ADMIN_SESSION");
		
		if (admins !=null) {
			return true;
		}
			
		response.sendRedirect(request.getContextPath()
				+ "/adminLogin?next=".concat(request.getRequestURI()));  
		return false;
	}
	
	

}
