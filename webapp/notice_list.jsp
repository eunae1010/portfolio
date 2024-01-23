<%@page import="admin.notice_dto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Date today = new Date();

	List<notice_dto> nd = (List)request.getAttribute("nd");
	int ea = nd.size();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 관리 페이지</title>
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
<main class="maincss" id="noticeList">
	<section>
	    <p>공지사항 관리페이지</p>
	    <div class="subpage_view">
		    <ul>
		        <li><input type="checkbox" v-model="all" @change="agree_all(<%=ea%>)"></li>
		        <li>NO</li>
		        <li>제목</li>
		        <li>글쓴이</li>
		        <li>날짜</li>
		        <li>조회</li>
		    </ul>
	<%
	   	if(ea > 0){
	   		int w = 0;
	   		do{
	   			if(nd.get(w).getNoutput().equals("Y")){
	%>
		    <ol style="background: #ccc;">
		        <li><input type="checkbox" value="t<%=w%>" v-model="a" @change="agree(<%=ea%>,<%=nd.get(w).getNidx()%>,$event)"></li>
		        <li>공지</li>
		        <li @click="notice_view(<%=nd.get(w).getNidx()%>,<%=ea - w%>)" style="cursor:pointer;"><%=nd.get(w).getNsubject()%></li>
		        <li><%=nd.get(w).getNwriter()%></li>
		        <li><%=nd.get(w).getNdate().substring(0,10)%></li>
		        <li><%=nd.get(w).getNhits()%></li>
		    </ol>
	<%
				}
				else{
	%>
	    	<ol>
		        <li><input type="checkbox" value="t<%=w%>" v-model="a" @change="agree(<%=ea%>,<%=nd.get(w).getNidx()%>,$event)"></li>
		        <li><%=ea - w%></li>
		        <li @click="notice_view(<%=nd.get(w).getNidx()%>,<%=ea - w%>)" style="cursor:pointer;"><%=nd.get(w).getNsubject()%></li>
		        <li><%=nd.get(w).getNwriter()%></li>
		        <li><%=nd.get(w).getNdate().substring(0,10)%></li>
		        <li><%=nd.get(w).getNhits()%></li>
		    </ol>
	<%
	   			}
	   			w++;
	   		}while(w < ea);
	   	}
	   	else{
	%>
		    <ol class="none_text">
		        <li>등록된 공지 내용이 없습니다.</li>
		    </ol>
	<%
		}
	%>
	    </div>
	    <div class="board_btn">
	        <button type="button" class="border_del" @click="notice_del()">공지삭제</button>
	        <button type="button" class="border_add" @click="notice_add()">공지등록</button>
	    </div>
	    <div class="border_page">
	        <ul class="pageing">
	            <li><img src="./ico/double_left.svg"></li>
	            <li><img src="./ico/left.svg"></li>
	            <li>1</li>
	            <li><img src="./ico/right.svg"></li>
	            <li><img src="./ico/double_right.svg"></li>
	        </ul>
	    </div>
	</section>
	<section></section>
	<section></section>
</main>
<footer><%@ include file="./admin_footer.jsp" %></footer>
</body>
<script src="./js/notice_list.js?v=<%=today%>"></script>
</html>