<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>

<script language = "javascript"> // 자바 스크립트 시작

function writeCheck()
  {
   var form = document.writeform;
   
   if( !form.writer.value )   // form 에 있는 name 값이 없을 때
   {
    alert( "이름을 적어주세요" ); // 경고창 띄움
    form.writer.focus();   // form 에 있는 name 위치로 이동
    return;
   }
   if( !form.mbti_type.value )
   {
    alert( "MBTI를 적어주세요" );
    form.mbti_type.focus();
    return;
   }
  if( !form.title.value )
   {
    alert( "제목을 적어주세요" );
    form.title.focus();
    return;
   }
 
  if( !form.content.value )
   {
    alert( "내용을 적어주세요" );
    form.content.focus();
    return;
   }
 
  form.submit();
  }
 </script>
<style type = "text/css">
	header {
		height : 100px;
		background-color: black;
	}
	
	</style>
<html>
<head>
 <link rel="stylesheet" href="/css/bootstrap.css">
    <title >게시판</title>
</head>
<body>
<header>
	<p style="font-size:30px;color:white;">게시글 작성<p>
</header>
    <hr />
    <form name="writeform" action="/board/create" method="POST">
        <div class="col-sm-12" align="center">
            <label >작성자</label>
            <input type="text" class="form-control" name="writer" 
            class="createForm" placeholder = "작성자" style="width:800px; font-size:20px;">
        </div>
         <div class="col-sm-12" align="center">
            <label >MBTI</label>
            <input type="text" class="form-control" name="mbti_type" 
            class="createForm" placeholder = "MBTI" style="width:800px; font-size:20px;">
        </div>
        <div class="col-sm-12" align="center">
            <label >제목</label>
            <input type="text" name="title" 
            class="form-control" placeholder = "제목"  style="width:800px; font-size:20px;">
        </div>
        <div class="col-sm-12" align="center">
            <label >내용</label>
            <textarea rows="4" cols="15" name="content" 
            class="form-control"placeholder = "내용"  style="width:800px; height:300px; font-size:20px;"></textarea>
        </div>
    </form>
    <div class="col-sm-12" align="center">
                <button type="button" class="btn btn-success"  OnClick="writeCheck()">작성하기</button>
       			<input type=button class="btn btn-danger" value="취소" OnClick="javascript:history.back(-1)">	
        </div>      <!-- 버튼 타입 확인 2번 넘어갈 경우 있음 -->   

</body>
</html>
