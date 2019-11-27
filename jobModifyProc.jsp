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
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="abean" class="job.jobBean"/>
	<jsp:setProperty name="abean" property="*"/>
<%
	//jobDAO를 이용하여 해당 데이터(num)를 테이블에 서 업데이트 합니다.(jobModify(abean))
	jobDAO adao = new jobDAO();
	adao.modifyJob(abean);
	
	//수정후에, 메인으로 이동하여 수정 내용 확인합니다.
	response.sendRedirect("sessionMain.jsp");
%>
</body>
</html>