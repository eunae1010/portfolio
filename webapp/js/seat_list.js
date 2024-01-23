var html = new Vue({
	el:"#seatList",
	data:{
		search:"",
		part:"",
		data1:"",
		data2:"",
		data3:""
	},
	methods:{
		no:function(){
			f.method = "post";
			f.action = "./seat_list.do";
			f.enctype = "application/x-www-form-urlencoded";
			f.submit();
		},
		gosearch:function(e){
			e.preventDefault();
			if(this.search == "" || this.search == " "){
				alert("검색할 단어를 입력하세요.");
				f.search.focus();
			}
			else{
				f.method = "post";
				f.action = "./seat_list.do";
				f.enctype = "application/x-www-form-urlencoded";
				f.submit();
			}
		},
		seat_register:function(){
			if(this.data1 == ""){
				alert("예약 시작일을 입력하세요.");
				f2.tstart.focus();
			}
			else if(this.data2 == ""){
				alert("예약 종료일을 입력하세요.");
				f2.tend.focus();
			}
			else if(this.data3 == ""){
				alert("1인 금액을 입력하세요.");
				f2.tprice.focus();
			}
			else{
				f2.method = "post";
				f2.action = "./seat_listok.do";
				f2.enctype = "application/x-www-form-urlencoded";
				f2.submit();
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