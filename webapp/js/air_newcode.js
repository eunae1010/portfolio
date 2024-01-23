var html = new Vue({
	el:"#airNewcode",
	data:{
		code:"",
		data1:"airplane",
		data2:"airname",
		data3:"aircode",
		data4:"airflight",
		data5:"airuse",
		acode:""
	},
	methods:{
		hiddens:function(){
			this.code = "1";
		},
		codeck:function(){
			if(f.aircode.value == ""){
				alert("항공코드를 입력하세요.");
				f.aircode.focus();
			}
			else{
				fetch("./codeck.do?aircode=" + f.aircode.value).then(function(response){
					return response.text();
				}).then(function(data){
					if(data == "ok"){
						alert("사용가능한 코드입니다.");
						html.hiddens();
					}
					else if(data == "no"){
						alert("중복된 코드입니다.");
						f.aircode.value = "";
						f.aircode.focus();
					}
				}).catch(function(error){
					console.log("통신 오류");
				})
			}
		},
		air_list:function(){
			location.href = "./air_list.do";
		},
		newcode:function(){
			if(f.airplane.value == ""){
				alert("공항코드를 입력하세요.");
				f.airplane.focus();
			}
			else if(f.airname.value == ""){
				alert("항공사명을 입력하세요.");
				f.airname.focus();
			}
			else if(f.aircode.value == ""){
				alert("항공코드를 입력하세요.");
				f.aircode.focus();
			}
			else if(f.airflight.value == ""){
				alert("항공편명을 입력하세요.");
				f.airflight.focus();
			}
			else if(this.code == ""){
				alert("항공코드 중복확인을 하세요.");
			}
			else{
				var pcode = /[^A-Z]/g;
				var aname = /[^0-9a-zㄱ-ㅎ가-힣]/gi;
				if(pcode.test(f.airplane.value) == false){
					if(aname.test(f.airname.value) == false){
						f.method = "post";
						f.action = "./air_newcodeok.do";
						f.enctype = "application/x-www-form-urlencoded";
						f.submit();
					}
					else{
						alert("항공사명은 특수문자를 제외한 문자만 입력하세요.");
						f.airname.value = "";
						f.airname.focus();
					}
				}
				else{
					alert("공항코드는 대문자로 입력하세요.");
					f.airplane.value = "";
					f.airplane.focus();
				}
			}
		}
	}
})