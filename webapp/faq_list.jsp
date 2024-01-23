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
<!-- FAQ 리스트 시작 -->
<main class="maincss" id="faqList">
	<section class="page_section">
		<p>FAQ 관리페이지</p>
		<div class="listbody">
		    <div class="procho">
	       		<form id="f" @submit="gosearch">
			       	<section class="search_part">
				        <ol>
					        <li>FAQ 모든 내용 검색</li>
					        <li>
						        <input type="text" name="search" class="search_input" v-model="search">
						        <input type="submit" value="검색" title="검색" class="datebtn">
					        </li>        
					        <li></li>
					        <li></li> 
				        </ol>
			       	</section> 
		       	</form>
		       	<section class="data_listsview2">
			       	<ul>
				        <li>QA</li>
				        <li>질문/답변</li>
				        <li>글쓴이</li>
				        <li>등록일</li>
				        <li>삭제</li>
			       	</ul>
			<!-- FAQ 샘플 HTML 코드 시작 -->
					<app:if test="${ea > 0}">
		    		<app:forEach var="flist" items="${fd}">
				    <ul>
				        <li>Q</li>
				        <li style="text-align: left; justify-content: flex-start;" @click="faq_view(${flist.getFidx()})">${flist.getFsubject()}</li>
				        <li>${flist.getFwriter()}</li>
				        <li>${fn:substring(flist.getFdate(),0,10)}</li>
				        <li><input type="button" value="삭제" class="delbtn" @click="faq_del(${flist.getFidx()})"></li>
				    </ul>
		    		</app:forEach>
					</app:if>     
			<!-- FAQ 샘플 HTML 코드 끝 -->
					<app:if test="${ea == 0}">
			       	<ul class="nodatas">
			        	<li>등록된 FAQ 내용 없습니다.</li>
					</ul>
					</app:if>
					<span class="notice_btns"><input type="button" value="FAQ 등록" class="meno_btn2" @click="faq_add()"></span>
					<aside>
						<div class="subpage_view3">
				            <ul class="pageing">
				                <li><img src="./ico/double_left.svg"></li>
				                <li><img src="./ico/left.svg"></li>
				                <li>1</li>
				                <li><img src="./ico/right.svg"></li>
				                <li><img src="./ico/double_right.svg"></li>
				            </ul>
				        </div>
			       </aside>
		       </section>
		    </div>
		</div> 
	</section>
</main>
<!-- FAQ 리스트 끝 -->
<footer><%@ include file="./admin_footer.jsp" %></footer>
</body>
<script src="./js/faq_list.js?v=<%=today%>"></script>
</html>