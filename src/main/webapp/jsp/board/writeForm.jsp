<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/kopo-Mission-Web/resource/css/layout.css">
<link rel="stylesheet" href="/kopo-Mission-Web/resource/css/table.css">
<script src="/kopo-Mission-Web/resource/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('#listBtn').click(function() {
			location.href = 'list.jsp';
		});
	});
	
	function checkForm(){
		let f = document.writeForm;
		
		if(f.title.value === ''){
			alert('제목을 입력하세요');
			f.title.focus();
			return false;
		}
		
		if(f.writer.value === ''){
			alert('작성자를 입력하세요');
			f.writer.focus();
			return false;
		}
		
		if(f.content.value === ''){
			alert('작성자를 입력하세요');
			f.content.focus();
			return false;
		}
		
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
			<h2>새 글 등록폼</h2>
			<hr>
			<br>
			<form action="write.jsp" method="post" name="writeForm" onsubmit="return checkForm()">
				<table border="1" style="width: 100%">
					<tr>
						<th width="25%">제목</th>
						<td><input type="text" name="title" size="80"></td>
					</tr>
					<tr>
						<th width="25%">작성자</th>
						<td><input type="text" name="writer"></td>
					</tr>
					<tr>
						<th width="25%">내용</th>
						<td><textarea rows="5" cols="80" name="content"></textarea></td>
					</tr>
				</table>
				<br> <input type="submit" value="새글등록">&nbsp;&nbsp;
				<button type="button" id="listBtn">목록</button>
			</form>
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>