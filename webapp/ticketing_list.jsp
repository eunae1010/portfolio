<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="app" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" type="text/css" href="./css/ticketing.css?v=<%=today%>">
    <link rel="icon" href="./img/logo.png" sizes="128x128">
    <link rel="icon" href="./img/logo.png" sizes="64x64">
    <link rel="icon" href="./img/logo.png" sizes="32x32">
    <link rel="icon" href="./img/logo.png" sizes="16x16">
    <script src="./js/jquery.js"></script>
</head>
<body>
<header><%@ include file="./admin_header.jsp" %></header>
<nav><%@ include file="./admin_menu.jsp" %></nav>
<main class="maincss" id="ticketingList">
	{{search_part}}
	<section>
	    <p>예매 리스트</p>
		<div class="subpage_view">
		    <span>
		        <form id="f" @submit="gosearch">
			        <select name="part" class="p_select1" v-model="part">
			            <option value="1">고객명</option>
			            <option value="2">연락처</option>
			        </select>
			        <input type="text" name="search" class="p_input1" placeholder="검색할 단어를 입력하세요" v-model="search">
			        <input type="submit" value="검색" title="예매 정보 검색" class="p_submit">
		        </form>
		    </span>
		</div>
		<div class="subtick_view2">
		    <ul>
		        <li></li>
		        <li>공항코드</li>
		        <li>항공사명</li>
		        <li>항공코드</li>
		        <li>출발지</li>
		        <li>도착지</li>
		        <li>좌석형태</li>
		        <li>고객명</li>
		        <li>연락처</li>
		        <li>예약일</li>
		        <li>인원수</li>
		        <li>결제금액</li>
		    </ul>
		    <app:if test="${search != null}">
		    <app:forEach var="tlist" items="${ad}">
		    <ul>
		        <li><input type="radio" value="${tlist.getPidx()}" @click="ck(${tlist.getPidx()})"></li>
		        <li>${tlist.getAirplane()}</li>
		        <li style="text-align: left; text-indent: 3px;">${tlist.getAirname()}</li>
		        <li>${tlist.getAircode()}</li>
		        <li>${tlist.getStart_point()}</li>
		        <li>${tlist.getEnd_point()}</li>
		        <li>${tlist.getSeat_text()}</li>
		        <li>${tlist.getTname()}</li>
		        <li>${tlist.getTel()}</li>
		        <li>${tlist.getTreserve()}</li>
		        <li>${tlist.getTea()}인</li>
		        <li><fmt:formatNumber value="${tlist.getTprice()}" pattern="#,###원"/></li>
		    </ul>
		    </app:forEach>
		    </app:if>
		    <app:if test="${ea == 0 || search == null}">
		    <ul>
		        <li style="width: 100%;">예매 하신 사용자 또는 검색하신 내용이 없습니다.</li>
		    </ul>
		    </app:if>
		</div>
		<div class="subpage_view4">
		    <span style="text-align: right;">
		    	<input type="button" value="예매취소" title="예매취소" class="p_button p_button_color2" @click="ticketing_cancel()">
		    </span>
		</div>
	</section>
</main>
<footer><%@ include file="./admin_footer.jsp" %></footer>
</body>
<script src="./js/ticketing_list.js?v=<%=today%>"></script>
</html>