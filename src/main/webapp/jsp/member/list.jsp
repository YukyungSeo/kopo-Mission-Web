<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
List<MemberVO> list = new MemberDAO().selectAll();
pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 회원 조회</title>
<link rel="stylesheet" href="/kopo-Mission-Web/resource/css/layout.css">
<link rel="stylesheet" href="/kopo-Mission-Web/resource/css/table.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function (){
	$('#logonBtn').click(function (){
		location.href = 'logonForm.jsp';
	})
})
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
			<hr>
			<h2>전체 회원 조회</h2>
			<hr>
	
			<table border="1" style="width: 100%">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>타입</th>
					<th>등록일</th>
				</tr>
				
				<c:forEach items="${ list }" var="member">
					<tr>
						<td>${ member.id }</td>
						<td><a href="detail.jsp?id=${ member.id }"><c:out value="${ member.name }" /></a></td>
						<td><c:out value="${ member.emailId }@${ member.emailDomain }" /></td>
						<td>${ member.type }</td>
						<td>${ member.regDate }</td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<input id="logonBtn" type="button" value="회원추가">
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>