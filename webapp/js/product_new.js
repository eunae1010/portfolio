var html = new Vue({
	el:"#productNew",
	data:{
		data1:"airplane",
		data2:"airname",
		data3:"aircode",
		data4:"airflight",
		data5:"start_point",
		data6:"end_point",
		data7:"seat_text",
		data8:"seat",
		data9:"air_use"
	},
	methods:{
		op:function(){
			var select = document.querySelectorAll(".product_input1_1");
			
			fetch("./select_name.do?airplane=" + f.airplane.value).then(function(response){
					return response.json();
				}).then(function(data){
					var ea = data.length;
					var w = 0;
					select[1].innerHTML = "<option value='" + w + "'>항공사명을 선택하세요</option>";
					
					while(w < ea){
						select[1].innerHTML += "<option value='" + data[w]["airname"] + "'>" + data[w]["airname"] + "</option>";
						w++;
					}
				}).catch(function(error){
					console.log("통신 오류")
				})
		},
		op2:function(){
			var select = document.querySelectorAll(".product_input1_1");
			
			fetch("./select_code.do?airplane=" + f.airplane.value + "&airname=" + f.airname.value).then(function(response){
					return response.json();
				}).then(function(data){
					var ea = data.length;
					var w = 0;
					select[2].innerHTML = "<option value='" + w + "'>항공코드를 선택하세요</option>";
					
					while(w < ea){
						select[2].innerHTML += "<option value='" + data[w]["aircode"] + "'>" + data[w]["aircode"] + "</option>";
						f.airflight.value = data[w]["airflight"];
						w++;
					}
				}).catch(function(error){
					console.log("통신 오류")
				})
		},
		code:function(){
			location.href = "./air_newcode.do"
		},
		product_list:function(){
			location.href = "./product_list.do";
		},
		newproduct:function(){
			if(f.airplane.value == "0"){
				alert("공항코드를 선택하세요.");
				f.airplane.focus();
			}
			else if(f.airname.value == "0"){
				alert("항공사명을 선택하세요.");
				f.airname.focus();
			}
			else if(f.aircode.value == "0"){
				alert("항공코드를 선택하세요.");
				f.aircode.focus();
			}
			else if(f.airflight.value == ""){
				alert("항공편명을 입력하세요.");
				f.airflight.focus();
			}
			else if(f.start_point.value == ""){
				alert("출발지를 입력하세요.");
				f.start_point.focus();
			}
			else if(f.end_point.value == ""){
				alert("도착지를 입력하세요.");
				f.end_point.focus();
			}
			else if(f.seat_text.value == ""){
				alert("좌석형태를 입력하세요.");
				f.seat_text.focus();
			}
			else if(f.seat.value == ""){
				alert("좌석수를 입력하세요.");
				f.seat.focus();
			}
			else{
				if(f.end_point.value != f.start_point.value){
					if(isNaN(f.seat.value) == false){
						f.method = "post";
						f.action = "./product_insertok.do";
						f.enctype = "application/x-www-form-urlencoded";
						f.submit();
					}
					else{
						alert("좌석수는 숫자만 입력하세요.");
						f.seat.value = "";
						f.seat.focus();
					}
				}
				else{
					alert("출발지와 도착지를 다르게 입력하세요.");
					f.end_point.value = "";
					f.end_point.focus();
				}
			}
		}
	}
})