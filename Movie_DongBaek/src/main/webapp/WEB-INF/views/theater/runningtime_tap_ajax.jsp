<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<tr>
<c:forEach var="schedule" items="${scheduleList}" varStatus="status" >
<c:choose>
		<c:when test="${status.index eq 0 }" ><td colspan=3><a href="#">${schedule.movie_name_kr }</a></td></c:when>
		<c:when test="${status.index > 0 }" >
		
		<td colspan=3><a href="#">${schedule.movie_name_kr }</a></td></c:when>
</c:choose>		
						</tr>
						<tr>
							<td>${schedule.room_num }관</td>
							<td>
								<button style="height:4em">${schedule.play_start_time }<br>${schedule.end_time }</button>
								
							</td>
						</tr>
</c:forEach>
</tr>


</body>
</html>