/*관리자-예약 완료된 시간 표시*/

$(function() {
	function timeSelect(){		
		//span 태그 내 텍스트 빈 문자열
		$('#timeA+span, #timeB+span, #timeC+span').text("");
		
	  //컨트롤러로 사용자가 선택한 날짜 전송
	    $.ajax({
	      url: "svcTimeSelect.do",
	      data: {
	        svc_days: $("#svc_days").val()
	      },
	      dataType: 'json',
	      method: "get"
	    }).done(function(data) {
	      console.log(data);
			
	    //컨트롤러에서 전달받은 값이 timeA,B,C와 같으면 버튼 빨강색으로 변화
	    if (data != null) {
  			for (let i = 0; i < data.times.length; i++) {
    			if (data.times[i] == $("#timeA").val()) {
     				$('#timeA+span').text('예약불가');
      				$('#timeA+span').css('color','red');
    			} else if (data.times[i] == $("#timeB").val()) {
     				$('#timeB+span').text('예약불가');
      				$('#timeB+span').css('color','red');
    			} else {
      				$('#timeC+span').text('예약불가');
      				$('#timeC+span').css('color','red');
    			}
  			}
		}
	   }).fail(function() {
	      alert('다시 시도해주세요');
	   });
	}
	timeSelect();

	$("#svc_days").change(function(){
		timeSelect();
	});
});