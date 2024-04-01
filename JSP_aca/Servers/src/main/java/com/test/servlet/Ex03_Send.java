package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex03_Send extends HttpServlet {

	// doPost > 데이터를 수신 + 처리하는 용도
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		System.out.println("GET 요청");
	}
	//평상시 호출하는 용도
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8");
		PrintWriter writer = resp.getWriter();
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='UTF-8'>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h1>데이터 입력</h1>");
		writer.println("<form method='POST' action='/ServletTest/receive.do'>");
		writer.println("<div>이름: <input type='text' name='txtName'></div>");
		writer.println("<div>나이: <input type='text' name='txtAge'></div>");
		writer.println("<input type='submit' value='보내기'>");
		writer.println("</form>");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
		
	}

}









