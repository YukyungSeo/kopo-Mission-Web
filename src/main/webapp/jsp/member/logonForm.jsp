<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function (){
		$('#listBtn').click(function (){
			location.href = 'list.jsp';
		})
	})
	
	function checkForm(){
		let f = document.logonForm;
		
		if(f.id.value === ''){
			alert("아이디를 입력하세요");
			f.id.focus();
			return false;
		}
		
		if(f.name.value === ''){
			alert("이름을 입력하세요");
			f.name.focus();
			return false;
		}
		
		if(f.password.value === ''){
			alert("비밀번호를 입력하세요");
			f.password.focus();
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>
	<div align="center">
		<hr>
			<h2>회원가입 등록폼</h2>
		<hr>
		<br>
		<form action="logon.jsp" method="post" name="logonForm" onsubmit="return checkForm()">
			<table border="1" style="width: 80%">
				<tr>
					<th width="25%">아이디</th>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<th width="25%">이름</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th width="25%">비밀번호</th>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<th width="25%">이메일</th>
					<td>
						<input type="text" name="email_id" size="10"> @
						<input type="text" name="email_domain" size="10">
						</td>
				</tr>
				<tr>
					<th width="25%">전화번호</th>
					<td>
						<input type="tel" name="tel1" size="5"> -
						<input type="tel" name="tel2" size="5"> -
						<input type="tel" name="tel3" size="5">
					</td>
				</tr>
				<tr>
					<th width="25%">주소</th>
					<td>
						<input type="text" name="post"  size="5" placeholder="우편번호"><br>
						<input type="text" name="basic_addr" placeholder="기본 주소"><br>
						<input type="text" name="detail_addr" placeholder="상세 주소">
					</td>
				</tr>
				<tr>
					<th>타입</th>
					<td>
					<select name="type">
						<option value="U">User</option>
						<option value="M">Manager</option>
					</select>
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="등록">
			<input type="reset" value="초기화">
			<button type="button" id="listBtn">목록</button>
		</form>
	</div>
</body>
</html>