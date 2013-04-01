
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<META http-equiv="Content-Type" content="text/html;charset=utf-8">
<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
<script src="<c:url value="/js/glisse.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery-ui.js"/>"></script>
<script type="text/javascript"	src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script type="text/javascript"	src="<c:url value="/js/bootstrap-datepicker.js"/>"></script>
<link type="text/css" rel="stylesheet" href="<c:url value="/css/glisse.css"/>" />
<!--><link rel="stylesheet" href="<c:url value="/css/app.css"/>"" /><-->
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
			<div class="navbar">
				<div class="navbar-inner">		
				<ul class="nav">
					<c:forEach items="${groups}" var="group"><li>
					<td><a href="${api_url}/group/${group.name}">${group.name}</a></td>							
				</li>
				<li class="divider-vertical"></li></c:forEach>
				</ul>
				</div>			
			</div>

		</div>
	</div>          
			<c:forEach items="${photos}" var="photo">
			<img class="item" src="<c:url value="/${photo.pathToFile}"/>" data-glisse-big="<c:url value="/${photo.pathToFile}"/>"  rel="group1">					
			</c:forEach>
</div>
</body>
<script type="text/javascript">

function init()
{
 //$('#container content').hide();
 //$('#container content').fadeIn(5000);
  /*       $(".yoxview").yoxview({
            videoSize: { maxwidth: 720, maxheight: 560 }
        });
}*/

</script>
<script src="/js/jquery.yoxview-2.21.min.js"></script>

<script src="/jquery.masonry.min.js"></script>
<script src="/jquery.masonry.js"></script>
<script type="text/javascript">
/*var $container = $('#container content');
$container.imagesLoaded( function(){
  $container.masonry({
    itemSelector : '.pics',
  });
});*/

$(function () {
    $('.item').glisse({
        changeSpeed: 550, 
        speed: 500,
        effect:'fade'
    }); 
});

</script>
</html>

