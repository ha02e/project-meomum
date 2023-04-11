<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.site-footer-title{

font-weight: bold;
color : #F5E1DA;
font-size: 25px;
}


.topbutton {
    padding: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: normal;
    width: 45px;
    height: 45px;
    border-radius: 50% !important;
    color: #FFFFFF;
    background-color: #EAA636;
    border-color: #EAA636;
    
}
.topbutton:hover{
 background-color: #EAA636;
    border-color: #EAA636;
}

#kakao {
    cursor: pointer;
    border-radius: 4px;
    overflow: hidden;
    position: fixed;
    right:10px;
    bottom: 0;
    width: 100px;
    height: 100px;
    z-index: 9999;
}

.back-to-top {
    position: fixed;
    right: 30px;
    bottom: 100px;
    z-index: 99;
}

</style>
</head>
<body>

    <footer class="site-footer">
        <div class="container">
            <div class="row">
                

                <div class="col-lg-4 col-md-6 col-12 mb-4">
                    <h5 class="site-footer-title mb-3">머뭄</h5>

                    <ul class="footer-menu">
                        <li class="footer-menu-item"><a href="#" class="footer-menu-link">회사소개</a></li>

                        <li class="footer-menu-item"><a href="#" class="footer-menu-link">이용약관</a></li>

                        <li class="footer-menu-item"><a href="#" class="footer-menu-link">개인정보 처리 방침</a></li>

                        <li class="footer-menu-item"><a href="ntcList.do" class="footer-menu-link">공지사항</a></li>

                        <li class="footer-menu-item"><a href="#" class="footer-menu-link">Partner with us</a></li>
                        <li class="footer-menu-item"><a href="#" class="footer-menu-link">Partner with us</a></li>
                      
                    </ul>
                </div>

                <div class="col-lg-4 col-md-6 col-12 mx-auto ">
                    <h5 class="site-footer-title mb-3">Contact Infomation</h5>

                    <p class="text-white d-flex mb-2">
                        <i class="bi-telephone me-2"></i>

                        <a href="tel: 1004-1004" class="site-footer-link">
                            1234-1004
                        </a>
                    </p>

                    <p class="text-white d-flex">
                        <i class="bi-envelope me-2"></i>

                        <a href="#" class="site-footer-link">
                            meomun@meomum.com
                        </a>
                    </p>

                    <p class="text-white d-flex mt-3">
                        <i class="bi-geo-alt me-2"></i>
                        행복특별시 행복구 행복동 1004,머뭄
                    </p>
                </div>
                <div class="col-lg-2 col-12 mb-4 d-flex justify-content-end">
                    <a href="index.do"><img src="/meomum/images/meomum_logo_white.png" style="width:180px;" alt="머뭄 로고"></a> 
                </div>
                
                
            </div>
        </div>

        <div class="site-footer-bottom">
            <div class="container">
                <div class="row">

                    <div class="col-lg-6 col-md-7 col-12">
                     <p class="copyright-text">
                      머물고 싶은 공간 머뭄이 함께 만들어갑니다.  <br>
                         Copyright © 2023 meomum
                        </p>
                    </div>
                    

                    <div class="col-lg-6 col-md-5 col-12 d-flex justify-content-end align-items-center mx-auto">
                        <ul class="social-icon">
                            <li class="social-icon-item">
                                <a href="#" class="social-icon-link bi-twitter"></a>
                            </li>

                            <li class="social-icon-item">
                                <a href="#" class="social-icon-link bi-facebook"></a>
                            </li>

                            <li class="social-icon-item">
                                <a href="#" class="social-icon-link bi-instagram"></a>
                            </li>

                            <li class="social-icon-item">
                                <a href="#" class="social-icon-link bi-linkedin"></a>
                            </li>

                            <li class="social-icon-item">
                                <a href="" class="social-icon-link bi-youtube"></a>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
 
    </footer>
<a href="#top" class="btn btn-lg topbutton back-to-top" style=""><i class="bi bi-arrow-up"></i></a>
<div id="kakao"
  data-channel-public-id="_dCLxcxj"
  data-title="consult"
  data-size="small"
  data-color="yellow"
  data-shape="pc"
  data-support-multiple-densities="true"></div>

   

    <!-- JAVASCRIPT FILES -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    <script src="js/click-scroll.js"></script>
    <script src="js/counter.js"></script>
    <script src="js/custom.js"></script>
    
    
    <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>-->



</body>
<script>
  window.kakaoAsyncInit = function() {
    Kakao.Channel.createChatButton({
      container: '#kakao',
    });
  };

  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = 'https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.channel.min.js';
    js.integrity = 'sha384-MEvxc+j9wOPB2TZ85/N6G3bt3K1/CgHSGNSM+88GoytFuzP4C9szmANjTCNfgKep';
    js.crossOrigin = 'anonymous';
    fjs.parentNode.insertBefore(js, fjs);
  })(document, 'script', 'kakao-js-sdk');
</script>
</html>