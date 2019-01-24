package com.itheima.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.itheima.po.Users;

//这个拦截器是用来拦截点击购物车，还有查看订单，还有后台管理的需要验证的。
public class LoginInterceptor implements HandlerInterceptor{

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

	@Override    //这儿只需要搞前置拦截就可以了
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		String url = request.getRequestURI();
		//除了登陆请求以外，其他 的url都进行拦截
		
		System.out.println(url.indexOf("/bookDetail"));
		System.out.println(url);
		
//		if (url.indexOf("/login")==0) {
//			System.out.println(url.indexOf("login"));
//			
//
//			return true;
//		}
//		
//		if (url.indexOf("/loginCheck")==0) {
//			System.out.println(("loginCheck"));
//			return true;
//		}
////		
//		if (url.indexOf("/home")==0) {
//			System.out.println(("home"));
//			return true;
//		}
//		
//		if (url.indexOf("/search")==0) {
//			System.out.println(("search"));
//			return true;
//		}
////		
//		if (url.indexOf("/bookDetail")==0) {
//			System.out.println(("bookDetail"));
//			return true;
//		}
//		
//		if (url.indexOf("/register")==0) {  //注册也不能拦截
//			System.out.println(("register"));
//			return true;
//		}
//		
//		if (url.indexOf("/shoppingCar")==0) {  //注册也不能拦截
//			
//			request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
//			return false;
//		}
		
		//主页和搜索也可以不拦截
		
		HttpSession session = request.getSession();
		Users users = (Users) session.getAttribute("USER_SESSION");
		//判断session中是否有用户数据，如果有，则可以继续访问
		if (users !=null) {
			return true;
		}
		
//		request.setAttribute("msg", "您还没有登陆，请先登陆！");

//		request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
		
		response.sendRedirect(request.getContextPath()
				+ "/login?next=".concat(request.getRequestURI()));  //重定向到哪儿
		return false;
	}
	
	

}
