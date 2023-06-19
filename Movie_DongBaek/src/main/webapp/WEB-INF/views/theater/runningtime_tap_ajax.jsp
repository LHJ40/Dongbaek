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
<!-- 관람등급 -->
<c:set var="all" value='<img src="${pageContext.request.contextPath }/resources/img/grade_all.png" alt="전체">' />
<c:set var="g_12" value='<img src="${pageContext.request.contextPath }/resources/img/grade_12.png" alt="12">' />
<c:set var="g_15" value='<img src="${pageContext.request.contextPath }/resources/img/grade_15.png" alt="15">' />
<c:set var="g_18" value='<img src="${pageContext.request.contextPath }/resources/img/grade_18.png" alt="18">' />

<c:forEach var="schedule" items="${scheduleList}" varStatus="status" >

<c:choose>
		<c:when test="${status.index eq 0 }" >
		<tr>
			<th colspan=2>
			<c:if test="${schedule. movie_grade eq '전체관람가'}">${all}</c:if>
			<c:if test="${schedule. movie_grade eq '12세이상관람가'}">${g_12}</c:if>
			<c:if test="${schedule. movie_grade eq '15세이상관람가'}">${g_15}</c:if>
			<c:if test="${schedule. movie_grade eq '청소년관람불가'}">${g_18}</c:if>
			${schedule.movie_name_kr }
			</th><td colspan=4>${schedule.movie_genre}/${schedule.movie_running_time}분/${schedule.movie_release_date} 개봉</td>
		</tr>
		<tr>
			<td>${schedule.room_name }</td>
			<td>
				<button style="height:5em">
				<c:if test="${schedule.play_time_type eq '조조'}">${morning}</c:if>
				<c:if test="${schedule.play_time_type eq '심야'}">${night}</c:if>
				${schedule.play_start_time}<br>~${schedule.end_time}</button>
			</td>
		
		</c:when>
		<c:when test="${status.index > 0 }" >
		
		<c:if test="${scheduleList[status.index-1].movie_name_kr eq schedule.movie_name_kr}">
			<c:if test="${scheduleList[status.index-1].room_name ne schedule.room_name }">
			</tr>
			<tr>
				<td>${schedule.room_name }</td>
				
			</c:if>
			<td>
				<button style="height:5em">
				<c:if test="${schedule.play_time_type eq '조조'}">${morning}</c:if>
				<c:if test="${schedule.play_time_type eq '심야'}">${night}</c:if>
				${schedule.play_start_time }<br>~${schedule.end_time }</button>
			</td>
		</c:if>	
		
		<c:if test="${scheduleList[status.index-1].movie_name_kr ne schedule.movie_name_kr }">
		</tr>
		<tr><th colspan=2>
			<c:if test="${schedule. movie_grade eq '전체관람가'}">${all}</c:if>
			<c:if test="${schedule. movie_grade eq '12세이상관람가'}">${g_12}</c:if>
			<c:if test="${schedule. movie_grade eq '15세이상관람가'}">${g_15}</c:if>
			<c:if test="${schedule. movie_grade eq '청소년관람불가'}">${g_18}</c:if>
		${schedule.movie_name_kr }</th><td colspan=4>${schedule.movie_genre}/${schedule.movie_running_time}분/${schedule.movie_release_date} 개봉</td>
		
		</tr>
		<tr><td>${schedule.room_name }</td>
		<td><button style="height:5em">
		<c:if test="${schedule.play_time_type eq '조조'}">${morning}</c:if>
		<c:if test="${schedule.play_time_type eq '심야'}">${night}</c:if>
		${schedule.play_start_time }<br>~${schedule.end_time }</button></td>
		</c:if>
		
		
		</c:when>
		
</c:choose>		
						
</c:forEach>

</body>
</html>