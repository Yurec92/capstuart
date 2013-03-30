
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<META http-equiv="Content-Type" content="text/html;charset=utf-8">
<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery-ui.js"/>"></script>
<script type="text/javascript"	src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script type="text/javascript"	src="<c:url value="/js/bootstrap-datepicker.js"/>"></script>
<link type="text/css" rel="stylesheet" media="all"	href="<c:url value="/css/jquery-ui.css"/>" />
<link type="text/css" rel="stylesheet" media="all"	href="<c:url value="/css/style.css"/>" />
<link type="text/css" rel="stylesheet" media="all"	href="<c:url value="/css/my.css"/>" />
<link type="text/css" rel="stylesheet" media="all"	href="<c:url value="/css/bootstrap.min.css"/>" />
<c:url value="/site/main" var="api_url" />
<link type="text/css" rel="stylesheet" media="all"	href="<c:url value="/css/my.css"/>" />
<title>Gallery - photoCap</title>
</head>
<body>
<div class="container content">
	<div class="container-fluid">
		<div class="row-fluid">
		<c:import url="/jsp/navigation.jsp" />	
			<h3>My portfolio</h3>
			<table>
				<tr>
				<c:forEach items="${groups}" var="group">
					<td><a href="${api_url}/group/${group.id}">${group.name}</a></td>							
				</c:forEach>
				</tr>
				<tr>
				<c:forEach items="${photos}" var="photo">
					<td><img src="<c:url value="/${photo.pathToFile}"/>" width="150" height="150"></td>							
				</c:forEach>
				</tr>
			</table>
		</div>
	</div>
</div>
</body>
</html>

