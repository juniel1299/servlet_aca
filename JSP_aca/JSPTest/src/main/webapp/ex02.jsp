<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	h1, div {
		font-size: 1.2rem;
		margin: 10px;
	}
</style>
<body>
	<%
		Calendar now = Calendar.getInstance();
		int dan = now.get(Calendar.SECOND) % 9 + 1;
	%>
	<h1>구구단 <%= dan %>단</h1>
	
	<% for (int i=1; i<=9; i++) { %>
	<div><%= dan %> x <%= i %> = <%= dan * i %></div>
	<% } %>
	
	<!--  
	
		1. Emmet
			- emmet.io
		2. Tern Project > 자바스크립트 자동완성 > 안 씀 
		
		클라이언트 작업 vs 서버 작업
		- 클라이언트 작업(VS Code) > 서버 작업(Eclipse)
		
	-->
	
	<script>
		
		
		
	</script>
	
	
</body>
</html>





























