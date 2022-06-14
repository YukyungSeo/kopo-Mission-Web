<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String no = request.getParameter("no");

BoardDAO dao = new BoardDAO();
dao.updateViewCnt(Integer.parseInt(no));

response.sendRedirect("detail.jsp?no=" + no);
%>