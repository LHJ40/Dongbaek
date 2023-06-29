<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
	
<link
	href="${pageContext.request.contextPath }/resources/css/default.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/resources/css/sidebar.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/resources/css/button.css"
	rel="stylesheet" type="text/css">
	
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <!-- 차트 링크 -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<title>영화 예매 사이트</title>
<style>

div {
background-color: transparent;
}

<%-- 페이징 색상변경 --%>
.page-link {
  color: #000; 
  background-color: #fff;
  border: 1px solid #ccc; 
}

.page-item.active .page-link {
 z-index: 1;
 color: #555;
 font-weight:bold;
 background-color: #f1f1f1;
 border-color: #ccc;
 
}

.page-link:focus, .page-link:hover {
  color: #000;
  background-color: #fafafa; 
  border-color: #ccc;
}

/* 제목 글자 설정*/
#adminTitle {
  color:#000000;
  font-weight: bold;
  font-size: 32px;
  /* 타이틀그라디언트 효과*/
  background: linear-gradient(to right, #270a09, #8ca6ce);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

<%-- a링크 활성화 색상 변경 --%>
a:hover, a:active{
 color:  #ff5050 !important;
	
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


</head>
<body>
 <header id="pageHeader">
 <%--네비게이션 바 영역 --%>
  <%@ include file="../inc/header.jsp"%>
 </header>
 
  <article id="mainArticle">
  <%--본문내용 --%>
  
<div class="container-fluid w-900" >

	 <br> <br> <br>
	 <div id="adminTitle">관리자 페이지</div><br>
	  <div class="d-flex justify-content-center">
		<h4>환영합니다 ${sessionScope.member_id }님!</h4>
	  </div>
	  <%-- 막대 & 곡선 차트 --%>
      <div class="row my-2">
          <div class="col-md-6">
              <div class="card">
                  <div class="card-body">
                      <canvas class="myChart"></canvas>
                  </div>
                  <div class="card-body text-center text-align-center">
                    <h3>일일 회원가입 수/ 예매 수</h3>
                  </div>
              </div>
          </div>
<!--       </div> -->
<!--        <div class="row my-2"> -->
			<%-- 원형 차트 --%>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <canvas id="chDonut1"></canvas>
                    </div>
                    <div class="card-body text-center text-align-center">
                    <h3>영화 당 일일 예매율</h3>
                  </div>
                </div>
            </div>
<!-- 	       <div class="col-md-4 py-1"> -->
<!-- 	           <div class="card"> -->
<!-- 	               <div class="card-body"> -->
<!-- 	                   <canvas id="chDonut2"></canvas> -->
<!-- 	               </div> -->
<!-- 	           </div> -->
<!-- 	       </div> -->
       </div>
<!--             <div class="col-md-4 py-1"> -->
<!--                 <div class="card"> -->
<!--                     <div class="card-body"> -->
<!--                         <canvas id="chDonut3"></canvas> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
  </div>
  <!-- 부트스트랩 -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
  <!-- 차트 -->
  <script>
  
  	
  
  const mydata = [10, 20, 30, 40]; // 일일 회원가입 수 변수
  const mydataHalf = [5, 10, 20, 7]; // 일일 예매 수 변수
  // var ctx = document.getElementById("myChart");
  var ctx = document.getElementsByClassName("myChart");
  


  var mixedChart = {
    type: 'bar',
    labels: ['1', '2', '3', '4'],
    datasets : [
      {
        label: '일일 회원가입 수',
        data : mydata,
        backgroundColor: 'rgba(256, 0, 0, 0.1)'
      },
      {
        label: '일일 예매 율',
        data: mydataHalf,
        backgroundColor: 'transparent',
        borderColor: 'skyblue',
        type: 'line'
      }
    ]
    };
    var myChart = new Chart(ctx, {
      type: 'bar',
      data: mixedChart,
      options: {
        legend: {
          display: true
        }
      }
    });
    // var myChart = new Chart(ctx, {
    //   type: 'bar',
    //   data: mixedChart,
    //   options: {
    //     legend: {
    //       display: true
    //     }
    //   }
    // });
    
    
    // chart colors
	var colors = ['red','skyblue','yellowgreen','#c3e6cb','#dc3545','#6c757d'];
	
	/* 3 donut charts */
	var donutOptions = {
	  cutoutPercentage: 50, //도넛두께 : 값이 클수록 얇아짐
	  legend: {position:'bottom', padding:5, labels: {pointStyle:'circle', usePointStyle:true}}
	};
	
	// donut 1
	var chDonutData1 = {
	    labels: ['Bootstrap', 'Popper', 'Other'],
	    datasets: [
	      {
	        backgroundColor: colors.slice(0,3),
	        borderWidth: 0,
	        data: [74, 11, 40]
	      }
	    ]
	};
	
	var chDonut1 = document.getElementById("chDonut1");
	  if (chDonut1) {
	    new Chart(chDonut1, {
	      type: 'pie',
	      data: chDonutData1,
	      options: donutOptions
	  });
	}
	
	// donut 2
	var chDonutData2 = {
	    labels: ['Wips', 'Pops', 'Dags'],
	    datasets: [
	      {
	        backgroundColor: colors.slice(0,3),
	        borderWidth: 0,
	        data: [40, 45, 30]
	      }
	    ]
	};
	var chDonut2 = document.getElementById("chDonut2");
	  if (chDonut2) {
	    new Chart(chDonut2, {
	      type: 'pie',
	      data: chDonutData2,
	      options: donutOptions
	  });
	}
	
	// donut 3
	var chDonutData3 = {
	    labels: ['Angular', 'React', 'Other'],
	    datasets: [
	      {
	        backgroundColor: colors.slice(0,3),
	        borderWidth: 0,
	        data: [21, 45, 55, 33]
	      }
	    ]
	};
	var chDonut3 = document.getElementById("chDonut3");
	  if (chDonut3) {
	    new Chart(chDonut3, {
	      type: 'pie',
	      data: chDonutData3,
	      options: donutOptions
	  });
	} 
  </script>
	
	
	

       
		

  
  </article>
  

  <%--왼쪽 사이드바 --%>
	<nav id="mainNav" class="d-none d-md-block sidebar">
		<%@ include file="/WEB-INF/views/sidebar/sideBar.jsp"%>
	</nav>
  
	<div id="siteAds"></div>
	<%--페이지 하단 --%>
	<footer id="pageFooter"><%@ include
			file="../inc/footer.jsp"%></footer>
			

</body>