<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// http://localhost:9999/Mission-Web/jsp/board/detail.jsp?no=21
Connection conn = new ConnectionFactory().getConnection();
StringBuilder sql = new StringBuilder();
sql.append("SELECT no, title, writer, content, view_cnt, reg_date ");
sql.append(" FROM t_board ");
sql.append(" where no = ? ");

PreparedStatement pstmt = conn.prepareStatement(sql.toString());
//System.out.print();
pstmt.setString(1, request.getParameter("no"));
ResultSet rs = pstmt.executeQuery();
rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>
</head>
<body>
	<div align="center">
		<hr>
		<h2>게시판 상세</h2>
		<hr>
		<table border="1" style="width:70%">
			<tr>
				<th>번호</th>
				<td><%= rs.getInt("no") %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%= rs.getString("title") %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%= rs.getString("writer") %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><%= rs.getString("content") %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%= rs.getString("view_cnt") %></td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><%= rs.getString("reg_date") %></td>
			</tr>
		</table>
		<br>
		<input type="submit" value="수정">&nbsp;&nbsp;
		<input type="submit" value="삭제">&nbsp;&nbsp;
		<input type="submit" value="목록 돌아가기">&nbsp;&nbsp;
	</div>
</body>
</html>