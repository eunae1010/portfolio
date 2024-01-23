var html = new Vue({
	el:"#productLIst",
	data:{
		search:"",
		part:"",
		all:false,
		a:[]
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
				f.action = "./product_list.do";
				f.enctype = "application/x-www-form-urlencoded";
				f.submit();
			}
		},
		agree_all:function(z){
			if(this.all == true){
				var f = 0;
				while(f < z){
					this.a.push("t"+f);
					f++;
				}
			}
			else{
				this.a = [];
			}
		},
		agree:function(z){
			if(this.a.length < z){
				this.all = false;
			}
			else{
				this.all = true;
			}
		},
		product_del:function(pidx){
			if(confirm("해당 항공편을 삭제하시겠습니까?\n단, 해당 데이터는 복구되지 않습니다.")){
				location.href = "./product_delete.do?pidx=" + pidx;
			}
		},
		product_new:function(){
			location.href = "./product_insert.do";
		},
		newcode:function(){
			location.href = "./air_newcode.do";
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