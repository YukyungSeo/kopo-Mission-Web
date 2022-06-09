<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
MemberVO member = new MemberDAO().selectById(request.getParameter("id"));
pageContext.setAttribute("member", member);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 회원 조회</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function onAction(type){
		switch(type){
		case 'U':
			location.href="update.jsp?id=${ member.id }";
			break;
		case 'D':
			location.href="delete.jsp?id=${ member.id }";
			break;
		case 'L':
			location.href="list.jsp";
			break;
		}
	}
</script>
</head>
<body>
	<div align="center">
		<hr>
		<h2>회원 상세</h2>
		<hr>

		<table border="1" style="width: 90%">
			<tr>
				<th>아이디</th>
				<td>${ member.id }</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><c:out value="${ member.name }" /></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><c:out value="${ member.password }" /></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><c:out value="${ member.emailId }@${ member.emailDomain }" /></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${ member.tel1 }-${ member.tel2 }-${ member.tel3 }</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><c:out
						value="${ member.basicAddr } ${ member.detailAddr } ${ member.post }" /></td>
			</tr>
			<tr>
				<th>타입</th>
				<td>${ member.type }</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${ member.regDate }</td>
			</tr>
		</table>
		<br> 
		<button onclick="onAction('U')">수 정</button>
		<button onclick="onAction('D')">삭 제</button>
		<button onclick="onAction('L')">목 록</button>
	</div>
</body>
</html>