<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String name = request.getParameter("name");
String password = request.getParameter("password");
String emailId = request.getParameter("email_id");
String emailDomain = request.getParameter("email_domain");
String tel1 = request.getParameter("tel1");
String tel2 = request.getParameter("tel2");
String tel3 = request.getParameter("tel3");
String post = request.getParameter("post");
String basicAddr = request.getParameter("basic_addr");
String detailAddr = request.getParameter("detail_addr");
String type = request.getParameter("type");
String regDate = request.getParameter("reg_date");

MemberVO member = new MemberVO(id, name, password, emailId, emailDomain, tel1, tel2, tel3, post, basicAddr, detailAddr, type, regDate);

MemberDAO dao = new MemberDAO();
dao.insertMember(member);
%>
<script>
	alert("회원가입이 완료되었습니다.");
	location.href="list.jsp";
</script>