<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Date today = new Date();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 VIEW 페이지</title>
   	<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
    <link rel="stylesheet" type="text/css" href="./css/basic.css?v=<%=today%>">
    <link rel="stylesheet" type="text/css" href="./css/login.css?v=<%=today%>">
    <link rel="stylesheet" type="text/css" href="./css/main.css?v=<%=today%>">
    <link rel="stylesheet" type="text/css" href="./css/notice.css?v=<%=today%>">
    <link rel="icon" href="./img/logo.png" sizes="128x128">
    <link rel="icon" href="./img/logo.png" sizes="64x64">
    <link rel="icon" href="./img/logo.png" sizes="32x32">
    <link rel="icon" href="./img/logo.png" sizes="16x16">
    <script src="./js/jquery.js"></script>
</head>
<body>
<header><%@ include file="./admin_header.jsp" %></header>
<nav><%@ include file="./admin_menu.jsp" %></nav>
<main class="maincss" id="noticeView">
	{{n_output}}
    <section>
	    <p>공지사항 VIEW 페이지</p>
    	<form id="f">
	        <div class="write_view">
		        <ul>
		            <li>공지번호</li>
		            <li>${num}번째 공지글</li>
		        </ul>
		        <ul>
		            <li>공지사항 여부</li>
		            <li>
		                <label class="label_notice"><em class="cbox"><input type="checkbox" name="noutput" value="${al.get(1)}" disabled="disabled" v-model="output"></em> 공지 출력</label>
		            </li>
		        </ul>
		        <ul>
		            <li>공지사항 제목</li>
		            <li>${al.get(2)}</li>
		        </ul>
		        <ul>
		            <li>글쓴이</li>
		            <li>${al.get(3)}</li>
		        </ul>
		        <ul>
		            <li>첨부파일</li>
		            <li><a href="http://cea1010.cdn1.cafe24.com/${al.get(4)}">${al.get(4)}</a></li>
		        </ul>
		        <ul class="ul_height">
		            <li>공지내용</li>
		            <li>
		                <div class="notice_input3" style="overflow:hidden; overflow-y: auto;">${al.get(5)}</div>
		            </li>
		        </ul>
	        </div>
	        <div class="board_btn">
	            <button type="button" class="border_list" @click="notice_list()">공지목록</button>
	            <button type="button" class="border_modify" @click="notice_modify()">공지수정</button>
	            <button type="button" class="border_del" @click="notice_del('${al.get(0)}','${al.get(4)}')">공지삭제</button>
	        </div>
    	</form>
    </section>
    <section></section>
    <section></section>
</main>
<footer><%@ include file="./admin_footer.jsp" %></footer>
</body>
<script src="./js/notice_view.js?v=<%=today%>"></script>
</html>