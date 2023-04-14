/** 포인트 조회*/

var total = document.getElementById('total'); //견적금액

var point_total = document.getElementById('point_total'); //사용가능 포인트

var point_num = document.getElementById('point_num');//사용 포인트

var real_total = document.getElementById('amount');//총 결제 금액

real_total.value = total.value;
	
   function checkPt() {
    //전액 사용 체크시
       if (document.getElementById('check').checked) {
            if (point_total.value >= total.value) { // point_total이 total 값보다 큰 경우
                point_num.value = total.value; 
                real_total.value = 0; 
            } else {
            	point_num.value = point_total.value;
            	real_total.value = total.value - point_total.value;
             }
           
       } else {
           point_num.value = 0;
           point_num.disabled = false;
           real_total.value = total.value;      
       }
       getTotal();
   }
	
   function getTotal() {
    var remainingPoint = point_total.value; 
    var usePoint = point_num.value;
    
    if (!document.getElementById('check').checked) {
        remainingPoint -= usePoint;

        //사용자 입력 포인트가 사용가능 포인트를 넘었을 경우
        if (remainingPoint < 0) {
            window.alert("사용 가능한 포인트를 초과하였습니다.");
            point_num.value = point_total.value;
            real_total.value = 0;
        }
        else{
            real_total.value = total.value - usePoint;
        }
    }else{
        remainingPoint -= total.value;
        real_total.value = 0;
    }
}


    