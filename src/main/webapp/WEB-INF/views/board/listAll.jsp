<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<script src="https://kit.fontawesome.com/efbc78230f.js" crossorigin="anonymous"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.css">
<title>List</title>

</head>
<style type = "text/css">
	header {
		height : 100px;
		background-color: black;
	}
	#wrap {
		width:100%;
		height:100px;
		background:white;
	}
	#sidebar {
		background: #333;
		width: 300px;
		height: 100%;
		top: 0;
		left: -300px;
		position: fixed;
	}
	#sidebar > ul {
		margin:0;
		padding: 0;
		top:50px;
		left:70px;
		position: absolute;
	}
	#sidebar li {
		margin: 0 0 20px;
		list-style: none;
	}
	#sidebar > button {
		background:#333;
		position: absolute;
		top: 20px;
		left: 300px;
		width: 100px;
		height: 50px;
		border: none;
		color: white;
	}
 </style>
 <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <script type="text/javascript">
    $(function(){
		var duration = 500;
		var $side = $('#sidebar');
		var $sidebt = $side.find('.btn_t').on('click', function(){
			$side.toggleClass('open');
			if($side.hasClass('open')) {
				$side.stop(true).animate({left:'0px'}, duration);
				$side.find('.btn_t').text('CLOSE');
			}else{
				$side.stop(true).animate({left:'-300px'}, duration);
				$side.find('.btn_t').text('MENU');
			};
		});
	});
</script>
<script language = "javascript"> // 자바 스크립트 시작
function startSearch()
  {
   var form = document.searchform;
   
   if( !form.mbti_type.value )   // form 에 있는 name 값이 없을 때
   {
    alert( "MBTI 유형을 적어주세요" ); // 경고창 띄움
    form.mbti_type.focus();   // form 에 있는 name 위치로 이동
    return;
   }
   else{
   	    $.ajax({
			url : "/board/ajaxSearch",
			type : "GET",
			data : {"mbti_type" : $("#mbti_type").val() },
			//data : $("form[name=searchform]").serialize(),
			success : function(responseData){
				//테이블 초기화
				$('#tbody').empty();
				if(responseData.length>=1){
					responseData.forEach(function(item){
						str='<tr>'
						str += "<td>"+item.bno+"</td>";
						str+="<td>"+item.writer+"</td>";
						str+="<td>"+item.mbti_type+"</td>";
						str+="<td>"+item.title+"</td>";
						str+="<td>"+item.content+"</td>";
						str+="<td>"+item.hit+"</td>";
						str+="<td><a href = '/board/detail?bno=" + item.bno + "'>상세보기</a></td>";
						str+="</tr>"
						$('#tbody').append(str);
	        		});				 
				   }
			     }
			    }).fail(function(e){
			    	alert("검색에 실패했습니다.");
			    	form.mbti_type.focus();
		  //form.submit();
		});
  	  }
   }
</script>
 <script type="text/javascript">

 $(document).ready(function() {
      let weatherIcon = {
        '01' : 'fas fa-sun',
        '02' : 'fas fa-cloud-sun',
        '03' : 'fas fa-cloud',
        '04' : 'fas fa-cloud-meatball',
        '09' : 'fas fa-cloud-sun-rain',
        '10' : 'fas fa-cloud-showers-heavy',
        '11' : 'fas fa-poo-storm',
        '13' : 'far fa-snowflake',
        '50' : 'fas fa-smog'
      };

   $.ajax({
    url:'http://api.openweathermap.org/data/2.5/weather?q=seoul&APPID=b22edd39d0f3ed394d569a629f6e1081&units=metric',
    dataType:'json',
    type:'GET',
    success:function(data){
       var $Icon = (data.weather[0].icon).substr(0,2);
       var $Temp = Math.floor(data.main.temp) + 'º';
       var $city = data.name;

       $('.CurrIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>');
       $('.CurrTemp').prepend($Temp);
       $('.City').append($city);
      }
     })
    });
  </script>

<body>
<div id="wrap">
		<aside id="sidebar">
			<li style= "color:white;">what is your mbti</li>
	<c:choose>
		<c:when test="${msg == fail}">
			<ul>
				<button type = "button" class="btn_t1 btn-success" OnClick="window.location='/board/login'">로그인</button>
				<button type = "button" class="btn_t1 btn-success" OnClick="window.location='/board/signUp'">회원가입</button>
				<br/>	<br/>	<br/>	<br/>
				<li style= "color:white;">공지사항</li>	</br>
				<li style= "color:white;">시스템 문의</li>  </br>
				<li style= "color:yellow;">현재 날씨</li>
			 <div class="weather">
      			<div class="CurrIcon" style="color:yellow"></div>
      			<div class="CurrTemp" style="color:yellow"></div>
      			<div class="City" style="color:yellow"></div>
			 </div>
			</ul>
		</c:when>
		<c:otherwise>
			<ul>
				<h2 style= "color:white;">ID : ${sessionScope.id}</h2>
				<button type = "button" class="btn_t1 btn-success" OnClick="window.location='/board/logout'">로그아웃</button>
				<br/>	<br/>	<br/>	<br/>
				<li style= "color:white;">공지사항</li>	</br>
				<li style= "color:white;">시스템 문의</li>
				<div class="weather">
      			<div class="CurrIcon" style="color:yellow"></div>
      			<div class="CurrTemp" style="color:yellow"></div>
      			<div class="City" style="color:yellow"></div>
			 </div>
			</ul>
		</c:otherwise>
	</c:choose>			
			<button><span class="btn_t">MENU</span></button>
		</aside>
	</div>
<header>
	<p style="font-size:60px;color:white;"align = "center">Story By MBTI<p>
</header>
<hr />
<form name="searchform" class="form-inline" autocomplete="off"> 
 	<div class="container-fluid row justify-content-center align-items-center">
		<input type="text" id="mbti_type" name="mbti_type" class="form-control"
             placeholder = "검색 EX)INFJ"  style="width:300px; font-size:20px;">  
	 	<button type="button" id="searchbtn" class="btn btn-primary" onclick="startSearch()">검색</button>
	</div>
</form>
<br>
 <table  id="boardtable" class="table table-striped table-hover" border="1px" width="50%" align="center">
        <tr>
            <th style="width:5%">No.</th>
			<th style="width:10%">작성자</th>
			<th style="width:20%">MBTI</th>
            <th style="width:20%">제목</th>
            <th style="width:20%">내용</th>
            <th style="width:5%">조회수</th>
            <th style="width:10%">상세 보기</th>
        </tr>
        <tbody id="tbody">
        
        </tbody>
    </table>
<div id="container" style="width: 200px; height:10px; background-color:hidden;"></div>
<!--             <div class="mx-quto input-group mt-5">
                <mx-auto>
                    <input name="query" type="text" class="form-control" placeholder="검색어 입력" aria-label="search" aria-describedby="button-addon2">
                </mx-auto>
                <button class="btn btn-success" type="submit" id="button-addon2">검색</button>
            </div> -->
<input type=button class="btn btn-success" style="width:80px; border-radius:0.5em; padding: 10px; float:right;
     margin-right: 1px;" value="글쓰기" OnClick="window.location='/board/create'"> 
<input type=button class="btn btn-warning" style="width:80px; border-radius:0.5em; padding: 10px; float:right;
     margin-right: 1px;" value="전체글" OnClick="window.location='/board/listAllView'"> 
</body>
</html>
