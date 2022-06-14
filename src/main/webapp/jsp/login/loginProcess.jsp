<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String password = request.getParameter("password");

MemberVO member = new MemberVO();
member.setId(id);
member.setPassword(password);

MemberDAO dao = new MemberDAO();
MemberVO user = dao.login(member);

String msg = "";
String url = "";
if (user == null) {
	// 로그인 실패
	msg = "아이디 또는 패스워드를 잘못입력했습니다";
	url = "login.jsp";
} else {
	// 로그인 성공
	switch(user.getType()){
	case "S":
		msg = "관리자님 환영합니다";
		break;
	case "U":
		msg = user.getId() + "님 환영합니다";
		break;
	}
	url = "/kopo-Mission-Web";
	
	// 세션 등록
	session.setAttribute("user", user);
}

pageContext.setAttribute("msg", msg);
pageContext.setAttribute("url", url);
%>

<script>
	alert('${ msg }');
	location.href = '${ url }';
</script>