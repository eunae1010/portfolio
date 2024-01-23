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
    <title>사이트 환경설정</title>
   	<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
    <link rel="stylesheet" type="text/css" href="./css/basic.css?v=<%=today%>">
    <link rel="stylesheet" type="text/css" href="./css/login.css?v=<%=today%>">
    <link rel="stylesheet" type="text/css" href="./css/main.css?v=<%=today%>">
    <link rel="stylesheet" type="text/css" href="./css/subpage.css?v=<%=today%>">
    <link rel="icon" href="./img/logo.png" sizes="128x128">
    <link rel="icon" href="./img/logo.png" sizes="64x64">
    <link rel="icon" href="./img/logo.png" sizes="32x32">
    <link rel="icon" href="./img/logo.png" sizes="16x16">
    <script src="./js/jquery.js"></script>
</head>
<body>
<header><%@ include file="./admin_header.jsp" %></header>
<nav><%@ include file="./admin_menu.jsp" %></nav>
<form id="f">
<main class="maincss" id="siteinfo">
	<section>
	    <p>홈페이지 가입환경 설정</p>
	    <app:if test="${ea == 0}">
		<div class="subpage_view">
			<ul class="info_form">
			    <li>홈페이지 제목</li>
			    <li>
			        <input type="text" :name="data1" class="in_form1"> 
			    </li>
			</ul>    
			<ul class="info_form">
			    <li>관리자 메일 주소</li>
			    <li>
			        <input type="text" :name="data2" class="in_form2"> ※ 관리자가 보내고 받는 용도로 사용하는 메일 주소를 입력합니다.(회원가입,인증메일,회원메일발송 등에서 사용)
			    </li>
			</ul> 
			<ul class="info_form">
			    <li>포인트 사용 유/무</li>
			    <li class="checkcss">
			        <em><label><input type="radio" :name="data3" value="Y" class="ckclass">포인트 사용</label></em> 
			        <em><label><input type="radio" :name="data3" value="N" class="ckclass" checked>포인트 미사용</label></em>
			    </li>
			</ul>
			<ul class="info_form2" style="border-bottom:1px solid rgb(81, 61, 61);">
			    <li>회원가입시 적립금</li>
			    <li>
			        <input type="text" :name="data4" class="in_form3" maxlength="5"> 점
			    </li>
			    <li>회원가입시 권한레벨</li>
			    <li>
			        <input type="text" :name="data5" value="1" class="in_form3" maxlength="1"> 레벨
			    </li>
			</ul> 
		</div>
		<p>홈페이지 기본환경 설정</p>
		<div class="subpage_view">
			<ul class="info_form2">
			    <li>회사명</li>
			    <li>
			        <input type="text" :name="data6" class="in_form0"> 
			    </li>
			    <li>사업자등록번호</li>
			    <li>
			        <input type="text" :name="data7" class="in_form0" maxlength="10"> 
			    </li>
			</ul> 
			<ul class="info_form2">
			    <li>대표자명</li>
			    <li>
			        <input type="text" :name="data8" class="in_form0"> 
			    </li>
			    <li>대표전화번호</li>
			    <li>
			        <input type="text" :name="data9" class="in_form0" maxlength="11"> 
			    </li>
			</ul>
			<ul class="info_form2">
			    <li>통신판매업 신고번호</li>
			    <li>
			        <input type="text" :name="data10" class="in_form0"> 
			    </li>
			    <li>부가통신 사업자번호</li>
			    <li>
			        <input type="text" :name="data11" class="in_form0"> 
			    </li>
			</ul>
			<ul class="info_form2">
			    <li>사업장 우편번호</li>
			    <li>
			        <input type="text" :name="data12" class="in_form0" maxlength="5"> 
			    </li>
			    <li>사업장 주소</li>
			    <li>
			        <input type="text" :name="data13" class="in_form2"> 
			    </li>
			</ul>
			<ul class="info_form2" style="border-bottom:1px solid rgb(81, 61, 61);">
			    <li>정보관리책임자명</li>
			    <li>
			        <input type="text" :name="data14" class="in_form0"> 
			    </li>
			    <li>정보책임자 E-mail</li>
			    <li>
			        <input type="text" :name="data15" class="in_form1"> 
			    </li>
			</ul>
		</div>
		<p>결제 기본환경 설정</p>
		<div class="subpage_view">  
			<ul class="info_form2">
			    <li>무통장 은행</li>
			    <li>
			        <input type="text" :name="data16" class="in_form0"> 
			    </li>
			    <li>은행계좌번호</li>
			    <li>
			        <input type="text" :name="data17" class="in_form1"> 
			    </li>
			</ul>
			<ul class="info_form">
			    <li>신용카드 결제 사용</li>
			    <li class="checkcss">
			        <em><label><input type="radio" :name="data18" value="Y" class="ckclass"> 사용</label></em> 
			        <em><label><input type="radio" :name="data18" value="N" class="ckclass" checked> 미사용</label></em> ※ 해당 PG사가 있을 경우 사용으로 변경합니다.
			    </li>
			</ul>
			<ul class="info_form">
			    <li>휴대폰 결제 사용</li>
			    <li class="checkcss">
			        <em><label><input type="radio" :name="data19" value="Y" class="ckclass"> 사용</label></em> 
			        <em><label><input type="radio" :name="data19" value="N" class="ckclass" checked> 미사용</label></em> ※ 주문시 휴대폰 결제를 가능하게 할 것인지를 설정합니다.
			    </li>
			</ul>
			<ul class="info_form">
			    <li>도서상품권 결제사용</li>
			    <li class="checkcss">
			        <em><label><input type="radio" :name="data20" value="Y" class="ckclass"> 사용</label></em> 
			        <em><label><input type="radio" :name="data20" value="N" class="ckclass" checked> 미사용</label></em> ※ 도서상품권 결제만 적용이 되며, 그 외에 상품권은 결제 되지 않습니다.
			    </li>
			</ul>
			<ul class="info_form2">
			    <li>결제 최소 포인트</li>
			    <li>
			        <input type="text" :name="data21" class="in_form0" maxlength="5"> 점
			    </li>
			    <li>결제 최대 포인트</li>
			    <li>
			        <input type="text" :name="data22" class="in_form0" maxlength="5"> 점
			    </li>
			</ul>
			<ul class="info_form" style="border-bottom:1px solid rgb(81, 61, 61);">
			    <li>현금 영수증 발급사용</li>
			    <li class="checkcss">
			        <em><label><input type="radio" :name="data23" value="Y" class="ckclass"> 사용</label></em> 
			        <em><label><input type="radio" :name="data23" value="N" class="ckclass" checked> 미사용</label></em> ※ 현금영수증 관련 사항은 PG사 가입이 되었을 경우 사용가능 합니다.
			    </li>
			</ul>
		</div>
		</app:if>
		<app:if test="${ea > 0}">
		<div class="subpage_view">
			<ul class="info_form">
			    <li>홈페이지 제목</li>
			    <li>
			        <input type="text" :name="data1" value="${id.get(0).getSpage()}" class="in_form1"> 
			    </li>
			</ul>
			<ul class="info_form">
			    <li>관리자 메일 주소</li>
			    <li>
			        <input type="text" :name="data2" value="${id.get(0).getSemail()}" class="in_form2"> ※ 관리자가 보내고 받는 용도로 사용하는 메일 주소를 입력합니다.(회원가입,인증메일,회원메일발송 등에서 사용)
			    </li>
			</ul> 
			<ul class="info_form">
			    <li>포인트 사용 유/무</li>
			    <li class="checkcss">
			    	<app:if test="${id.get(0).getSpoint() == 'Y'}">
			        <em><label><input type="radio" :name="data3" value="Y" class="ckclass" checked>포인트 사용</label></em> 
			        <em><label><input type="radio" :name="data3" value="N" class="ckclass">포인트 미사용</label></em>
			        </app:if>
			    	<app:if test="${id.get(0).getSpoint() == 'N'}">
			        <em><label><input type="radio" :name="data3" value="Y" class="ckclass">포인트 사용</label></em> 
			        <em><label><input type="radio" :name="data3" value="N" class="ckclass" checked>포인트 미사용</label></em>
			        </app:if>
			    </li>
			</ul>
			<ul class="info_form2" style="border-bottom:1px solid rgb(81, 61, 61);">
			    <li>회원가입시 적립금</li>
			    <li>
			        <input type="text" :name="data4" value="${id.get(0).getSave_money()}" class="in_form3" maxlength="5"> 점
			    </li>
			    <li>회원가입시 권한레벨</li>
			    <li>
			        <input type="text" :name="data5" value="${id.get(0).getSlevel()}" class="in_form3" maxlength="1"> 레벨
			    </li>
			</ul> 
		</div>
		<p>홈페이지 기본환경 설정</p>
		<div class="subpage_view">
			<ul class="info_form2">
			    <li>회사명</li>
			    <li>
			        <input type="text" :name="data6" value="${id.get(0).getScompany()}" class="in_form0"> 
			    </li>
			    <li>사업자등록번호</li>
			    <li>
			        <input type="text" :name="data7" value="${id.get(0).getScorp_num()}" class="in_form0" maxlength="10"> 
			    </li>
			</ul> 
			<ul class="info_form2">
			    <li>대표자명</li>
			    <li>
			        <input type="text" :name="data8" value="${id.get(0).getSname()}" class="in_form0"> 
			    </li>
			    <li>대표전화번호</li>
			    <li>
			        <input type="text" :name="data9" value="${id.get(0).getStel()}" class="in_form0" maxlength="11"> 
			    </li>
			</ul>
			<ul class="info_form2">
			    <li>통신판매업 신고번호</li>
			    <li>
			        <input type="text" :name="data10" value="${id.get(0).getSmail_order()}" class="in_form0"> 
			    </li>
			    <li>부가통신 사업자번호</li>
			    <li>
			        <input type="text" :name="data11" value="${id.get(0).getSdtc_num()}" class="in_form0"> 
			    </li>
			</ul>
			<ul class="info_form2">
			    <li>사업장 우편번호</li>
			    <li>
			        <input type="text" :name="data12" value="${id.get(0).getSpost()}" class="in_form0" maxlength="5"> 
			    </li>
			    <li>사업장 주소</li>
			    <li>
			        <input type="text" :name="data13" value="${id.get(0).getSaddress()}" class="in_form2"> 
			    </li>
			</ul>
			<ul class="info_form2" style="border-bottom:1px solid rgb(81, 61, 61);">
			    <li>정보관리책임자명</li>
			    <li>
			        <input type="text" :name="data14" value="${id.get(0).getSinfo_name()}" class="in_form0"> 
			    </li>
			    <li>정보책임자 E-mail</li>
			    <li>
			        <input type="text" :name="data15" value="${id.get(0).getSinfo_email()}" class="in_form1"> 
			    </li>
			</ul>
		</div>
		<p>결제 기본환경 설정</p>
		<div class="subpage_view">  
			<ul class="info_form2">
			    <li>무통장 은행</li>
			    <li>
			        <input type="text" :name="data16" value="${id.get(0).getSbank()}" class="in_form0"> 
			    </li>
			    <li>은행계좌번호</li>
			    <li>
			        <input type="text" :name="data17" value="${id.get(0).getSaccount()}" class="in_form1"> 
			    </li>
			</ul>
			<ul class="info_form">
			    <li>신용카드 결제 사용</li>
			    <li class="checkcss">
			    	<app:if test="${id.get(0).getScard_pay() == 'Y'}">
			        <em><label><input type="radio" :name="data18" value="Y" class="ckclass" checked> 사용</label></em> 
			        <em><label><input type="radio" :name="data18" value="N" class="ckclass"> 미사용</label></em> ※ 해당 PG사가 있을 경우 사용으로 변경합니다.
			    	</app:if>
			    	<app:if test="${id.get(0).getScard_pay() == 'N'}">
			        <em><label><input type="radio" :name="data18" value="Y" class="ckclass"> 사용</label></em> 
			        <em><label><input type="radio" :name="data18" value="N" class="ckclass" checked> 미사용</label></em> ※ 해당 PG사가 있을 경우 사용으로 변경합니다.
			    	</app:if>
			    </li>
			        
			</ul>
			<ul class="info_form">
			    <li>휴대폰 결제 사용</li>
			    <li class="checkcss">
			    	<app:if test="${id.get(0).getShp_pay() == 'Y'}">
			        <em><label><input type="radio" :name="data19" value="Y" class="ckclass" checked> 사용</label></em> 
			        <em><label><input type="radio" :name="data19" value="N" class="ckclass"> 미사용</label></em> ※ 주문시 휴대폰 결제를 가능하게 할 것인지를 설정합니다.
			    	</app:if>
			    	<app:if test="${id.get(0).getShp_pay() == 'N'}">
			    	<em><label><input type="radio" :name="data19" value="Y" class="ckclass"> 사용</label></em> 
			        <em><label><input type="radio" :name="data19" value="N" class="ckclass" checked> 미사용</label></em> ※ 주문시 휴대폰 결제를 가능하게 할 것인지를 설정합니다.
			    	</app:if>
			    </li>
			</ul>
			<ul class="info_form">
			    <li>도서상품권 결제사용</li>
			    <li class="checkcss">
			    	<app:if test="${id.get(0).getSbook_pay() == 'Y'}">
			        <em><label><input type="radio" :name="data20" value="Y" class="ckclass" checked> 사용</label></em> 
			        <em><label><input type="radio" :name="data20" value="N" class="ckclass"> 미사용</label></em> ※ 도서상품권 결제만 적용이 되며, 그 외에 상품권은 결제 되지 않습니다.
			    	</app:if>
			    	<app:if test="${id.get(0).getSbook_pay() == 'N'}">
			    	<em><label><input type="radio" :name="data20" value="Y" class="ckclass"> 사용</label></em> 
			        <em><label><input type="radio" :name="data20" value="N" class="ckclass" checked> 미사용</label></em> ※ 도서상품권 결제만 적용이 되며, 그 외에 상품권은 결제 되지 않습니다.
			    	</app:if>
			    </li>
			</ul>
			<ul class="info_form2">
			    <li>결제 최소 포인트</li>
			    <li>
			        <input type="text" :name="data21" value="${id.get(0).getSmin_point()}" class="in_form0" maxlength="5"> 점
			    </li>
			    <li>결제 최대 포인트</li>
			    <li>
			        <input type="text" :name="data22" value="${id.get(0).getSmax_point()}" class="in_form0" maxlength="5"> 점
			    </li>
			</ul>
			<ul class="info_form" style="border-bottom:1px solid rgb(81, 61, 61);">
			    <li>현금 영수증 발급사용</li>
			    <li class="checkcss">
			    	<app:if test="${id.get(0).getSreceipt() == 'Y'}">
			        <em><label><input type="radio" :name="data23" value="Y" class="ckclass" checked> 사용</label></em> 
			        <em><label><input type="radio" :name="data23" value="N" class="ckclass"> 미사용</label></em> ※ 현금영수증 관련 사항은 PG사 가입이 되었을 경우 사용가능 합니다.
			    	</app:if>
			    	<app:if test="${id.get(0).getSreceipt() == 'N'}">
			        <em><label><input type="radio" :name="data23" value="Y" class="ckclass"> 사용</label></em> 
			        <em><label><input type="radio" :name="data23" value="N" class="ckclass" checked> 미사용</label></em> ※ 현금영수증 관련 사항은 PG사 가입이 되었을 경우 사용가능 합니다.
			    	</app:if>
			    </li>
			</ul>
		</div>
		</app:if>
		<div class="btn_div">
		    <button type="button" type="button" class="sub_btn1" title="설정 저장" @click="info_save()">설정 저장</button>
		    <button type="button" type="button" class="sub_btn2" title="저장 취소" @click="info_cancel()">저장 취소</button>
		</div>
	</section>
</main>
</form>
<footer><%@ include file="./admin_footer.jsp" %></footer>
</body>
<script src="./js/admin_siteinfo.js?v=<%=today%>"></script>
</html>

