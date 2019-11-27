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
<%request.setCharacterEncoding("utf-8");%>
<center>
<hr>
<!-- 
	입력내용은 빈즈클래스(addrBean)에 저장
	빈즈클래스를 이용하여 출력(테이블 형태로)
 -->
 <jsp:useBean id="abean" class="job.jobBean">
 	<jsp:setProperty name="abean" property="*" />
 </jsp:useBean>
 
 <% 
 	jobDAO adao = new jobDAO();
 	adao.insertJob(abean);
 %>
 
 <!-- 
 	테이블 태그를 이용하여, 빈즈클래스에 내용을 출력해 줌 (입력내용 확인 !!)
  -->
 <h2> 공고가 성공적으로 등록되었습니다. </h2>
 <table border="1">
	<tr height="50">
		<td width="100" align="center"> 공고명 </td>
		<td width="250" align="center"> 
			<%= abean.getName() %>
		</td>
	</tr>
	<tr height="60">
		<td width="100" align="center"> 모집인원 </td>
		<td width="250" align="center"> 
			<%= abean.getAdmit() %>
		</td>
	</tr>
	<tr height="60">
		<td width="100" align="center"> 성별 </td>
		<td width="250" align="center"> 
			<%= abean.getFm() %> 
		</td>
	</tr>
	<tr height="60">
		<td width="100" align="center"> 시간 </td>
		<td width="250" align="center">
			<%= abean.getTime() %>
		</td>
	</tr>
	<tr height="60">
		<td width="100" align="center"> 급여 </td>
		<td width="250" align="center">
			<%= abean.getPay() %>
		</td>
	</tr>
</table>
<br>
<a href="sessionMain.jsp"> HOME </a>

</center>
</body>
</html>