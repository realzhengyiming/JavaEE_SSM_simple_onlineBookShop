package com.itheima.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.itheima.po.Users;

//������������������ص�����ﳵ�����в鿴���������к�̨�������Ҫ��֤�ġ�
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

	@Override    //���ֻ��Ҫ��ǰ�����ؾͿ�����
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		String url = request.getRequestURI();
		//���˵�½�������⣬���� ��url����������
		
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
//		if (url.indexOf("/register")==0) {  //ע��Ҳ��������
//			System.out.println(("register"));
//			return true;
//		}
//		
//		if (url.indexOf("/shoppingCar")==0) {  //ע��Ҳ��������
//			
//			request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
//			return false;
//		}
		
		//��ҳ������Ҳ���Բ�����
		
		HttpSession session = request.getSession();
		Users users = (Users) session.getAttribute("USER_SESSION");
		//�ж�session���Ƿ����û����ݣ�����У�����Լ�������
		if (users !=null) {
			return true;
		}
		
//		request.setAttribute("msg", "����û�е�½�����ȵ�½��");

//		request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
		
		response.sendRedirect(request.getContextPath()
				+ "/login?next=".concat(request.getRequestURI()));  //�ض����Ķ�
		return false;
	}
	
	

}
