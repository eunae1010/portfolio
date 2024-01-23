window.onload = function(){
	var ck = CKEDITOR.replace("boardtext",{
		height: 400
	});
}

var html = new Vue({
	el:"#faqWrite",
	data:{
		data1:""
	},
	methods:{
		faq_write:function(){
			var ck = CKEDITOR.instances.boardtext.getData();
			
			if(this.data1 == ""){
				alert("공지사항 제목을 입력하세요.");
			}
			else if(ck == ""){
				alert("내용을 입력하세요.");
			}
			else{
				f.method = "post";
				f.action = "./faq_writeok.do";
				f.enctype = "application/x-www-form-urlencoded";
				f.submit();
			}
		}
	}
})