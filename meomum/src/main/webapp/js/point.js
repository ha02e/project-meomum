/** 포인트 조회*/

var total = document.getElementById('total'); //견적금액

var point_total = document.getElementById('point_total'); //사용가능 포인트

var point_num = document.getElementById('point_num');//사용 포인트

var real_total = document.getElementById('amount');//총 결제 금액

real_total.value = total.value;
	
	function formatNumber(num) {
  return new Intl.NumberFormat().format(num);
	}
   function checkPt() {
       if (document.getElementById('check').checked) {
           point_num.value = point_total.value;
           point_num.disabled = true;
       } else {
           point_num.value = 0;
           point_num.disabled = false;
           real_total.value = total.value;
           
       }
       getTotal();
   }
	//포인트가 결제금액보다 많을 경우, 총 결제 금액 0원으로 변하게
   function getTotal() {
       var remainingPoint = point_total.value; 
       var usePoint = point_num.value;
       
       if (!document.getElementById('check').checked) {
           remainingPoint -= usePoint;
           if (remainingPoint < 0) {
               window.alert("사용 가능한 포인트를 초과하였습니다.");
               point_num.value = 0;
               real_total.value = total.value;
               console.log(total.value);
               console.log(real_total.value);
           }
           else{
           		real_total.value = total.value - usePoint;
               console.log("amount"+real_total.value);

           }
       }else{
       real_total.value = total.value - usePoint;
       console.log("amount"+real_total.value);
    
       }
      }
       
   