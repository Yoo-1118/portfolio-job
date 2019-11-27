<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.allro{
	align:center;
	font-size:20px;
}
#logokan{
	background-color:#B7F0B1;
}
#menukan{
	background-color:#B7F0B1;
}
img{
	align:center;
	margin-left:300px;
}
td{
	font-family:"돋움";
}
</style>
</head>
<body>
<center>
<table width="1000" class="allro">
<tr height="140" id="logokan"><td colspan=5><img src="logo.png" alt="tistory_logo" width="400px" height="100px"></td></tr>
<tr height="80" id="menukan"><!-- 메뉴가 들어간다 -->
	<td align="center" width="100"><a href="#">홈 </a></td>
	<td align="center" width="110"><a href="jobForm.jsp">공고 등록</a></td>
	<td align="center" width="110"><a href="#">지원한 알바 </a></td>
	<td align="center" width="110"><a href="resume.jsp">이력서</a></td>
	<td align="center" width="80">
		<%
			//logout이 1이면 session을 초기화해준다. -> id=null
			String logout = request.getParameter("logout");
			if(logout != null){
				session.setAttribute("id",null);
				session.setMaxInactiveInterval(0);
			}
			String id = (String)session.getAttribute("id");
			if(id==null){
				id="손님";
			}
			if(id.equals("손님")){
		%>
			<%=id %>님<input type="button"value="로그인"
						onclick="location.href='sessionLoginProc.jsp'"> 
		<%
			}
			else{
		%>
			<%=id %>님<input type="button"value="로그아웃"
						onclick="location.href='sessionMain.jsp?logout=1'">
		<%
			}
		%>
	</td>
</tr>
</table>
</center>
</body>
</html>