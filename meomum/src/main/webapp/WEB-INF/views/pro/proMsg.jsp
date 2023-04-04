<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% if (request.getAttribute("confirm") != null) { %>
<script>
if(confirm('${msg}')) {
location.href='${link}';
} else {
var pro_idx=<%=request.getAttribute("pro_idx")%>;
location.href="proContent.do?pro_idx="+pro_idx;
}
</script>
<% } else { %>
<script>
alert('${msg}');
location.href='${link}';
</script>
<% } %>