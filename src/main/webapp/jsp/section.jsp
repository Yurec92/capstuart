
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>

<head>
<META http-equiv="Content-Type" content="text/html;charset=UTF-8">
<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
<script src="<c:url value="/js/glisse.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery-ui.js"/>"></script>
<script type="text/javascript"	src="<c:url value="/js/bootstrap.min.js"/>"></script>
<link type="text/css" rel="stylesheet" href="<c:url value="/css/glisse.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/app.css"/>"" />
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
		<h3>Section ${section.name}</h3>		
			<c:forEach items="${sectionPhotos}" var="sectionPhoto">
			<img class="item" src="<c:url value="/${sectionPhoto.pathToFile}"/>"  data-glisse-big="<c:url value="/${sectionPhoto.pathToFile}"/>" rel="group1">				
			</c:forEach>		
</div>
</div>
</div>	
	
</body>
<script type="text/javascript">
/*$(document).ready(init);
function init()
{
 $('#imageContainer').hide();
 $('#imageContainera').fadeIn(5000);

}*/
</script>
<script src="/jquery.masonry.min.js"></script>
<script src="/jquery.masonry.js"></script>
<script type="text/javascript">
/*var $container = $('#imageContainer');
$container.imagesLoaded( function(){
  $container.masonry({
    itemSelector : '.item',
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

