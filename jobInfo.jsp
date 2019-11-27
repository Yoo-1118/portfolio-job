<%@page import="job.jobBean"%>
<%@page import="job.jobDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table{
	background-color:#EDFFE7;
}
</style>
</head>
<body>
<center>
<h2> 공고 상세보기 </h2>
<hr>
<%
	request.setCharacterEncoding("utf-8");
	//jobDAO의 getOneJob(num)메소드에 접근하여 공고 정보를 가져와서 출력
	jobDAO adao = new jobDAO();
	int num = Integer.parseInt(request.getParameter("num"));
	jobBean abean = adao.getOneJob(num); 
%>

<table border="1">
	<tr height="60">
		<td width="100" align="center"> 공고명 </td>
		<td width="250" align="center"> 
			<%=abean.getName() %>
		</td>
	</tr>
	<tr height="60">
		<td width="100" align="center"> 모집인원 </td>
		<td width="250" align="center"> 
			<%=abean.getAdmit() %>
		</td>
	</tr>
	<tr height="60">
		<td width="100" align="center"> 성별 </td>
		<td width="250" align="center"> 
			<%=abean.getFm() %> 
		</td>
	</tr>
	<tr height="60">
		<td width="100" align="center"> 시간 </td>
		<td width="250" align="center">
			<%=abean.getTime() %>
		</td>
	</tr>
	<tr height="60">
		<td width="100" align="center"> 급여 </td>
		<td width="250" align="center">
			<%=abean.getPay()%>
		</td>
	</tr>
	<tr height="60">
		<td align="center" colspan="2">
		<input type="button" value="수정하기" onclick="location.href='jobModify.jsp?num=<%=abean.getNum() %>'">
		<input type="button" value="삭제하기" onclick="location.href='jobDelete.jsp?num=<%=abean.getNum() %>'">
		<input type="button" value="목록보기" onclick="location.href='sessionMain.jsp'">
		
		</td>
	</tr>
</table>
</center>
</body>
</html>