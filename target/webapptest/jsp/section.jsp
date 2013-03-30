
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
<link type="text/css" rel="stylesheet" media="all"	href="<c:url value="/css/my.css"/>" />
<title>capStuart - section</title>
</head>
<body>
<div class="container content">
	<div class="container-fluid">
		<div class="row-fluid">
		<c:import url="/jsp/navigation.jsp" />		
		<div class="navbar">
				<div class="navbar-inner">		
				<ul class="nav">
					<c:forEach items="${groups}" var="gr"><li>
					<td><a href="${api_url}/group/${gr.id}">${gr.name}</a></td>							
				</li>
				<li class="divider-vertical"></li></c:forEach>
				</ul>
				</div>			
			</div>
		<h3>Section ${section.name}</h3>
		<table>
			<tr>
			<c:forEach items="${sectionPhotos}" var="sectionPhoto">
						<td><img src="<c:url value="/${sectionPhoto.pathToFile}"/>" width="150" height="150"></td>							
			</c:forEach>
			</tr>
		</table>
		</div>
	</div>
</div>
</body>
</html>