var html = new Vue({
	el:"#admin",
	data:{
		data1:"aid",
		data2:"apass"
	},
	methods:{
		login:function(){
			if(f.aid.value == ""){
				alert("관리자 아이디를 입력하세요.");
				f.aid.focus();
			}
			else if(f.apass.value == ""){
				alert("관리자 패스워드를 입력하세요.");
				f.apass.focus();
			}
			else{
				f.method = "post";
				f.action = "./loginok.do";
				f.enctype = "application/x-www-form-urlencoded";
				f.submit();
			}
		},
		add:function(){
			location.href = "./add_master.jsp";
		},
		search:function(){
			location.href = "./";
		}
	}
})