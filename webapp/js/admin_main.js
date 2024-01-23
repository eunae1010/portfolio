var html = new Vue({
	el:"#admin_main",
	data:{
		view:0,
		a:"",
		datalist:[]
	},
	methods:{
		datas:function(json){
			if(json.length > 0){
				for(this.a in json){
					this.datalist.push({
						aidx:json[this.a]["aidx"],
						aname:json[this.a]["aname"],
						aid:json[this.a]["aid"],
						ahp:json[this.a]["ahp"],
						aemail:json[this.a]["aemail"],
						apart:json[this.a]["apart"],
						aposition:json[this.a]["aposition"],
						adate:json[this.a]["adate"],
						ause:json[this.a]["ause"]
					})
				}
				this.view = 1;
			}
			else{
				this.view = 0;
			}
		},
		admin_ok:function(aidx){
			if(confirm("승인하시겠습니까?")){
				location.href = "./adminok.do?aidx=" + aidx;
			}
		},
		admin_no:function(aidx){
			if(confirm("미승인하시겠습니까?")){
				location.href = "./adminno.do?aidx=" + aidx;
			}
		}
	},
	computed:{
		ajax:function(){
			fetch("./api_list.do").then(function(response){
				return response.json();
			}).then(function(data){
				html.datas(data);
			}).catch(function(error){
				console.log("api 서버 접속 오류");
			})
		}
	}
})