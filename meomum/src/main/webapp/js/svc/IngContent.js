var svcIngContent;

function svcIngContent() {
var width = 500;
var height = 400;
var left = (window.screen.width / 2) - (width / 2);
var top = (window.screen.height / 2) - (height / 2);
var size = 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top;

var svc_idx = document.getElementById("svc_idx").value;

window.name = "a_svcIngContent";
var url = "asvcIngContent.do?svc_idx="+svc_idx;

svcIngContent = window.open(url,'Ingpopup',size);
}
