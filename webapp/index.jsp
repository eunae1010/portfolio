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
    <title>관리자 페이지</title>
	<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
    <link rel="stylesheet" type="text/css" href="./css/basic.css">
    <link rel="stylesheet" type="text/css" href="./css/mainlogin.css?v=<%=today%>">
    <link rel="icon" href="./img/logo.png" sizes="128x128">
    <link rel="icon" href="./img/logo.png" sizes="64x64">
    <link rel="icon" href="./img/logo.png" sizes="32x32">
    <link rel="icon" href="./img/logo.png" sizes="16x16">
</head>
<body class="bodycss">
    <header class="admin_title">
        <p><img src="./img/logo.png" class="logo_sm"> ADMINISTRATOR</p>
    </header>
    <section class="admin_bgcolor" id="admin">
    	<form id="f">
	        <div class="admin_login">
	            <span>
	                <div class="left_div">
		                <ul>
			                <li><input type="text" :name="data1" class="input_text1" placeholder="관리자 아이디를 입력하세요"></li>
			                <li><input type="password" :name="data2" class="input_text1" placeholder="관리자 패스워드를 입력하세요"></li>
		                </ul>
	                </div>
		                <div class="right_div">
		                    <button type="submit" class="btn_submit" title="MASTER LOGIN" @click="login()">MASTER LOGIN</button>
		                </div>
	                <em class="alert_msg">※ 본 사이트는 관리자 외에는 접근을 금합니다. 페이지 접근에 대한 접속 정보는 모두 기록 됩니다.</em>
	                <em class="alert_msg">ID : admin / PW : ss1234</em>
	            </span>
	            <span>
	                <ol class="admin_info">
	                    <li title="신규 관리자 등록요청" @click="add()">신규 관리자 등록요청</li>
	                    <li title="아이디/패스워드 찾기" @click="search()">아이디/패스워드 찾기</li>
	                </ol>                
	            </span>
	        </div>
    	</form>
    </section>
    <footer class="admin_copy_login">
        <div>
            Copyright ⓒ 2024 webshopping All rights reserved.
        </div>
    </footer>
</body>
<script src="./js/index.js?v=<%=today%>"></script>
</html>