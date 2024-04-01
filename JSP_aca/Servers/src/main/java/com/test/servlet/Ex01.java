package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//1. 서블릿 클래스 선언 > 순수 자바(X), 서블릿 API 사용(O)
//a. javax.servlet.Servlet 인터페이스를 구현한다. > 복잡함. 고비용
//a. javax.servlet.http.HttpServlet 클래스를 상속받는다. > 단순함. 저비용

public class Ex01 extends HttpServlet {

	//2. doGet/doPost 메소드 선언
	//	메소드 작성 규칙
	//	a. 매개 변수 작성
	//		1. java.servlet.http.HttpServletRequest
	//		2. java.servlet.http.HttpServletResponse
	//	b. 예외 미루기
	//		1. java.io.IOException
	//		2. java.servlet.ServletException
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		//3. 동적 HTML 페이지 작성
		//- FileWriter / BufferedWriter
		//- 브라우저가 보게될 페이지 == HTML 페이지 > 내용이 HTML
		PrintWriter writer = resp.getWriter();
		
		writer.println("<html>");
		writer.println("<body>");
		writer.println("<h1>Hello Servlet</h1>");
		writer.println("<p>Hello~ Hong!!! aaaaaa</p>");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
		
		
		//http://localhost:8090/ServletTest/servlet/com.test.servlet.Ex01
		
		//http://localhost:8090/ServletTest/ex01.do
		
		
	}
	
}













