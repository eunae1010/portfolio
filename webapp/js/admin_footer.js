var html2 = new Vue({
	el:"#apifooter",
	data:{
		scompany:"",
		scorp_num:"",
		sname:"",
		stel:"",
		smail_order:"",
		sdtc_num:"",
		spost:"",
		saddress:"",
		sinfo_name:"",
		sinfo_email:"",
		view:0
	},
	methods:{
		info_data:function(s){
			this.scompany = s[0]["scompany"];
			this.scorp_num = s[0]["scorp_num"];
			this.sname = s[0]["sname"];
			this.stel = s[0]["stel"];
			this.smail_order = s[0]["smail_order"];
			this.sdtc_num = s[0]["sdtc_num"];
			this.spost = s[0]["spost"];
			this.saddress = s[0]["saddress"];
			this.sinfo_name = s[0]["sinfo_name"];
			this.sinfo_email = s[0]["sinfo_email"];
		}
	},
	computed:{
		footer:function(){
			fetch("./api_footer.do").then(function(response){
				return response.json();
			}).then(function(data){
				html2.info_data(data);
			}).catch(function(error){
				console.log("api 서버 접속 오류");
			})
		}
	}
})