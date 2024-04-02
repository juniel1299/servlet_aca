<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
	request.setCharacterEncoding("UTF-8");
	

	String width = request.getParameter("width");
	String height = request.getParameter("height");
	String color = request.getParameter("color");
	String txt1 = request.getParameter("txt1");
	String num = request.getParameter("num");
	
    

	int temp = 0;
	
	for(int i=1; i<Integer.parseInt(num); i++){
		temp+=1;
	}
    
    
    
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



<div name = temp>

<div style="width: <%= width %>; height: <%= height %>; border: 1px solid black; background-color: <%= color%>; margin: 10px;"> <%= txt1 %></div><div style="height : <%= height %>;">
</div>
</div>
<!---->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>

</script>
</body>
</html>