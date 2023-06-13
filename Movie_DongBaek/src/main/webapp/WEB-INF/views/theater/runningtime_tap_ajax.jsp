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

<!-- 심야/조조 -->
<c:set var="morning" value='<img src="${pageContext.request.contextPath }/resources/img/sun.png" alt="해" width="15px"> 조조' />
<c:set var="night" value='<img src="${pageContext.request.contextPath }/resources/img/moon.png" alt="달" width="15px"> 심야' />
<c:forEach var="schedule" items="${scheduleList}" varStatus="status" >

<c:choose>
		<c:when test="${status.index eq 0 }" >
		<tr>
			<th colspan=6>${schedule.movie_name_kr }</th>
		</tr>
		<tr>
			<td>${schedule.room_num }</td>
			<td>
				<button style="height:5em">
				<c:if test="${schedule.play_start_time eq '08:00:00'}">${morning}</c:if>
				<c:if test="${schedule.play_start_time eq '21:30:00'}">${night}</c:if>
				${schedule.play_start_time}<br>~${schedule.end_time}</button>
			</td>
		
		</c:when>
		<c:when test="${status.index > 0 }" >
		
		<c:if test="${scheduleList[status.index-1].movie_name_kr eq schedule.movie_name_kr}">
			<c:if test="${scheduleList[status.index-1].room_num ne schedule.room_num }">
			</tr>
			<tr>
				<td>${schedule.room_num }</td>
				
			</c:if>
			<td>
				<button style="height:5em">
				<c:if test="${schedule.play_start_time eq '08:00:00'}">${morning}</c:if>
				<c:if test="${schedule.play_start_time eq '21:30:00'}">${night}</c:if>
				${schedule.play_start_time }<br>~${schedule.end_time }</button>
			</td>
		</c:if>	
		
		<c:if test="${scheduleList[status.index-1].movie_name_kr ne schedule.movie_name_kr }">
		</tr>
		<tr><th colspan=6>${schedule.movie_name_kr }<th></tr>
		<tr><td>${schedule.room_num }</td>
		<td><button style="height:5em">
		<c:if test="${schedule.play_start_time eq '08:00:00'}">${morning}</c:if>
		<c:if test="${schedule.play_start_time eq '21:30:00'}">${night}</c:if>
		${schedule.play_start_time }<br>~${schedule.end_time }</button></td>
		</c:if>
		
		
		</c:when>
		
</c:choose>		
						
</c:forEach>

</body>
</html>