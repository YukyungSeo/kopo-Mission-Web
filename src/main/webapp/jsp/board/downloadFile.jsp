<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=UTF-8");

String filePath = "D:/Lecture/web-workspace/kopo-Mission-Web/src/main/webapp/upload/";
String fileName = request.getParameter("fileSaveName");
String downFile = filePath + fileName;
System.out.println("fileName=" + fileName);

File file = new File(downFile);

if(file.exists() && file.isFile()){
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Content-disposition", "attachment; fileName=" + fileName);
	
	FileInputStream fin = new FileInputStream(file);
	//byte[] buffer = new byte[1024*8];
	
	while(true){
		int count = fin.read();
		if(count == -1)
			break;
		out.write(count);
	}
	
	fin.close();
}
%>