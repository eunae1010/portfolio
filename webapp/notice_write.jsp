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
    <title>공지사항 등록 페이지</title>
	<script src="./ckeditor/ckeditor.js"></script>
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
<main class="maincss" id="noticeWrite">
   	<section>
	    <p>공지사항 등록페이지</p>
   		<form id="f">
	        <div class="write_view">
		        <ul>
		            <li>공지사항 여부</li>
		            <li>
		                <label class="label_notice"><em class="cbox"><input type="checkbox" name="noutput"></em> 공지 출력</label> ※ 공지출력을 체크할 시 해당 글 내용은 최상단에 노출 되어 집니다.
		            </li>
		        </ul>
		        <ul>
		            <li>공지사항 제목</li>
		            <li>
		                <input type="text" name="nsubject" class="notice_input1" maxlength="150" v-model="data1"> ※ 최대 150자까지 입력이 가능
		            </li>
		        </ul>
		        <ul>
		            <li>글쓴이</li>
		            <li>
		                <input type="text" name="nwriter" value="<%=aname%>" class="notice_input2" readonly> ※ 관리자 이름이 노출 됩니다.
		            </li>
		        </ul>
		        <ul>
		            <li>첨부파일</li>
		            <li>
		                <input type="file" name="userfile"> ※ 첨부파일 최대 용량은 2MB 입니다.       
		            </li>
		        </ul>
		        <ul class="ul_height">
		            <li>공지내용</li>
		            <li>
		                <textarea class="notice_input3" name="ntext" placeholder="공지내용을 입력하세요!" id="boardtext"></textarea>
		            </li>
		        </ul>
	        </div>
	        <div class="board_btn">
	            <button type="button" class="border_del" @click="notice_list()">공지목록</button>
	            <button type="button" class="border_add" @click="notice_write()">공지등록</button>
	        </div>
	   	</form>
   	</section>
    <section></section>
    <section></section>
</main>
<footer><%@ include file="./admin_footer.jsp" %></footer>
</body>
<script src="./js/notice_write.js?v=<%=today%>"></script>
</html>