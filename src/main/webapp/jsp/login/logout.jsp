<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
session.invalidate();
response.sendRedirect("/kopo-Mission-Web");
%>
<!-- <script type="text/javascript">
	location.href = "/kopo-Mission-Web";
</script> -->