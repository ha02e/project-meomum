/** 결제 */

var IMP = window.IMP;
IMP.init("imp51432774"); 

function requestPay() {
  var today = new Date();
  var seconds = today.getSeconds().toString();
  var milliseconds = today.getMilliseconds().toString();
  var makeMerchantUid =seconds + milliseconds;  
  
  var svcIdx = document.getElementById('svc_idx').value;
  console.log(svcIdx);
  var amount = document.getElementById('amount').value;
   console.log(amount);
 var user_name = document.getElementById('user_name').value;
   console.log(user_name);
  var user_tel = document.getElementById('user_tel').value;
   console.log(user_tel);
 var user_email = document.getElementById('user_email').value;
  console.log(user_email);
   var user_idx= "${sessionScope.ssInfo.user_idx}";
  console.log(user_idx);
  var uid = svcIdx + makeMerchantUid;
  console.log(uid);
  
  
  /**var svcIdx = "${dto.svc_idx}";
  console.log(svcIdx);
  var amount = document.getElementById('amount').value;
  console.log(amount);
  var user_name = "${dto.user_name}";
  console.log(user_name);
  var user_tel = "${dto.user_tel}";
  console.log(user_tel);
  var user_email = "${dto.user_email}";
  console.log(email);*/
  

  event.preventDefault();

  IMP.request_pay({
    pg : "kakaopay", //html5_inicis
    pay_method : 'card',
    merchant_uid: uid, 
    name : '정리일상',
    amount : amount,
    buyer_email : user_email,
    buyer_name : user_name,
    buyer_tel : user_tel,
  }, function (rsp, event) { // callback
    if (rsp.success) {
        
        var PaymentDTO ={
                    payment_idx: rsp.imp_uid, //payment_idx로 들어갈 값
                  cate_idx: rsp.merchant_uid, //인식번호(cate_idx)
                  payment_cate: 1, //payment_cate 카테고리
                  pay_method: rsp.pay_method, //pay_mehtod 지불수단
                  amount: rsp.paid_amount, //amount 금액
                  pay_buydate: rsp.paid_at, //pay_buydate 결제일
                  pay_cancleDate:null,//pay_cancleDate 취소일(임시'-'로 지정)
                  pay_state: rsp.status,//pay_state

        };
        var PointDTO = {
                   cate_idx: svcIdx,
                  user_idx: user_idx,
                     point_use: 1,
                    point_info:'정리일상 결제',
                    point_num: $("#point_num").val()
        };
        var IdxDTO = {
                svc_idx: svcIdx
        };
        console.log(PaymentDTO);
        console.log(PointDTO);
       //첫번째 ajax요청 - PaymentDTO insert
        $.ajax({
            type: 'POST',
            url: "svcPay.do",
            data: JSON.stringify(PaymentDTO),
            contentType: "application/json",
            success: function (data) {
              console.log(data);
              alert('완료:payment테이블');
              // 두 번째 ajax 요청 - PointDTO insert
              $.ajax({
                type: 'POST',
                url: "insertPoint.do",
                data: JSON.stringify(PointDTO),
                contentType: "application/json",
                success: function (data) {
                  console.log(data);
                  alert('완료:point테이블');
				//세 번째 ajax 요청-state update
                  $.ajax({
                      type: 'POST',
                      url: "updateState.do",
                      data:JSON.stringify(IdxDTO),
                      contentType: "application/json",
                      success:function(data){
                          console.log(data);
                          alert('완료:state 변경 성공');
                      },
                      error:function(xhr, status, error){
                          alert('state 변경 실패');
                      }
                  })
                },
                error: function (xhr, status, error) {
                  alert('PointDTO insert 실패');
                }
              });
            },
            error: function (xhr, status, error) {
              alert('PaymentDTO insert 실패');
            }
          });
        } else {
          alert('다시 시도해주세요');
        }
      }); 
}