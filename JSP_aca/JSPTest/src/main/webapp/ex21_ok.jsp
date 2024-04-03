<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	String path = application.getRealPath("/pic");
	int size = 1024 * 1024 * 100;

	String filename = "";
	//String orgfilename = ""; //이미지 자운을 할 필요가 없어서 안 씀 . 
	
	try{
		
		MultipartRequest multi = new MultipartRequest(
									request,
									path,
									size,
									"UTF-8",
									new DefaultFileRenamePolicy()
									);
		
	}catch(Exception e){
		
	}
	
	response.sendRedirect("ex21.jsp");
	
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
<!---->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>

</script>
</body>
</html>