<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<main class="maincss">
<section id="admin_main">
	{{ajax}}
    <p>신규등록 관리자</p>
    <ol class="new_admin_title">
        <li>NO</li>
        <li>관리자명</li>
        <li>아이디</li>
        <li>전화번호</li>
        <li>이메일</li>
        <li>담당부서</li>
        <li>담당직책</li>
        <li>가입일자</li>
        <li>승인여부</li>
    </ol>
    <ol class="new_admin_none" v-if="view==0">
        <li>신규 등록된 관리자가 없습니다.</li>
    </ol>
    <ol class="new_admin_lists" v-else v-for="aa,bb in datalist">
        <li>{{bb + 1}}</li>
        <li>{{aa.aname}}</li>
        <li>{{aa.aid}}</li>
        <li>{{aa.ahp}}</li>
        <li>{{aa.aemail}}</li>
        <li>{{aa.apart}}</li>
        <li>{{aa.aposition}}</li>
        <li>{{aa.adate.substring(0,10)}}</li>
        <li v-if="aa.ause=='Y'">
            <input type="button" value="승인" class="new_addbtn1" title="승인" @click="admin_ok(aa.aidx)" style="background: #bbb;">
            <input type="button" value="미승인" class="new_addbtn2" title="미승인" @click="admin_no(aa.aidx)">
        </li>
        <li v-else>
            <input type="button" value="승인" class="new_addbtn1" title="승인" @click="admin_ok(aa.aidx)">
            <input type="button" value="미승인" class="new_addbtn2" title="미승인" @click="admin_no(aa.aidx)" style="background: #bbb;">
        </li>
    </ol>
</section>
<section></section>
<section></section>
</main>