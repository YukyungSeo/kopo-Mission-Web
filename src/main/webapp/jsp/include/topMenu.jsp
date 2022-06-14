<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table border="1" style="width: 100%">
	<tr>
		<td rowspan="2" style="height: 45px; width: 150px;">
			<a href="/kopo-Mission-Web"> 
				<img alt="logo"
				src="/kopo-Mission-Web/resource/images/logo.jpg"
				style="height: 45px; width: 150px;">
			</a>
		</td>
		<td align="right">즐겨찾기 <c:if test="${ not empty user }">
				[${ user.name }님이 접속하였습니다]
			</c:if>
		</td>
	</tr>
	<tr>
		<td>
			<nav>
				<c:if test="${ user.type eq 'S' }">
					<a href="/kopo-Mission-Web/jsp/member/list.jsp">회원관리</a> | 
				</c:if>
				
				<a href="/kopo-Mission-Web/jsp/board/list.jsp">게시판</a> | 
				
				<c:choose>
					<c:when test="${ empty user }">
						<a href="/kopo-Mission-Web/jsp/member/logonForm.jsp">회원가입</a> | 
						<a href="/kopo-Mission-Web/jsp/login/login.jsp">로그인</a> | 
					</c:when>
					<c:otherwise>
						마이페이지 | 
						<a href="/kopo-Mission-Web/jsp/login/logout.jsp">로그아웃</a>
					</c:otherwise>
				</c:choose>
			</nav>
		</td>
	</tr>
</table>