<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Date today2 = new Date();
%>
<meta charset="UTF-8">
<footer class="main_copyright">
	<section id="apifooter">
	{{footer}}
		<p>{{scompany}}</p>
		<ul>
			<li>대표자 {{sname}} | 대표번호 {{stel}} | 주소 ({{spost}}) {{saddress}}</li>
			<li>사업자등록번호 {{scorp_num}} | 통신판매업 신고번호 {{smail_order}} <em v-if="view==1">| 부가통신 사업자번호 {{sdtc_num}}</em></li>
			<li>정보관리책임자 {{sinfo_name}} | 정보책임자 E-mail {{sinfo_email}}</li>
		</ul>
	</section>
</footer>
<script src="./js/admin_footer.js?v=<%=today2%>"></script>