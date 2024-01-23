<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="app" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	Date today = new Date();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>항공공사 및 번호 등록</title>
	<script src="./ckeditor/ckeditor.js"></script>
   	<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
	<link rel="stylesheet" type="text/css" href="./css/basic.css?v=<%=today%>">
	<link rel="stylesheet" type="text/css" href="./css/login.css?v=<%=today%>">
	<link rel="stylesheet" type="text/css" href="./css/main.css?v=<%=today%>">
	<link rel="stylesheet" type="text/css" href="./css/faq.css?v=<%=today%>">
	<link rel="icon" href="./img/logo.png" sizes="128x128">
	<link rel="icon" href="./img/logo.png" sizes="64x64">
	<link rel="icon" href="./img/logo.png" sizes="32x32">
	<link rel="icon" href="./img/logo.png" sizes="16x16">
</head>
<body>
<header><%@ include file="./admin_header.jsp" %></header>
<nav><%@ include file="./admin_menu.jsp" %></nav>
<!-- FAQ 등록 시작 -->
<main class="maincss" id="faqWrite">
	<section class="page_section">
		<p>FAQ 관리등록</p>
		<div class="listbody">
			<div class="procho">
				<form id="f">
					<section class="data_listsview">
						<ol>
							<li>질문 제목</li>
							<li><input type="text" name="fsubject" class="notice_in in1" v-model="data1"></li>
							<li>글쓴이</li>
							<li><input type="text" name="fwriter" value="<%=aname%>" class="notice_in in2" readonly></li>
							<li style="height:520px;">질문 내용</li>
							<li style="height:520px; padding-top: 10px; padding-left: 10px;">
								<textarea class="notice_in in3" name="ftext" id="boardtext"></textarea>
							</li>      
						</ol>
						<span class="notice_btns">
							<input type="button" value="FAQ 등록" class="meno_btn2" @click="faq_write()">
						</span>
					</section>
				</form>
		   </div>
		</div> 
	</section>
</main>
<!-- FAQ 등록 끝 -->
<footer><%@ include file="./admin_footer.jsp" %></footer>
</body>
<script src="./js/faq_write.js?v=<%=today%>"></script>
</html>