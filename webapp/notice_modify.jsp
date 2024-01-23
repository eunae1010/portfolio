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
    <title>공지사항 수정 페이지</title>
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
<main class="maincss" id="noticeModify">
	{{n_output}}
    <section>
	    <p>공지사항 수정 페이지</p>
    	<form id="f">
    		<input type="hidden" name="nidx" value="${al.get(0)}">
	        <div class="write_view">
		        <ul>
		            <li>공지번호</li>
		            <li>${al.get(0)}번째 공지글</li>
		        </ul>
		        <ul>
		            <li>공지사항 여부</li>
		            <li>
		                <label class="label_notice"><em class="cbox"><input type="checkbox" name="noutput" value="${al.get(1)}" v-model="output"></em> 공지 출력</label> ※ 공지출력을 체크할 시 해당 글 내용은 최상단에 노출 되어 집니다.
		            </li>
		        </ul>
		        <ul>
		            <li>공지사항 제목</li>
		            <li>
		                <input type="text" name="nsubject" value="${al.get(2)}" class="notice_input1" maxlength="150"> ※ 최대 150자까지 입력이 가능
		            </li>
		        </ul>
		        <ul>
		            <li>글쓴이</li>
		            <li>
		                <input type="text" name="nwriter" value="${al.get(3)}" class="notice_input2" readonly>      
		            </li>
		        </ul>
		        <ul>
		            <li>첨부파일</li>
		            <li v-if="attach != ''">
		            	<input type="file" name="userfile">
		                <em class="fileview" style="font-size:12px;">기존 첨부 파일명 : ${al.get(4)} </em>
		                <input type="button" value="삭제" style="width:30px;" @click="file_del('${al.get(0)}','${al.get(4)}')">
		            </li>
		            <li v-else-if="attach == ''">
		                <input type="file" name="userfile">
		            </li>
		        </ul>
		        <ul class="ul_height">
		            <li>공지내용</li>
		            <li>
		                <textarea class="notice_input3" name="ntext" id="boardtext">${al.get(5)}</textarea>
		            </li>
		        </ul>
	        </div>
	        <div class="board_btn">
	            <button type="button" class="border_list" @click="notice_list()">공지목록</button>
	            <button type="button" class="border_modify" @click="notice_modify()">공지수정 완료</button>
	        </div>
    	</form>
    </section>
    <section></section>
    <section></section>
</main>
<footer><%@ include file="./admin_footer.jsp" %></footer>
</body>
<script>
var filenm = "${al.get(4)}";
</script>
<script src="./js/notice_modify.js?v=<%=today%>"></script>
</html>