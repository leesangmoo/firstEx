<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>

<script language = "javascript"> // 자바 스크립트 시작

function writeCheck()
  {
   var form = document.writeform;
   
   if( !form.id.value )   // form 에 있는 name 값이 없을 때
   {
    alert( "아이디를 적어주세요" ); // 경고창 띄움
    form.id.focus();   // form 에 있는 name 위치로 이동
    return;
   }
   
  if( !form.pw.value )
   {
    alert( "패스워드를 적어주세요" );
    form.pw.focus();
    return;
   }
  if( !form.mbti_type.value )
  {
   alert( "MBTI를 적어주세요" );
   form.mbti_type.focus();
   return;
  }
  if( !form.email.value )
  {
   alert( "이메일을 적어주세요" );
   form.email.focus();
   return;
  }
  if( !form.phone_number.value )
  {
   alert( "핸드폰 번호를 적어주세요" );
   form.phone_number.focus();
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
	ul {
    list-style:none;
}

	li {
	    float: left;
	    margin-right: 20px;
	}
	</style>
<html>
<head>
 <link rel="stylesheet" href="/css/bootstrap.css">
    <title >게시판</title>
</head>
<body>
<header>
	<p style="font-size:30px;color:white;">회원가입<p>
</header>
    <hr />
    <form name="writeform" action="/board/signUp" method="POST">
        <div class="col-sm-12" style="width:60%; float:right;">
            <label style = "font-size:25px"; >아이디</label>
            <input type="text" class="form-control" name="id" 
            class="createForm" placeholder = "아이디" style="width:400px; font-size:20px;">
        </br>
            <label style = "font-size:25px;">패스워드</label>
            <input type="password" name="pw" 
            class="form-control" placeholder = "패스워드"  style="width:400px; font-size:20px;">
        </br>
         	<label style = "font-size:25px";>MBTI</label>
            <input type="text" name="mbti_type" 
            class="form-control" placeholder = "MBTI"  style="width:400px; font-size:20px;">
       	</br>
            <label style = "font-size:25px";>이메일</label>
            <input type="email" name="email" 
            class="form-control" placeholder = "이메일"  style="width:400px; font-size:20px;">
         </br>
            <label style = "font-size:25px";>핸드폰 번호</label>
            <input type="text" name="phone_number" 
            class="form-control" placeholder = "핸드폰 번호"  style="width:400px; font-size:20px;">
        </br>
    </form>
                <button style="width:340px;" type="button" class="btn btn-success"  OnClick="writeCheck()">가입완료</button>
       			<input type=button class="btn btn-danger" value="취소" OnClick="javascript:history.back(-1)">	
        </div>      <!-- 버튼 타입 확인 2번 넘어갈 경우 있음 -->   
        </br>
<!-- 	<div class="col-sm-12" style="left:750px";>
     	<ul>	
			<li><a>아이디 찾기 /</a></li>
     	   <li><a>비밀번호 찾기 /</a></li>
     		<li><a>회원가입 </a></li>
    	</ul>
    </div>  -->    
    
</body>
</html>
