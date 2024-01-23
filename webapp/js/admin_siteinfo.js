var html = new Vue({
	el:"#siteinfo",
	data:{
		data1:"spage",
		data2:"semail",
		data3:"spoint",
		data4:"save_money",
		data5:"slevel",
		data6:"scompany",
		data7:"scorp_num",
		data8:"sname",
		data9:"stel",
		data10:"smail_order",
		data11:"sdtc_num",
		data12:"spost",
		data13:"saddress",
		data14:"sinfo_name",
		data15:"sinfo_email",
		data16:"sbank",
		data17:"saccount",
		data18:"scard_pay",
		data19:"shp_pay",
		data20:"sbook_pay",
		data21:"smin_point",
		data22:"smax_point",
		data23:"sreceipt"
	},
	methods:{
		info_save:function(){
			if(f.spage.value == ""){
				alert("홈페이지 제목을 입력하세요.");
				f.spage.focus();
			}
			else if(f.semail.value == ""){
				alert("관리자 이메일을 입력하세요.");
				f.semail.focus();
			}
			else if(f.save_money.value == "" || isNaN(f.save_money.value) == true){
				alert("회원가입시 적립금을 입력하세요.(숫자만 입력)");
				f.save_money.focus();
			}
			else if(f.slevel.value == "" || isNaN(f.slevel.value) == true){
				alert("회원가입시 권한레벨을 입력하세요.(숫자만 입력)");
				f.slevel.focus();
			}
			else if(f.scompany.value == ""){
				alert("회사명을 입력하세요.");
				f.scompany.focus();
			}
			else if(f.scorp_num.value == "" || isNaN(f.scorp_num.value) == true){
				alert("사업자등록번호를 입력하세요.(숫자만 입력)");
				f.scorp_num.focus();
			}
			else if(f.sname.value == ""){
				alert("대표자명 입력하세요.");
				f.sname.focus();
			}
			else if(f.stel.value == "" || isNaN(f.stel.value) == true){
				alert("대표전화번호를 입력하세요.(숫자만 입력)");
				f.stel.focus();
			}
			else if(f.smail_order.value == ""){
				alert("통신판매업 신고번호를 입력하세요.");
				f.smail_order.focus();
			}
			else if(isNaN(f.sdtc_num.value) == true){
				alert("부가통신 사업자번호는 숫자만 입력하세요.");
				f.sdtc_num.value = "";
				f.sdtc_num.focus();
			}
			else if(f.spost.value == "" || f.spost.value.length != 5 || isNaN(f.spost.value) == true){
				alert("올바른 우편번호를 입력하세요.");
				f.spost.focus();
			}
			else if(f.saddress.value == ""){
				alert("사업장 주소를 입력하세요.");
				f.saddress.focus();
			}
			else if(f.sinfo_name.value == ""){
				alert("정보관리책임자명을 입력하세요.");
				f.sinfo_name.focus();
			}
			else if(f.sinfo_email.value == ""){
				alert("올바른 정보관리책임자 이메일을 입력하세요.");
				f.sinfo_email.focus();
			}
			else if(f.sbank.value == ""){
				alert("은행명을 입력하세요.");
				f.sbank.focus();
			}
			else if(f.saccount.value == ""){
				alert("계좌번호를 입력하세요.");
				f.saccount.focus();
			}
			else if(f.smin_point.value == "" || isNaN(f.smin_point.value) == true){
				alert("결제 최소 포인트를 입력하세요.(숫자만 입력)");
				f.smin_point.focus();
			}
			else if(f.smax_point.value == "" || isNaN(f.smax_point.value) == true){
				alert("결제 최대 포인트를 입력하세요.(숫자만 입력)");
				f.smax_point.focus();
			}
			else{
				var mailck1 = /[0-9a-z]+\@[0-9a-z]+\.[0-9a-z]+/gi;
				var mailck2 = /[0-9a-z]+\@[0-9a-z]+\.[0-9a-z]+/gi;
				var accountck = /[0-9]{3}-[0-9]{2}-[0-9]{5}/g;
				
				if(mailck1.test(f.semail.value) == true){
					if(mailck2.test(f.sinfo_email.value) == true){
						if(accountck.test(f.saccount.value) == true){
							if(Number(f.smin_point.value) < Number(f.smax_point.value)){
								f.method = "post";
								f.action = "./admin_siteok.do";
								f.enctype = "application/x-www-form-urlencoded";
								f.submit();
							}
							else{
								alert("최대 포인트보다 적은 숫자를 입력하세요.");
								f.smin_point.value = "";
								f.smin_point.focus();
							}
						}
						else{
							alert("올바른 계좌번호를 입력하세요.");
							f.saccount.value = "";
							f.saccount.focus();
						}
					}
					else{
						alert("올바른 이메일을 입력하세요.");
						f.sinfo_email.value = "";
						f.sinfo_email.focus();
					}
				}
				else{
					alert("올바른 이메일 입력하세요.");
					f.semail.value = "";
					f.semail.focus();
				}
			}
		},
		info_cancel:function(){
			location.reload();
		}
	},
	computed:{
		
	}
})