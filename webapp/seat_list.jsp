<%@page import="java.util.ArrayList"%>
<%@page import="admin.air_dto"%>
<%@page import="java.util.List"%>
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
    <link rel="stylesheet" type="text/css" href="./css/seat.css?v=<%=today%>">
    <link rel="icon" href="./img/logo.png" sizes="128x128">
    <link rel="icon" href="./img/logo.png" sizes="64x64">
    <link rel="icon" href="./img/logo.png" sizes="32x32">
    <link rel="icon" href="./img/logo.png" sizes="16x16">
    <script src="./js/jquery.js"></script>
</head>
<body>
<header><%@ include file="./admin_header.jsp" %></header>
<nav><%@ include file="./admin_menu.jsp" %></nav>
<main class="maincss" id="seatList">
	{{search_part}}
	<section>
	    <p>좌석 및 예약설정</p>
		<div class="subpage_view">
		    <span><b style="cursor: pointer;" @click="no()">미설정 항공코드 ${ea}건</b> | 설정 완료 항공코드 ${ea2}건</span>
		    <span>
		        <form id="f" @submit="gosearch">
			        <select name="part" class="p_select1" v-model="part">
			            <option value="1">출발지</option>
			            <option value="2">도착지</option>
			        </select>
			        <input type="text" name="search" class="p_input1" placeholder="검색할 단어를 입력하세요" v-model="search">
			        <input type="submit" value="검색" title="항공검색" class="p_submit">
		        </form>
		    </span>
		</div>
		<form id="f2">
			<div class="subseat_view2">
			    <ul>
			        <li>공항코드</li>
			        <li>항공사명</li>
			        <li>항공코드</li>
			        <li>항공편명</li>
			        <li>출발지</li>
			        <li>도착지</li>
			        <li>좌석형태</li>
			        <li>좌석수</li>
			        <li>예약 시작일</li>
			        <li>예약 종료일</li>
			        <li>1인 금액</li>
			    </ul>
			    <app:if test="${search != null}">
			    <app:forEach var="tlist" items="${ad}">
				<input type="hidden" name="lidx" value="${tlist.getLidx()}">
				<input type="hidden" name="pidx" value="${tlist.getPidx()}">
			    <ul>
			        <li>${tlist.getAirplane()}</li>
			        <li style="text-align: left; text-indent: 3px;">${tlist.getAirname()}</li>
			        <li style="text-align: left; text-indent: 3px;">${tlist.getAircode()}</li>
			        <li style="text-align: left; text-indent: 3px;">${tlist.getAirflight()}</li>
			        <li>${tlist.getStart_point()}</li>
			        <li>${tlist.getEnd_point()}</li>
			        <li>${tlist.getSeat_text()}</li>
			        <li>${tlist.getSeat()}</li>
			        <li><input type="date" name="lstart" class="days" v-model="data1"></li>
			        <li><input type="date" name="lend" class="days" v-model="data2"></li>
			        <li><input type="text" name="lprice" class="moneys" maxlength="8" v-model="data3"></li>
			    </ul>
			    </app:forEach>
			    </app:if>
			    <app:if test="${search == null || ea == 0 || ad_ea == 0}">
			    <ul>
			        <li style="width: 100%;">검색된 항공편이 없습니다.</li>
			    </ul>
			    </app:if>
			</div>
			<div class="subpage_view4">
			    <span style="text-align: right;">
			    <input type="button" value="등록완료" title="등록완료" class="p_button p_button_color2" @click="seat_register()">
			    </span>
			</div>
		</form>
	</section>
</main>
<footer><%@ include file="./admin_footer.jsp" %></footer>
</body>
<script src="./js/seat_list.js?v=<%=today%>"></script>
</html>