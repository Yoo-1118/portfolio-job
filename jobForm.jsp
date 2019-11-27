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
<form action="jobProc.jsp" method="post">
<h2> 공고 등록하기 </h2><hr>
	<table border="1" width="600">
		<tr height="60">
			<td width="200" align="center">공고명</td>
			<td width="200" align="center">
			<input type="text" name="name" style="width:200px;"></td>
		</tr>
		<tr height="60">
			<td width="200" align="center">모집인원</td>
			<td width="250" align="center">
			<input type="text" name="admit" style="width:200px;"></td>
		</tr>
		<tr height="60">
			<td width="100" align="center">성별</td>
			<td width="250" align="center">
				<select name="fm">
					<option value="여">여</option>
					<option value="남">남</option>
					<option value="성별무관">성별무관</option>
				</select>
			</td>
		</tr>
		<tr height="60">
			<td width="200" align="center">시간</td>
			<td width="550" align="center">
			<input type="text" name="time" style="width:200px;"></td>
		</tr>
		<tr height="60">
			<td width="200" align="center">급여</td>
			<td width="250" align="center">
			<input type="text" name="pay" style="width:200px;"></td>
		</tr>
		<tr height="60">
			<td colspan="2" align="center">
				<input type="submit" value="확인">
				<input type="reset" value="취소">			
			</td>
		</tr>
	</table>
</form>
</center>
</body>
</html>