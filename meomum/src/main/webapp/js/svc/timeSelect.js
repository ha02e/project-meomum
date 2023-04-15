$(function() {



	function timeSelect() {
	    
		//시간 선택 버튼 모두 활성화
	    $('#timeA, #timeB, #timeC').prop('disabled', false);
		
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
			
	    //컨트롤러에서 전달받은 값이 timeA,B,C와 같으면 버튼 비활성화
	      if (data != null) {
	        for (let i = 0; i < data.times.length; i++) {
	          if (data.times[i] == $("#timeA").val()) {
	            $('#timeA').prop('disabled', true);
	          } else if (data.times[i] == $("#timeB").val()) {
	            $('#timeB').prop('disabled', true);
	          } else {
	            $('#timeC').prop('disabled', true);
	          }
	        }
	      }
	    }).fail(function() {
	      alert('다시 시도해주세요');
	    });
	};

	timeSelect();

	$("#svc_days").change(function() {
	    // 라디오 버튼 그룹에서 선택된 값을 초기화
	    $('input[name="svc_time"]').prop('checked', false);

	    // 비활성화되지 않은 버튼만 선택 가능하도록 설정
	    //$('input[name="svc_time"]:not(:disabled)').prop('checked', true);
	    timeSelect();
	});
});
