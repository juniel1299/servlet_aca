<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    	//클라이언트 > (전송) > 서버
    	
    	//1. GET 
    		// URL 뒤에 붙여서 전송\
    		// 택배 상자 겉의 송장에 데이터 추가 
    	//2. POST
    		// 패킷 본문(body)안에 넣어서 전송
    		// 택배 상자 안에 넣어서 전송
    		
    		
    	// 데이터 수신하기
    	// String request.getParameter(String key)
    	
    	request.setCharacterEncoding("UTF-8"); // 설정 바꾸기 
    	
    	String txt = request.getParameter("txt");
    	String num = request.getParameter("num");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">

<style>

</style>
</head>
<body>

<h1> 결과 </h1>

<div>txt: <%= txt %></div>
<div>num: <%= num %></div>
<!---->
<h1 class="main">데이터 전송하기</h1>
<h2>폼태그 + POST 방식으로 보내기</h2>

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>

</script>
</body>
</html>