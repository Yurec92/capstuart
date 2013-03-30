<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
<h3>Main page</h3>
<table>
	<tr>
	<c:forEach items="${groups}" var="group">
				<td>${group.name}</td>							
	</c:forEach>
	</tr>
</table>

</body>
</html>