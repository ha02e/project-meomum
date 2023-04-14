var total = document.getElementById('total'); //견적금액
var point_total = document.getElementById('point_total'); //나의 포인트
var point_num = document.getElementById('point_num');//사용 포인트
var real_total = document.getElementById('amount');//총 결제 금액

window.addEventListener('load', function() {
  real_total.value = total.value;
});

//전액 사용 체크 박스 여부
function checkPt() {
  var total_num = parseInt(total.value.replace(/,/g, ""));
  var point_total_num = parseInt(point_total.value.replace(/,/g, ""));
  if (document.getElementById('check').checked) {
    if (point_total_num >= total_num) {
      point_num.value = numberWithCommas(total_num);
      real_total.value = "0";
    } else {
      point_num.value = numberWithCommas(point_total_num);
      real_total.value = numberWithCommas(total_num - point_total_num);
    }
  } else {
    point_num.value = "";
    real_total.value = numberWithCommas(total_num); // 체크박스가 해제되면 총 결제 금액을 견적금액으로 설정
  }
}

// 사용 포인트 입력 시
function getTotal() {
  var total_num = numberWithCommas(total.value.replace(/,/g, "")); //견적금액
  var point_num_val = parseInt(point_num.value.replace(/,/g, "")); //사용 포인트
  var real_total_num = total_num - point_num_val; //총 결제 금액

  if (isNaN(point_num_val) || point_num.value.match(/[^\d]+/)) { // point_num에 문자 입력 시
    alert("숫자만 입력해주세요."); 
    point_num.value = ""; // point_num을 빈 문자열로 초기화
    point_num_val = 0; // point_num_val도 0으로 초기화
    real_total_num = total_num - point_num_val;
  }

  if (point_num_val > point_total.value) {
    alert("사용 포인트가 보유 포인트를 초과합니다.");
    point_num.value = "0"; // point_num을 0으로 초기화
    point_num_val = 0; // point_num_val도 0으로 초기화
    real_total_num = total_num - point_num_val;
  }
  
  if (real_total_num < 0) {
    alert("포인트가 총 금액보다 많습니다.");
    point_num.value = ""; //사용 포인트 초기화
    real_total_num = total_num; //총 결제 금액 초기화
  }
  
  real_total.value = numberWithCommas(real_total_num); //콤마 추가해서 총 결제 금액 출력
}


// 콤마 추가 함수
function numberWithCommas(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
