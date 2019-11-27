<%@page import="job.jobBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="job.jobDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.tab{
	display:fixed; 
	float:left;
	border:1px solid black;
	line-height:40px;
	text-align:center;
	border-spacing:10px 10px;
	background-color:#EDFFE7;
	margin-left:12px;
	margin-bottom:12px;
	margin-top:10px;
	font-size:20px;
	text-decoration:none;
}
</style>
</head>
<body>
<center>
 <%
	jobDAO adao = new jobDAO();
	ArrayList<jobBean> V = adao.getAllJob();
	for(int i=0; i < V.size(); i++){
		//ArrayList로 부터 빈즈클래스를 하나씩 꺼내서 출력합니다.
		jobBean abean = V.get(i);
%>

	<table class="tab">
		<tr><td width="210"><a href = "jobInfo.jsp?num=<%=abean.getNum()%>"> 
							<%= abean.getName() %>
							</a><br>
		모집인원 : <%= abean.getAdmit() %><br>
		성별 : <%= abean.getFm() %><br>
		시간 : <%= abean.getTime() %><br>
		급여 : <%= abean.getPay() %></td></tr>	 
	</table>
	 <%
	 	}
	 %>
</center>
</body>
</html>