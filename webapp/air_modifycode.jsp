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
<main class="maincss" id="airModifyCode">
	<section>
	    <p>항공 코드 수정 페이지</p>
    	<form id="f">
    		<input type="hidden" name="airidx" value="${modify.get(0)}">
    		<input type="hidden" v-model="code">
		    <div class="cate_insert">
		        <ul>
		            <li>공항코드</li>
		            <li><input type="text" name="airplane" value="${modify.get(1)}" class="cate_input1" style="margin-right: 10px;"></li>
		            <li>※ 공항코드는 무조건 대문자로 입력 되도록 합니다.</li>
		        </ul>
		        <ul>
		            <li>항공사명</li>
		            <li><input type="text" name="airname" value="${modify.get(2)}" class="cate_input3" style="margin-right: 10px;"></li>
		            <li>※ 항공사명은 특수문자는 입력 되지 않습니다.</li>
		        </ul>
		        <ul>
		            <li>항공코드</li>
		            <li><input type="text" name="aircode" value="${modify.get(3)}" class="cate_input3" style="margin-right: 10px;"> <input type="button" value="중복확인" title="중복확인" class="product_btn" @click="codeck()"></li>
		            <li>※ 항공코드는 중복 입력이 되지 않습니다.</li>
		        </ul>
		        <ul>
		            <li>항공편명</li>
		            <li>
		                <input type="text" name="airflight" value="${modify.get(4)}" class="cate_input3" list="lg_menu">
		            </li>
		            <li>※ 예시) Korean Air, Jeju Air, Air Busan |&nbsp;&nbsp;<a href="https://www.airportal.go.kr/knowledge/airlines/KgAirline01.jsp?area=name" target="_blank" style="color: red;">예시 사이트</a></li>
		        </ul>
		        <ul>
		            <li>사용 유/무</li>
		            <li>
		                <label class="rmargin"><input type="radio" name="airuse" value="Y" checked>사용함 </label>
		                <label class="rmargin"><input type="radio" name="airuse" value="N">사용안함</label>
		            </li>
		            <li>※ 사용안함으로 선택하게 되면 항공편 등록시 해당 항공코드가 출력 되지 않습니다.</li>
		        </ul>
		    </div>
		    <div class="subpage_view4" style="text-align:center;">
		        <input type="button" value="수정완료" title="수정완료" class="p_button p_button_color2" style="margin-right: 5px;" @click="air_modify()">
		        <input type="button" value="항공 코드 리스트" title="항공 코드 리스트" class="p_button p_button_color1" style="margin-right: 5px;" @click="air_list()">
		        <input type="button" value="항공 코드 삭제" title="항공 코드 삭제" class="p_button p_button_color3" @click="code_del(${modify.get(0)})">
		    </div>
		</form>
	</section>
</main>
<footer><%@ include file="./admin_footer.jsp" %></footer>
</body>
<script src="./js/air_modifycode.js?v=<%=today%>"></script>
</html>