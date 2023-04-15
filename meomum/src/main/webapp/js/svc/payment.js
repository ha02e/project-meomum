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
  var user_email = document.getElementById('user_id').value;
  console.log(user_email);
  var user_idx = document.getElementById('user_idx').value;
  console.log(user_idx);
  var uid = svcIdx + makeMerchantUid;
  console.log(uid);

  /**if (amount == 0) {
  	var amount = $("#amount").val();
    var PaymentDTO = {
      payment_idx: svcIdx, //payment_idx로 들어갈 값
      cate_idx: uid, //인식번호(cate_idx)
      payment_cate: 1, //payment_cate 카테고리
      pay_method: '포인트사용', //pay_mehtod 지불수단
      amount: 0, //amount 금액
      pay_buydate: null, //pay_buydate 결제일
      pay_cancelDate: null, //pay_cancelDate 취소일(임시'-'로 지정)
      pay_state: 'point', //pay_state
    };

    var PointDTO = {
      cate_idx: svcIdx,
      user_idx: user_idx,
      point_use: 1,
      point_info: '정리일상 결제',
      point_num: $("#point_num").val(),
    };

    var IdxDTO = {
      svc_idx: svcIdx,
    };

    $.ajax({
      type: 'GET',
      url: "svcPay.do",
      data: JSON.stringify({PaymentDTO: PaymentDTO,PointDTO: PointDTO,IdxDTO: IdxDTO,}),
      contentType: "application/json",
      dataType: "json",
     success: function (data) {
              console.log(data);
              alert('결제 완료되었습니다:point 결제');
                location.href = 'svcIngList.do';
    },
    error:function(xhr, status, error){
                console.log(xhr, status, error);
                alert('다시 시도해주세요:point 결제');
                location.href = 'svcIngContent.do';
    }
    });
    
    
  } else {*/
  
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
                  pay_cancelDate:null,//pay_cancelDate 취소일(임시'-'로 지정)
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
       
        $.ajax({
            type: 'POST',
            url: "svcPay.do",
            data: JSON.stringify({PaymentDTO:PaymentDTO, PointDTO: PointDTO, IdxDTO: IdxDTO}),
            contentType: "application/json",
            dataType :"json",
            success: function (data) {
              console.log(data);
             },
             error:function(xhr, status, error){
                 console.log(xhr);
  				console.log(status);
  				console.log(error);
             }
             });
             
            alert('결제 완료되었습니다');
            location.href = 'svcIngList.do';
        } else {
        	console.log(rsp);
          alert('다시 시도해주세요');
          location.href = 'svcIngContent.do?svc_idx=' + svcIx + '&&' + 'user_idx=' + user_idx;

        }
      }); 
/**}*///else end
}//requestpay end