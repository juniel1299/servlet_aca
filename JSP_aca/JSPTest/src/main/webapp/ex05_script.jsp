<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 구구단 </h1>

<% 
//자바 영역을 제공

int dan=5;


%>
<% for (int i = 1; i<10; i++){ %>
<div><%= dan %> x <%= i %> = <%= dan * i %></div>
<% } %>
</body>
</html>