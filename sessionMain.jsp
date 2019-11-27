<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<table width=900 >
	<!-- top.jsp -->
	<tr height=110>
		<td width=800 colspan=2>
			<jsp:include page="sessionTop.jsp"/>
		</td>
	</tr>
	<!-- list.jsp -->
	<tr height=200>
		<td width=600 align=center>
			<jsp:include page="jobList.jsp"/>
		</td>
	</tr>
</table>
</center>
</body>
</html>