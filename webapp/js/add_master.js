var html = new Vue({
	el:"#admin_add",
	data:{
		data1:"aid",
		data2:"apass",
		data3:"aname",
		data4:"aemail",
		data5:"ahp",
		data6:"apart",
		data7:"aposition",
		user:"",
		pass1:"",
		pass2:"",
		hp1:"010",
		hp2:"",
		hp3:""
	},
	methods:{
		idck:function(){
			if(this.user.length < 5){
				alert("아이디는 최소 5자 이상 입력하세요.");
				f.aid.value = "";
				f.aid.focus();
			}
			else{
				fetch("./idck.do?aid=" + this.user).then(function(response){
					return response.text();
				}).then(function(data){
					html.idck_msg(data);
				}).catch(function(error){
					alert("통신 오류");
				})
			}
		},
		idck_msg:function(data){
			if(data == 1){
				alert("중복된 아이디입니다.");
				f.aid.value = "";
				f.aid.focus();
			}
			else{
				alert("사용 가능한 아이디입니다.");
				f.aid.readOnly = true;
			}
		},
		add_admin:function(){
			if(f.aid.value == "" || f.aid.value.length < 5){
				alert("아이디는 최소 5자 이상 입력하세요.");
				f.aid.value = "";
				f.aid.focus();
			}
			else if(f.apass.value == "" || f.apass.value.length < 5){
				alert("패스워드는 최소 5자 이상 입력하세요.");
				f.apass.value = "";
				f.apass.focus();
			}
			else if(this.pass2 != this.pass1){
				alert("동일한 패스워드를 입력하세요.");
				this.pass2 = "";
			}
			else if(f.aname.value == ""){
				alert("이름을 입력하세요.");
				f.aname.focus();
			}
			else if(f.aemail.value == ""){
				alert("이메일을 입력하세요.");
				f.aemail.focus();
			}
			else if(this.hp1 == ""){
				alert("핸드폰 번호 앞자리를 입력하세요.");
			}
			else if(this.hp2 == "" || this.hp2.length < 4){
				alert("핸드폰 번호 중간자리를 입력하세요.");
			}
			else if(this.hp3 == "" || this.hp3.length < 4){
				alert("핸드폰 번호 뒷자리를 입력하세요.");
			}
			else if(f.apart.value == "0"){
				alert("부서를 선택하세요.");
				f.apart.focus();
			}
			else if(f.aposition.value == "0"){
				alert("직책을 선택하세요.");
				f.aposition.focus();
			}
			else{
				var idpwck = /[a-z]/gi;
				var emailck = /[0-9a-z]+\@[0-9a-z]+\.[0-9a-z]+/gi;
				var hpck = /[^0-9]/g;
				
				if(idpwck.test(f.aid.value) == true){
					if(idpwck.test(f.apass.value) == true){
						if(emailck.test(f.aemail.value) == true){
							if(this.hp1 == "010" || this.hp1 == "011"){
								if(hpck.test(this.hp2) == false){
									if(hpck.test(this.hp3) == false){
										f.method = "post";
										f.action = "./joinok.do";
										f.enctype = "application/x-www-form-urlencoded";
										f.submit();
									}
									else{
										alert("올바른 핸드폰 번호 뒷자리를 입력하세요.");
										this.hp3.value = "";
									}
								}
								else{
									alert("올바른 핸드폰 번호 중간자리를 입력하세요.");
									this.hp2.value = "";
								}
							}
							else{
								alert("올바른 핸드폰 번호 앞자리를 입력하세요.");
								this.hp1.value = "";
							}
						}
						else{
							alert("올바른 이메일을 입력하세요.");
							f.aemail.value = "";
							f.aemail.focus();
						}
					}
					else{
						alert("패스워드에 영문을 포함하세요.");
						f.apass.value = "";
						f.apass.focus();
					}
				}
				else{
					alert("아이디에 영문을 포함하세요.");
					f.aid.value = "";
					f.aid.focus();
				}
			}
		},
		cancel:function(){
			location.href = "./index.jsp";
		}
	}
})