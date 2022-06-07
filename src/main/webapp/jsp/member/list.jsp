<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = new ConnectionFactory().getConnection();
StringBuffer sql = new StringBuffer();

sql.append("select id, name, password, email_id, email_domain, ");
sql.append(" tel1, tel2, tel3, post, basic_addr, detail_addr, type, ");
sql.append(" to_char(REG_DATE, 'YYYY-MM-DD') as reg_date ");
sql.append(" from t_member ");
sql.append(" order by name ");

PreparedStatement pstmt = conn.prepareStatement(sql.toString());
ResultSet rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 회원 조회</title>
</head>
<body>
	<div align="center">
		<hr>
		<h2>전체 회원 조회</h2>
		<hr>

		<table border="1" style="width: 90%">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>비밀번호</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>타입</th>
				<th>등록일</th>
			</tr>
			<%
			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("id")%></td>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("password")%></td>
				<td><%=rs.getString("email_id")%>@<%=rs.getString("email_domain")%></td>
				<td><%=rs.getString("tel1")%>-<%=rs.getString("tel2")%>-<%=rs.getString("tel3")%></td>
				<td><%=rs.getString("basic_addr")%>&nbsp;<%=rs.getString("detail_addr")%>&nbsp;<%=rs.getString("post")%></td>
				<td><%=rs.getString("type")%></td>
				<td><%=rs.getString("reg_date")%></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</body>
</html>

<%
JDBCClose.close(pstmt, conn);
%>