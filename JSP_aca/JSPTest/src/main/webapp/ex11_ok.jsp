<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%

	//POST > 한글 인코딩
	request.setCharacterEncoding("UTF-8");
	
	
	//request.getParameter()
	//1. 입력하면 > 입력값 반환
	//2. 입력 안 하면 > ""반환
	//3. 컨트롤키 오류 > null 반환
	String txt1 = request.getParameter("txt1");
	
	System.out.println(txt1 == null);
	System.out.println(txt1 == "");

	
	//암호상자
	String txt2 = request.getParameter("txt2");
	
	//멀티 텍스트
	String txt3 = request.getParameter("txt3");
	txt3 = txt3.replace("\r\n", "<br>");
	
	//체크 박스
	//1. value 작성X
	//- 체크O > 'on' 전송
	//- 체크X > null 전송
	
	//2. value 작성O
	//- 체크O > value 값 전송
	//- 체크X > null 전송
	String cb1 = request.getParameter("cb1");
	
	//체크 박스들
	String cb2 = request.getParameter("cb2");
	String cb3 = request.getParameter("cb3");
	String cb4 = request.getParameter("cb4");
	
	// 체크 박스가 너무 많아질 때
	String[] cb5 = request.getParameterValues("cb5");
	
	String temp = "";
	
	temp += cb2 + ",";
	temp += cb3 + ",";
	temp += cb4 +",";
	
	//라디오 버튼
	//하나만 고를 수 있으므로 rb로 한로 맞춰둠 
	String rb = request.getParameter("rb");
	
	//셀렉트 박스
	String sel1 = request.getParameter("sel1");
	
	//다중 셀렉트 박스
	String[] sel2 = request.getParameterValues("sel2");
	
	//히든 태그  (눈에 안 보이는 텍스트 박스)
	String id = request.getParameter("id");
	
	//날짜 
	String regdate = request.getParameter("regdate");
	
	//색상
	String color = request.getParameter("color");
	
	String left = request.getParameter("left");
	String top = request.getParameter("top");
	
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
<h1>결과</h1>

<h2>텍스트 박스</h2>

<div><%= txt1 %></div>

<h2>암호 박스</h2>

<div><%= txt2 %></div>

<h2>멀티 텍스트</h2>

<div><%= txt3 %></div>

<h2>체크 박스</h2>
<div><%= cb1 %></div>

<h3> 체크 박스들</h3>
<div><%= temp %></div>

<h3>체크 박스가 너무 많아질 때</h3>
<div><%= Arrays.toString(cb5)%></div>

<h3>라디오 버튼</h3>
<div><%= rb %></div>

<h3> 셀렉트 박스</h3>
<div><%= sel1 %></div>

<h3> 다중 셀렉트 박스</h3>
<div> <%= Arrays.toString(sel2) %></div>

<h3>히든 태그 </h3>
<div><%= id %></div>

<h3>날 짜</h3>
<div><%= regdate %></div>

<h3>색상</h3>
<div style="background-color : <%= color%>;"><%= color %></div>

<h3>고양이</h3>
<div> <%= left %>, <%= top %></div>


<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>

</script>
</body>
</html>