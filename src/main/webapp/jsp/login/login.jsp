<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/kopo-Mission-Web/resource/css/layout.css">
<link rel="stylesheet" href="/kopo-Mission-Web/resource/css/table.css">
<script src="/kopo-Mission-Web/resource/js/myJS.js"></script>
<script>
	function checkForm() {
		let f = document.loginForm;

		if (isNull(f.id, "아이디를 입력하세요") || isNull(f.password, "패스워드를 입력하세요"))
			return false;

		return true;
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
			<hr>
			<h2>로그인</h2>
			<hr>
			<form action="loginProcess.jsp" method="post"
				onsubmit="return checkForm()" name="loginForm">
				<table style="width: 40%">
					<tr>
						<th>ID</th>
						<td><input type="text" name="id"></td>
					</tr>
					<tr>
						<th>PASSWORD</th>
						<td><input type="password" name="password"></td>
					</tr>
				</table>
				<br> <input type="submit" value="로그인">
			</form>
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp"%>
	</footer>
</body>
</html>