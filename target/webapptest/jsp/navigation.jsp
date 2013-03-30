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
	<table align="center"><tr>
	<td><li><a border="0" href="http://vkontakte.ru/share.php?url=http%3A%2F%2Fwww.photocap.ru%2F"><img src="http://www.akm.ru/rus/img/img_odnaknopka/112.gif"></a></li></td>
	<td><li><a border="0" href="http://www.facebook.com?url=http%3A%2F%2Fwww.photocap.ru%2F"><img src="http://www.akm.ru/rus/img/img_odnaknopka/113.gif"></a></li></td>
	</ul>
	</tr>
	</table>
	
	</div>	
	
</div>
<br><br>