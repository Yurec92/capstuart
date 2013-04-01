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
		<li>
			<div class="yashare-auto-init" data-yashareL10n="ru" data-yashareType="icon" 
				data-yashareQuickServices="vkontakte,facebook,twitter,lj">
			</div> 
		</li>
	</ul>
	</div>	
</div>
<br><br>


<script type="text/javascript" src="//yandex.st/share/share.js" charset="utf-8"></script>
