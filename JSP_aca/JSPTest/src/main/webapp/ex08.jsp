<%@page import="com.test.jsp.MyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int a = 10;

	/* public void test() {
		
	} */
	
	/* class Test {
		
	} */
	
	MyUtil util = new MyUtil();
	

%>    
<%!

	//선언부
	public int b = 20;

	public int sum(int a, int b) {
		return a + b;
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ex08.jsp -->
	
	<div>10 + 20 = <%= sum(10, 20) %></div>
	<div>30 + 40 = <%= sum(30, 40) %></div>
	<div>50 + 60 = <%= util.sum(50, 60) %></div>
	
</body>
</html>












