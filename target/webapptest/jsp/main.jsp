
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
<script type="text/javascript"	src="<c:url value="/js/jquery.featureCarousel.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.ui.core.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.ui.widget.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.ui.rcarousel.js"/>"></script>

<title>capStuart - main</title>
</head>
<body>
<c:import url="/jsp/navigation.jsp" />									

		<div id="slider">
			<ul>		
			<c:forEach items="${slider}" var="slide">		
				<li><img  src="<c:url value="/${slide.pathToFile}"/>" width="100%" height="600"></li>
			</c:forEach>
			</ul>
		</div>	
<BR>

<div id="content">	
	<div id="carousel">
		<c:forEach items="${sections}" var="section">
		<div style="background:url(<c:url value="/${section.pathToFile}"/>);">
		<h5><span>
		<a href="main/section/${section.id}">${section.name}</a></span></h5>
	
	<style>
	span {
	color			: white;
	font			: bold 20px/40px Helvetica, Sans-Serif;
	letter-spacing		: -1px;
	background		: rgba(0, 0, 0, 0.7);
	padding			: 10px;
}
a {font-size:16px; color:white; font-weight:bold}
a:hover {font-size:16px; color:#ff6600; font-weight:bold}
</style>
		</div>
		</c:forEach>
	</div>
	<a href="#" id="ui-carousel-next"><span>next</span></a>
	<a href="#" id="ui-carousel-prev"><span>prev</span></a>
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
		
		jQuery(function($) {
				$( "#carousel ").rcarousel({
					margin: 10,
					width: 300,
					height: 200
				});
				
				$( "#ui-carousel-next" )
					.add( "#ui-carousel-prev" )
					.hover(
						function() {
							$( this ).css( "opacity", 0.7 );
						},
						function() {
							$( this ).css( "opacity", 0.7 );
						}
					);					
			});
</script>
</html>