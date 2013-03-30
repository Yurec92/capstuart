
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>

<head>
<META http-equiv="Content-Type" content="text/html;charset=UTF-8">
<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery-ui.js"/>"></script>
<script type="text/javascript"	src="<c:url value="/js/bootstrap.min.js"/>"></script>
<link type="text/css" rel="stylesheet" media="all"	href="<c:url value="/css/jquery-ui.css"/>" />
<link type="text/css" rel="stylesheet" media="all"	href="<c:url value="/css/style.css"/>" />
<link type="text/css" rel="stylesheet" media="all"	href="<c:url value="/css/bootstrap.min.css"/>" />

<title>capStuart - main</title>
</head>
<body>
<div class="container content">
	<div class="container-fluid">
		<div class="row-fluid">
		<c:import url="/jsp/navigation.jsp" />									
		<h3>Main page</h3>
		<h2>Groups</h2>
		<table>
			<tr>
			<c:forEach items="${groups}" var="group">
						<td><a href="main/group/${group.id}">${group.name}</td>							
			</c:forEach>
			</tr>
		</table>


		<h2>Sections</h2>
		<table>
			<tr>
			<c:forEach items="${sections}" var="section">
						<td><a href="main/section/${section.id}">${section.name}</td>							
			</c:forEach>
			</tr>
		</table>
		</div>
	</div>
</div>
</body>
</html>