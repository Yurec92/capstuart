
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>

<head>
<META http-equiv="Content-Type" content="text/html;charset=UTF-8">
<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery-ui.js"/>"></script>
<script type="text/javascript"	src="<c:url value="/js/bootstrap.min.js"/>"></script>
<link type="text/css" rel="stylesheet" media="all"	href="<c:url value="/css/jquery-ui.css"/>" />
<link type="text/css" rel="stylesheet" media="all"	href="<c:url value="/css/style.css"/>" />
<link type="text/css" rel="stylesheet" media="all"	href="<c:url value="/css/bootstrap.min.css"/>" />
<link type="text/css" rel="stylesheet" media="all"	href="<c:url value="/css/screen.css"/>" />
<script type="text/javascript" src="<c:url value="/js/easySlider1.7.js"/>"></script>
<link type="text/css" rel="stylesheet" media="all"	href="<c:url value="/css/my.css"/>" />



<title>capStuart - main</title>
</head>
<body>
<c:import url="/jsp/navigation.jsp" />									
		<div id="slider">
			<ul>		
			<c:forEach items="${slider}" var="slide">		
				<li><img  src="<c:url value="/${slide.pathToFile}"/>" width="1280" height="600"></li>
			</c:forEach>
			</ul>
		</div>
<br>		

<div class="container-fluid">	
		<c:forEach items="${sections}" var="section">
		<div class="span3 img1" id="razdel">
			<a href="#"><img src="<c:url value="/${section.pathToFile}"/>" width="300" id="imgsection"></a>		
		<h5 id="hover"><a href="main/section/${section.id}">${section.name}</a></h5>			
		
		</div>
		
		</c:forEach>
</div>
<c:import url="/jsp/footer.jsp" />
</body>
<script type="text/javascript">
		$(document).ready(function(){	
			$("#slider").easySlider({
				auto: true, 
				continuous: true,
				pause:2800,
				numeric: false
			});
		});	
</script>
</html>