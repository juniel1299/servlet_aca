<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<!-- ex24_cookie.jsp -->
	<h1>쿠키 <small>Cookie</small></h1>
	
	<div>
		<input type="button" value="쿠키에 데이터 저장하기" id="btn1">
		<input type="button" value="쿠키의 데이터 읽기" id="btn2">
	</div>
	
	<div>
		<a href="ex24_cookie_1.jsp"> 이동하기</a>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="/jsp/js/cookie.js"></script>
	<script>
	
		$('#btn1').click(function() {
			//쿠키 쓰기
			//console.log(document.cookie);
			//console.log(typeof document.cookie);
			//document.cookie = '홍길동';
			
			
			//document.cookie = "name=홍길동&kor=100&eng=90&math=80";
			setCookie('name','홍길동');
			setCookie('kor','100');
			setCookie('eng','90');
			setCookie('math','80');
		});
		
		$('#btn2').click(function() {
			//console.log(document.cookie);
			//console.log(document.cookie);
			console.log(getCookie('name'));
			console.log(getCookie('kor'));
			console.log(getCookie('eng'));
			console.log(getCookie('math'));
		});
	
	</script>
</body>
</html>










