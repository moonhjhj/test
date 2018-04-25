<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.javaex.vo.GuestbookVo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>
	<form action="/guestbook3/add" method="post">
		<table border=1 width=500>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
				<td>비밀번호</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td colspan=4><textarea name="content" cols=60 rows=5></textarea></td>
			</tr>
			<tr>
				<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
			</tr>
		</table>
	</form>
	<br />
	<c:forEach items = "${list}" var = "vo">
	<table width=510 border=1>
		<tr>
			<td>${vo.no}</td>
			<td>${vo.name}</td>
			<td>${vo.reg_date}</td>
			<td><a href="/guestbook3/gb?a=deleteform&no=${vo.no }">삭제</a></td>
		</tr>
		<tr>
			<td colspan=4>${vo.content }<br /></td>
		</tr>
	</table>
	<br />
	</c:forEach>
<!-- 	<table width=510 border=1> -->
<!-- 		<tr> -->
<!-- 			<td>[1]</td> -->
<!-- 			<td>황일영</td> -->
<!-- 			<td>2017-01-15</td> -->
<!-- 			<td><a href="">삭제</a></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td colspan=4>안녕하세요<br />두번째글입니다. -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 	</table> -->
<!-- 	<br /> -->
</body>
</html>