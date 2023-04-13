
/**견적 추가할때 팝업*/

var svcPopup;

function svcIng() {
  var width = 500; 
  var height = 600;
  var left = (window.screen.width / 2) - (width / 2);
  var top = (window.screen.height / 2) - (height / 2);
  var size = 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top;
  
  window.name = "a_svcContent";
  svcPopup = window.open("asvcIngPopup.do",'popup',size);
 }





