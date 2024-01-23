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
    <title>항공사 및 번호 등록</title>
   	<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
    <link rel="stylesheet" type="text/css" href="./css/basic.css?v=<%=today%>">
    <link rel="stylesheet" type="text/css" href="./css/login.css?v=<%=today%>">
    <link rel="stylesheet" type="text/css" href="./css/main.css?v=<%=today%>">
    <link rel="stylesheet" type="text/css" href="./css/category.css?v=<%=today%>">
    <link rel="icon" href="./img/logo.png" sizes="128x128">
    <link rel="icon" href="./img/logo.png" sizes="64x64">
    <link rel="icon" href="./img/logo.png" sizes="32x32">
    <link rel="icon" href="./img/logo.png" sizes="16x16">
    <script src="./js/jquery.js"></script>
</head>
<body>
<header><%@ include file="./admin_header.jsp" %></header>
<nav><%@ include file="./admin_menu.jsp" %></nav>
<main class="maincss" id="airLIst">
	{{search_part}}
	<section style="height: auto;">
	    <p>항공 코드 관리 페이지</p>
	    <div class="subpage_view">
	        <span>등록된 항공 코드 ${ea}건</span>
	        <span>
	            <form id="f" @submit="gosearch">
		            <select name="part" class="p_select1" v-model="part">
		                <option value="1">항공사명</option>
		                <option value="2">항공코드</option>
		            </select>
		            <input type="text" name="search" class="p_input1" placeholder="검색어를 입력해 주세요" v-model="search">
		            <input type="submit" value="검색" title="검색" class="p_submit">
	            </form>
	        </span>
	    </div>
	    <div class="subpage_view2">
	        <ul>
	            <li><input type="checkbox" v-model="all" @change="agree_all(${ea})"></li>
	            <li>공항코드</li>
	            <li>항공사명</li>
	            <li>항공코드</li>
	            <li>항공편명</li>
	            <li>사용 유/무</li>
	            <li>관리</li>
	        </ul>
		    <app:if test="${ea > 0}">
		    <app:forEach var="alist" items="${ad}" varStatus="no">
	        <ul>
	            <li><input type="checkbox" value="t${fn:length(ad) - no.count}" v-model="a" @change="agree(${ea})"></li>
	            <li style="text-align: left; text-indent: 5px;">${alist.getAirplane()}</li>
	            <li style="text-align: left; text-indent: 5px;">${alist.getAirname()}</li>
	            <li style="text-align: left; text-indent: 5px;">${alist.getAircode()}</li>
	            <li style="text-align: left; text-indent: 5px;">${alist.getAirflight()}</li>
	            <li>
	            	<app:if test="${alist.getAiruse() == 'Y'}">사용함</app:if>
	            	<app:if test="${alist.getAiruse() == 'N'}">중지</app:if>
	            </li>
	            <li style="cursor: pointer;" @click="air_modify(${alist.getAiridx()})">[수정]</li>
	        </ul>
		    </app:forEach>
		    </app:if>
		    <app:if test="${ea == 0}">
	        <ul>
	            <li style="width: 100%;">등록된 항공코드가 없습니다.</li>
	        </ul>
		    </app:if>
	    </div>
	    <div class="subpage_view3">
	        <ul class="pageing">
	            <li><img src="./ico/double_left.svg"></li>
	            <li><img src="./ico/left.svg"></li>
	            <li>1</li>
	            <li><img src="./ico/right.svg"></li>
	            <li><img src="./ico/double_right.svg"></li>
	        </ul>
	    </div>
	    <div class="subpage_view4">
	        <input type="button" value="공항코드 삭제" title="공항코드 삭제" class="p_button" @click="air_del()">
	        <span style="float: right;">
		        <input type="button" value="항공편 리스트" title="항공편 리스트" class="p_button p_button_color1" @click="product_list()">
		        <input type="button" value="항공코드 등록" title="항공코드 등록" class="p_button p_button_color2" @click="newcode()">
	        </span>
	    </div>
	</section>
</main>
<footer><%@ include file="./admin_footer.jsp" %></footer>
</body>
<script src="./js/air_list.js?v=<%=today%>"></script>
</html>