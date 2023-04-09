/*다음 카카오 API*/
	function findAddr(){
			var width = 500; //팝업의 너비
			var height = 600; //팝업의 높이
	
			new daum.Postcode({
		 		width: width,
		 		height: height,
        		oncomplete: function(data) {
            		var zonecode = data.zonecode;
            		var roadAddr = data.roadAddress; // 도로명 주소 변수
            		var jibunAddr = data.jibunAddress; // 지번 주소 변수

            		document.getElementById('user_pcode').value = zonecode;
            		
            		if(roadAddr !== ''){
                		document.getElementById('user_addr').value = roadAddr;
            		} 
            		else if(jibunAddr !== ''){
                		document.getElementById('user_addr').value = jibunAddr;
            		}
        		}
    		}).open({
        		left: (window.screen.width / 2) - (width / 2),
        		top: (window.screen.height / 2) - (height / 2)
    	});
	}