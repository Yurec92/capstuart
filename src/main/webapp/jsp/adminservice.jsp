
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
<title>capStuart - adminpage</title>
</head>
<body>
<c:import url="/jsp/navigation.jsp" />
<div class="container content">
<h2>Admin Service</h2>
<div class="row-fluid">
<div class="span6">
<form id="addSectionForm" name="addSectionForm" action="adminservice/newsection" method="POST" enctype="multipart/form-data">
<h3>Создание нового раздела</h3>
<h5>Имя раздела:</h5><input type="text" name="name">
<br>
<h5>Фотография раздела:</h5><input type="file" name="fileOfImage">
<br><br>
<input type="submit" value="Add" name="lala1" class="btn btn-info">
</form>
</div>
<div class="span6">
<form id="addGroupForm" name="addGroupForm" action="adminservice/newgroup" method="POST" enctype="multipart/form-data">
<h3>Создание новой группы</h3>
<h5>Имя группы:</h5><input type="text" name="name">
<br><br>
<input type="submit" value="Add" name="lala2" class="btn btn-info">
</form>
</div>
</div>

<div class="row-fluid">
<div class="span6">
<form id="addImageForm" name="addImageForm" action="adminservice/newimage" method="POST" enctype="multipart/form-data">
<h3>Загрузка фото в галерею</h3>
<input type="file" name="fileOfImage">
<h5>Выберите группу:</h5>
<select id="idOfGroup" name="idOfGroup">
			<c:forEach items="${groups}" var="group">
			<option value="${group.id}">${group.name}</option>
			</c:forEach>
</select>
<BR>
<h5>Выберите раздел:</h5>
<select id="idOfSection" name="idOfSection">
			<c:forEach items="${sections}" var="section">
			<option value="${section.id}">${section.name}</option>
			</c:forEach>
</select>
<br><br>
<input type="submit" value="Add" name="lala3" class="btn btn-info">
</form>
</div>

<div class="span6">
<form id="addSliderImageForm" name="addSliderImageForm" action="adminservice/newsliderimage" method="POST" enctype="multipart/form-data">
<h3>Загрузка фото в слайдер</h3>
<input type="file" name="fileOfImage">
<br><br>
<input type="submit" value="Add" name="lala4" class="btn btn-info">
</form>
</div>
</div>


<div class="row-fluid">
<div class="span6">
<form id="delImageForm" name="delImageForm" action="adminservice/delimg" method="GET">
<h3>Удаление фото из галереи</h3>
<h5>Выберите фото:</h5>
<select id="delImg" name="delImg">
			<c:forEach items="${images}" var="image">
			<option value="${image.name}">${image.name}</option>
			</c:forEach>
</select>
<br><br>
<input type="submit" value="Delete" name="lala4" class="btn btn-info">
</form>
</div>

<div class="span6">
<form id="delSliderImageForm" name="delSliderImageForm" action="adminservice/delsliderimg" method="GET">
<h3>Удаление фото из слайдера</h3>
<h5>Выберите фото:</h5>
<select id="delSlider" name="delSlider">
			<c:forEach items="${sliders}" var="slider">
			<option value="${slider.name}">${slider.name}</option>
			</c:forEach>
</select>
<br><br>
<input type="submit" value="Delete" name="lala4" class="btn btn-info">
</form>
</div>
</div>

<div class="row-fluid">
<div class="span6">
<form id="delImageForm" name="delImageForm" action="adminservice/delsection" method="GET">
<h3>Удаление разделa</h3>
<h5>Выберите раздел:</h5>
<select id="delSection" name="delSection">
			<c:forEach items="${sections}" var="section">
			<option value="${section.name}">${section.name}</option>
			</c:forEach>
</select>
<br><br>
<input type="submit" value="Delete" name="lala4" class="btn btn-info">
</form>
</div>

<div class="span6">
<form id="delGroupForm" name="delGroupForm" action="adminservice/delgroup" method="GET">
<h3>Удаление группы</h3>
<h5>Выберите группу:</h5>
<select id="delGroup" name="delGroup">
			<c:forEach items="${groups}" var="group">
			<option value="${group.name}">${group.name}</option>
			</c:forEach>
</select>
<br><br>
<input type="submit" value="Delete" name="lala4" class="btn btn-info">
</form>
</div>
</div>



</br>
</br>
</div>
</div>
</body>
</html>