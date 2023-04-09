/**"전체" 체크박스 클릭시 체크박스 모두 선택*/
	$(function() {
		$('input[name="svc_state"]').click(
				function() {
					if ($(this).val() === "전체") {
						if ($(this).prop("checked")) {
							$('input[name="svc_state"]').not(this).prop(
									"checked", true);
						} else {
							$('input[name="svc_state"]').not(this).prop(
									"checked", false);
						}
				}
			});
	});

	/**세부 검색 기능*/
	function selectDetail() {
		var minDate = $("#minDate").val();{}
		var maxDate = $("#maxDate").val();
		var category = $("select[name=category] > option:selected").val();
		var keyword = $("#keyword").val();

		var arr = new Array();
		$('input:checkbox[name=svc_state]:checked').each(function() {
			// 전체 체크박스를 제외한 나머지 체크박스만 배열에 추가
			if ($(this).val() !== '전체') {
				arr.push($(this).val());
			}
		});
		
		//검색 값들이 없을 경우
		if(!minDate){
			minDate ="";
		}
		
		if(!maxDate){
			maxDate = "";
		}
		
		if(!keyword){
			keyword = "";
		}
		
		if(arr.length==0){
			arr.push("");
		}
		
		var allData = {
			"minDate" : minDate,
			"maxDate" : maxDate,
			"category" : category,
			"keyword" : keyword,
			"state" : arr
		};

		$.ajax({
			url : "svcSearch.do",
			data :allData,
			dataType : 'json',
			method : "get"
		}).done(function(data) {
			console.log(data);
			$('#tableBody').empty();
			
			if(data.list.length==0){
				var tableTd = '<tr><td colspan="6" style="text-align:center;">회원 정보가 없습니다.</td></tr>';
				$('#tableBody').append(tableTd);
			}else{
				for (var i = 0; i < data.list.length; i++) {
			
		        var rowData = data.list[i];
		        
		        //일자가 timestamp로 반환되어 yyyy-mm-dd로 출력되게 변환
		        var date = new Date(rowData.svc_regdate);
		        var date = new Date(rowData.svc_regdate);
		        var formatDate = date.getFullYear() + '-' + ('0' + (date.getMonth() + 1)).slice(-2) + '-' + ('0' + date.getDate()).slice(-2);
	
		        var tableTd = '<tr>';
		        tableTd += '<td><input type="checkbox" name="check" value=""></td>';
		        tableTd += '<td>' + rowData.svc_idx + '</td>';
		        tableTd += '<td>' + formatDate + '</td>';
		        tableTd += '<td><a href="asvcContent.do?svc_idx=' + rowData.svc_idx + '">' + rowData.user_name + '</a></td>';
		        tableTd += '<td>' + rowData.user_tel + '</td>';
		        tableTd += '<td>' + rowData.svc_state + '</td>';
		        tableTd += '</tr>';
		        $('#tableBody').append(tableTd);
				}
			}
		}).fail(function() {
			alert('다시 시도해주세요');
		});
	}