var html = new Vue({
	el:"#faqList",
	data:{
		search:""
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
				f.action = "./faq_list.do";
				f.enctype = "application/x-www-form-urlencoded";
				f.submit();
			}
		},
		faq_view:function(fidx){
			location.href = "./faq_view.do?fidx=" + fidx;
		},
		faq_del:function(fidx){
			if(confirm("해당 질문을 삭제하시겠습니까?\n단, 해당 데이터는 복구되지 않습니다.")){
				location.href = "./faq_delete.do?fidx=" + fidx;
			}
		},
		faq_add:function(){
			location.href = "./faq_write.do";
		}
	},
	computed:{
		
	}
})