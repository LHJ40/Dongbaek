<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="../js/jquery-3.6.1.js"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
			//날짜입력 
            $(function() {
                let y = new Date();
                y.setDate(y.getDate()-1);
                let str = y.getFullYear() + "-"
                + ("0" + (y.getMonth() + 1)).slice(-2) + "-"
                + ("0" + y.getDate()).slice(-2);
                $("#date").attr("max",str);

                // 확인버튼 클릭 이벤트 => API로 정보 가져옴
                $("#mybtn").click(function() {
                    let d = $("#date").val(); //선택날짜값 YYYY-MM-DD 형태로 받음
                    const regex = /-/g; //정규표현식으로 - 제거
                    let d_str = d.replace(regex,"") // YYYYMMDD (d_str에저장)

                    let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt="+d_str
					//targetDt="+d_str -> 해당날짜의 정보 가져옴
                     $.getJSON(url, function(data) {
                         let movieList = data.boxOfficeResult.dailyBoxOfficeList;
                         $("div").empty();
                         $("div").append(d+" 박스 오피스 순위<br>");
                         for(let i in movieList){
                             $("div").append("<span id= '"+movieList[i].movieCd + "'>" +(parseInt(i)+1) + " " + movieList[i].movieNm+"/"+movieList[i].audiAcc + "명 " + "</span><hr>" );
                         }
                        });
                });//click
            });//ready
        </script>

</head>
<body>
<input type="date" id="date"><button id="mybtn">확인</button>
<div id="boxoffice">
    박스 오피스 순위<br>
</div>
</body>
</html>