var html = new Vue({
	el:"#ticketingList",
	data:{
		search:"",
		part:"",
		a:""
	},
	methods:{
		gosearch:function(e){
			e.preventDefault();
			if(this.search == "" || this.search == " "){
				alert("검색할 단어를 입력하세요.");
				f.search.focus();
			}
			else{
				f.method = "post";
				f.action = "./ticketing_list.do";
				f.enctype = "application/x-www-form-urlencoded";
				f.submit();
			}
		},
		ck:function(n){
			this.a = n;
		},
		ticketing_cancel:function(){
			if(confirm("예매정보를 취소합니다.\n단, 취소시 데이터는 복구되지 않습니다.")){
				location.href = "./ticket_cancel.do?pidx=" + this.a;
			}
		}
	},
	computed:{
		search_part:function(){
			if(this.part == ""){
				this.part = "1";
			}
			else{
				this.part = this.part;
			}
		}
	}
})