<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/site/main" var="api_url" />

<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-inner">
	<a class="brand" href="${api_url}">. capStuart</a>
	
	<ul class="nav">
		<li><a href="${api_url}/gallery">Gallery</a></li>
		<li><a href="${api_url}/blog">Blog</a></li>
		<li><a href="${api_url}/contact">Contacts</a></li>
	</ul>
	<ul class="nav pull-right">
	<li><a border="0" href="http://vkontakte.ru/"><img src="/webapptest/img/vk.jpg"></a></li>
	<li><a border="0" href="http://www.facebook.com"><img src="/webapptest/img/fc.jpg"></a></li>
	</ul>
	
	
	</div>	
	
</div>
<br><br>