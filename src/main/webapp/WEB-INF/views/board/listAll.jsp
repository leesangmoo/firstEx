<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

<body>
<div id="wrap">
		<aside id="sidebar">
			<li style= "color:white;">Side Menu</li>
	<c:choose>
		<c:when test="${msg == fail}">
			<ul>
				<button type = "button" class="btn_t1 btn-success" OnClick="window.location='/board/login'">로그인</button>
				<button type = "button" class="btn_t1 btn-success" OnClick="window.location='/board/signUp'">회원가입</button>
				<br/>	<br/>	<br/>	<br/>
				<li style= "color:white;">공지사항</li>	</br>
				<li style= "color:white;">시스템 문의</li>
			</ul>
		</c:when>
		<c:otherwise>
			<ul>
				<h2 style= "color:white;">ID : ${sessionScope.id}</h2>
				<button type = "button" class="btn_t1 btn-success" OnClick="window.location='/board/logout'">로그아웃</button>
				<br/>	<br/>	<br/>	<br/>
				<li style= "color:white;">공지사항</li>	</br>
				<li style= "color:white;">시스템 문의</li>
			</ul>
		</c:otherwise>
	</c:choose>			
			<button><span class="btn_t">MENU</span></button>
		</aside>
	</div>
<header>
	<p style="font-size:30px;color:white;">작성 목록<p>
</header>
<hr />
    <table class="table table-striped table-hover" border="1px" width="50%" align="center">
        <tr>
            <th style="width:5%">No.</th>
			<th style="width:10%">작성자</th>
            <th style="width:20%">제목</th>
            <th style="width:20%">내용</th>
            <th style="width:17%">날짜</th>
            <th style="width:5%">조회수</th>
            <th style="width:10%">상세 보기</th>
        </tr>
    <c:forEach items="${boardList}" var="BoardVO">
        <tr>
            <td>${BoardVO.bno}</td>
            <td>${BoardVO.writer}</td>
            <td>${BoardVO.title}</a></td>
            <td>${BoardVO.content}</td>
            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${BoardVO.now_date }" /> </td>
            <td><span> ${BoardVO.hit}</span> </td>
            <td><a href="/board/detail?bno=${BoardVO.bno}">상세보기</a></td>
        </tr>
    </c:forEach>
    </table>
<input type=button class="btn btn-success" style="width:80px; border-radius:0.5em; padding: 10px; float:right;
     margin-right: 1px;" value="글쓰기" OnClick="window.location='/board/create'"> 
</body>
</html>
