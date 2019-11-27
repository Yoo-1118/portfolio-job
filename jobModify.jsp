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
<h2> 공고 수정 </h2>
<hr>
<%
	request.setCharacterEncoding("utf-8");
	jobDAO adao = new jobDAO();
	int num = Integer.parseInt(request.getParameter("num"));
	jobBean abean = adao.getOneJob(num);
%>
<form action="jobModifyProc.jsp" method="post">
<table border="1">
	<tr height="60">
		<td width="100" align="center"> 공고명 </td>
		<td width="250" align="center"> 
		<input type="text" value="<%=abean.getName() %>" name="name">
		</td>
	</tr>
	<tr height="60">
		<td width="100" align="center"> 모집인원 </td>
		<td width="250" align="center"> 
		<input type="text" value="<%=abean.getAdmit() %>" name="admit">
		</td>
	</tr>
	<tr height="60">
		<td width="100" align="center"> 성별 </td>
		<td width="250" align="center">
				<select name="fm">
					<option selected><%=abean.getFm() %></option>
					<option value="여">여</option>
					<option value="남">남</option>
					<option value="성별무관">성별무관</option>
				</select>
		</td>
	</tr>
	<tr height="60">
		<td width="100" align="center"> 시간 </td>
		<td width="250" align="center">
		<input type="text" value="<%=abean.getTime() %>" name="time">
		</td>
	</tr>
	<tr height="60">
		<td width="100" align="center"> 급여 </td>
		<td width="250" align="center">
		<input type="text" value="<%=abean.getPay() %>" name="pay">
		</td>
	</tr>
	<tr height="60">
		<td align="center" colspan="2">
		<input type="hidden" name="num" value="<%=abean.getNum() %>">
		<input type="submit" value="글 수정 확인">
		<input type="button" value="HOME" onclick="location.href='sessionMain.jsp'">
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>