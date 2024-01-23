window.onload = function(){
	var ck = CKEDITOR.replace("boardtext",{
		height: 290
	});
}

var html = new Vue({
	el:"#noticeWrite",
	data:{
		data1:""
	},
	methods:{
		notice_list:function(){
			location.href = "./notice_list.do";
		},
		notice_write:function(){
			var ck = CKEDITOR.instances.boardtext.getData();
			
			if(this.data1 == ""){
				alert("공지사항 제목을 입력하세요.");
			}
			else if(ck == ""){
				alert("내용을 입력하세요.");
			}
			else{
				f.method = "post";
				f.action = "./notice_writeok.do";
				f.enctype = "multipart/form-data";
				f.submit();
			}
		}
	}
})