<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
session.setAttribute("no", request.getParameter("no"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
<link rel="stylesheet" href="/kopo-Mission-Web/resource/css/layout.css">
<link rel="stylesheet" href="/kopo-Mission-Web/resource/css/table.css">
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<hr>
		<h2>글 수정</h2>
		<hr>
		<form action="updateProcess.jsp" method="post">
			<input type="submit" value="수정완료">
		</form>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp"%>
	</footer>
</body>
</html>


