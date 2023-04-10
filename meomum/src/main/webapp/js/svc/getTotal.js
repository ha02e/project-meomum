	/**견적금액과 할인금액을 계산해서 결제금액 출력*/
		var estimated = document.getElementById('estimated');
		var discount = document.getElementById('discount');
		var total = document.getElementById('total');
		
		estimated.addEventListener('input', getTotal);
		discount.addEventListener('input', getTotal);
		
		var originalEstimated = parseInt(estimated.value) || 0;
		var originalDiscount = parseInt(discount.value) || 0;
		var originalResult = originalEstimated - originalDiscount;
		
		function getTotal() {
		  var estimatedValue = parseInt(estimated.value) || 0;
		  var discountValue = parseInt(discount.value) || 0;
		  var result = estimatedValue - discountValue;
		   
		  //견적금액이 음수일 경우, 제약
		  if(result<0){
		    window.alert('금액은 음수가 될 수 없습니다. 다시 입력해주세요');
		    estimated.value = originalEstimated;
		    discount.value = originalDiscount;
		    result = originalResult;
		  }
		    
		  total.value = result ? result : "";
		}