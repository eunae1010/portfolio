window.onload = function(){
	var ck = CKEDITOR.replace("boardtext",{
		height: 290
	});
}

var urls = document.location.search;

var html = new Vue({
	el:"#noticeModify",
	data:{
		attach:filenm,
		nidx:urls,
		output:""
	},
	methods:{
		file_del:function(nidx, url){
			if(confirm("첨부파일을 삭제하시겠습니까?\n단, 삭제시 복구되지 않습니다.")){
				fetch("./file_delete.do?nidx=" + nidx + "&url=" + url).then(function(response){
					return response.text();
				}).then(function(data){
					if(data == "ok"){
						this.attach = "";
						location.reload();
					}
				}).catch(function(error){
					console.log("통신 오류");
				})
			}
		},
		notice_list:function(){
			location.href = "./notice_list.do";
		},
		notice_modify:function(){
			var ck = CKEDITOR.instances.boardtext.getData();
			
			if(f.nsubject.value == ""){
				alert("공지사항 제목을 입력하세요.");
			}
			else if(ck == ""){
				alert("내용을 입력하세요.");
			}
			else{
				if(confirm("해당 내용을 수정하시겠습니까?")){
					f.method = "post";
					f.action = "./notice_modifyok.do";
					f.enctype = "multipart/form-data";
					f.submit();
				}
			}
		}
	},
	computed:{
		n_output:function(){
			if(f.noutput.value == "Y"){
				this.output = true;
			}
			else{
				this.output = false;
			}
		}
	}
})