<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 <link rel="stylesheet" href="/css/bootstrap.css">
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	
	 	<title>게시판</title>
	
	</head>
	
	<style type = "text/css">
		header {
			height : 100px;
			background-color: black;
		}
	
	</style>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			$(".cancel_btn").on("click", function(){
				window.history.back();
			})
		})
	</script>
	<script type="text/javascript">
	// 삭제
	function del(bno) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='deleteP?bno='+ bno;
		}
	}	
			</script>
	<body>
	
<header>
	<p style="font-size:30px;color:white;">게시글 상세 보기<p>
</header>
			<hr />
			
				<form name="updateForm" role="form" method="post" action="/board/update">
						<table class="table table-striped table-hover" border="1px" width="600px" align="center"border="1" align="center">
						<tr>						 
									<td width="300px" align="center">작성자</td>
									<td width="300px" align="center">${detail.writer}</td>
						</tr>
						 <tr>						 
									<td width="300px" align="center">제목</td>
									<td width="300px" align="center">${detail.title}</td>
						</tr>
						 <tr>						 
									<td width="300px" align="center">내용</td>
									<td width="300px" align="center">${detail.content}</td>
						</tr>
						<tr>
									<td width="300px" align="center">작성 날짜</td>
									<td width="300px" align="center"><fmt:formatDate value="${detail.now_date}" pattern="yyyy-MM-dd"/></td>					
						</tr>
						 <tr>						 
									<td width="300px" align="center">조회수</td>
									<td width="300px" align="center">${detail.hit}</td>
						</tr>
						</table>
					<div class="col-sm-12" align="center">
						<button class="btn btn-success"class="cancel_btn">뒤로 가기</button>
						 <!-- <td><a href="/board/updateView?bno=${detail.bno}">수정</a></td> --> 
            			 <!-- <td><a href="/board/delete?bno=${detail.bno}">삭제</a></td>--> 
            			  <input type="button" class="btn btn-success" value="수정" onclick="location.href='/board/updateView?bno=${detail.bno}'">
            			  <input type="button" class="btn btn-danger" value="삭제" onclick="location.href='/board/delete?bno=${detail.bno}'">
            			 <!-- <input type="button" value="삭제" onclick="del(${detail.bno})"> --> 
					</div>
				</form>
			<hr />
	</body>
</html>