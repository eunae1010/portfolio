window.onload = function(){
	var ck = CKEDITOR.replace("boardtext",{
		height: 400
	});
}

var html = new Vue({
	el:"#faqModify",
	data:{
		
	},
	methods:{
		faq_list:function(){
			location.href = "./faq_list.do";
		},
		faq_modify:function(){
			var ck = CKEDITOR.instances.boardtext.getData();
			
			if(f.fsubject.value == ""){
				alert("공지사항 제목을 입력하세요.");
			}
			else if(ck == ""){
				alert("내용을 입력하세요.");
			}
			else{
				if(confirm("해당 내용을 수정하시겠습니까?")){
					f.method = "post";
					f.action = "./faq_modify.do";
					f.enctype = "application/x-www-form-urlencoded";
					f.submit();
				}
			}
		}
	}
})