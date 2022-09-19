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
				event.preventDefault();
				location.href = "/board/listAll";
			})
		})
	
	</script>
	<body>
	
		<div id="root">
		<header>
	<p style="font-size:30px;color:white;">게시글 수정<p>
</header>
			<hr />
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/board/update">
					<input type="hidden" name="bno" value="${update.bno}" readonly="readonly"/>
				 <div class="col-sm-12" align="center">
									<label for="writer">작성자</label>
									<input type="text" class="form-control" id="writer" name="writer" style="width:800px; font-size:20px; text-align: center;" value="${update.writer}"/>
						</div>
						 <div class="col-sm-12" align="center">
									<label for="mbti_type">MBTI</label>
									<input type="text" class="form-control" id="mbti_type" name="mbti_type" style="width:800px; font-size:20px; text-align: center;" value="${update.mbti_type}"/>
						</div>
						 <div class="col-sm-12" align="center">
									<label for="title">제목</label>
									<input type="text" class="form-control" id="title" name="title" style="width:800px; font-size:20px; text-align: center;" value="${update.title}"/>
							</div>
						 <div class="col-sm-12" align="center">
									<label for="content">내용</label>
									<textarea id="content" class="form-control" name="content" style="width:800px;  height:200px; font-size:20px;text-align: center;"><c:out value="${update.content}" /></textarea>
	 						</div>
	 						<div class="col-sm-12" align="center">
									<label for="regdate">작성날짜</label>
									<fmt:formatDate value="${update.now_date}" pattern="yyyy-MM-dd"/>					
						</div>
					<div class="col-sm-12" align="center">
						<button type="submit" class="btn btn-success" class="update_btn">저장</button>
						<button type="submit" class="btn btn-danger" class="cancel_btn">취소</button>
					</div>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>