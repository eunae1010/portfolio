var pno = window.location.search;

var html = new Vue({
	el:"#noticeView",
	data:{
		nidx:pno,
		output:""
	},
	methods:{
		notice_list:function(){
			location.href = "./notice_list.do";
		},
		notice_modify:function(){
			location.href = "./notice_modify.do" + this.nidx;
		},
		notice_del:function(nidx, url){
			if(confirm("해당 공지글을 삭제하시겠습니까?\n단, 해당 데이터는 복구되지 않습니다.")){
				location.href = "./notice_delete.do?nidx=" + nidx + "&url=" + url;
			}
		}
	},
	computed:{
		n_output:function(){
			if(f.noutput.value == "Y"){
				this.output = true;
			}
		}
	}
})