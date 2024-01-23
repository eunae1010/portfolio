var html = new Vue({
	el:"#noticeList",
	data:{
		all:false,
		a:[],
		aa:[]
	},
	methods:{
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
		agree:function(z,n,ck){
			if(ck['target']['checked'] == true){
				this.aa.push(n);
			}
			else{
				this.aa.pop();
			}
			
			if(this.a.length < z){
				this.all = false;
			}
			else{
				this.all = true;
			}
		},
		notice_view:function(nidx,num){
			location.href = "./notice_view.do?nidx=" + nidx + "&num=" + num;
		},
		notice_del:function(){
			if(confirm("해당 공지글을 삭제하시겠습니까?\n단, 해당 데이터는 복구되지 않습니다.")){
				location.href = "./notice_listdel.do?nidx=" + this.aa;
			}
		},
		notice_add:function(){
			location.href = "./notice_write.do";
		}
	}
})