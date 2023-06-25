<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	
</script>

<div class="sidebar-sticky">
	<h1> 마이페이지 </h1>
  		<ul class="nav flex-column">
  			<c:if test="${member_type != '비회원'}">
	    		<li class="nav-item">
	      			<a class="nav-link" href="myPage">마이페이지<span class="sr-only">(current)</span></a>
	    		</li>
    		</c:if>
    		<li class="nav-item">
      			<a class="nav-link" href="myPage_reservation_history">나의 예매내역<span class="sr-only">(current)</span></a>
    		</li>
    		<hr>
    		<li class="nav-item">
      			<a class="nav-link" href="myPage_buy_history">나의 구매내역<span class="sr-only">(current)</span></a>
    		</li>
    		<hr>
    		<c:if test="${member_type != '비회원'}">
	    		<li class="nav-item">
	      			<a class="nav-link" href="myPage_myReview">나의 리뷰<span class="sr-only">(current)</span></a>
	    		</li>
	    		<hr>
    		<li class="nav-item">
      			<a class="nav-link" href="myPage_like">찜한 영화<span class="sr-only">(current)</span></a>
    		</li>
    		<hr>
	    		<li class="nav-item">
	      			<a class="nav-link" href="myPage_inquiry">문의내역<span class="sr-only">(current)</span></a>
	    		</li>
	    		<hr>
	    		<li class="nav-item">
	      			<a class="nav-link" href="myPage_grade">나의 멤버십 등급<span class="sr-only">(current)</span></a>
	    		</li>
	    		<hr>
	    		<li class="nav-item">
	      			<a class="nav-link" href="myPage_modify_check">개인정보 수정<span class="sr-only">(current)</span></a>
	    		</li>
	    		<hr>
   			</c:if>

  		</ul>
</div>