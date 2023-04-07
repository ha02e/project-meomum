
function svcIng() {
  var width = 500; 
  var height = 600;
  var left = (window.screen.width / 2) - (width / 2);
  var top = (window.screen.height / 2) - (height / 2);
  var size = 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top;
  window.open('asvcIngPopup.do', 'popup', size);
}

