package com.test.toy.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.util.OutputUtil;

public class AuthFilter implements Filter {

	//HttpServletRequest req
	//ServletRequest request
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		//System.out.println("권한 체크");
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession();
		
		//System.out.println(session.getAttribute("id") == null ? "익명 사용자" : session.getAttribute("id"));
		//System.out.println(req.getRequestURI());
		
		if (session.getAttribute("id") == null) {
			
			///toy/user/login.do
			if (req.getRequestURI().endsWith("add.do")
				|| req.getRequestURI().endsWith("edit.do")
				|| req.getRequestURI().endsWith("del.do")
				|| req.getRequestURI().endsWith("info.do")) {
				
				response.setCharacterEncoding("UTF-8");
				PrintWriter writer = ((HttpServletResponse)response).getWriter();
				writer.print(OutputUtil.redirect("익명 사용자는 접근이 불가능합니다."));
				writer.close();
				
			}			
			
		}
		
		
		chain.doFilter(request, response);
		
	}

}












