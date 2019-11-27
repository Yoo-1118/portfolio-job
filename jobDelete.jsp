<%@page import="job.jobDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//해당 데이터(num)를 jobDAO의 jobDelete(num)를 이용하여 DB에서 삭제합니다.
	jobDAO adao = new jobDAO();
	int num = Integer.parseInt(request.getParameter("num"));
	adao.deleteJob(num);
	
	//해당 데이터 삭제 후에 전체 공고 보는 페이지로 이동
	response.sendRedirect("sessionMain.jsp");
%>
</body>
</html>