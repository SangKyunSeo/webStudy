<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

* {
  box-sizing: border-box;
}

/* style the container */
.container {
  position: relative;
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px 0 30px 0;
} 

/* style inputs and link buttons */
input{
  width: 100%;
  padding: 12px;
  border-radius: 4px;
  margin: 5px 0;
  opacity: 0.85;
  display: inline-block;
  font-size: 17px;
  line-height: 20px;
  text-decoration: none; /* remove underline from anchors */
}
.btn {
  width: 100%;
  padding: 12px;
  border: none;
  border-radius: 4px;
  margin: 5px 0;
  opacity: 0.85;
  display: inline-block;
  font-size: 17px;
  line-height: 20px;
  text-decoration: none; /* remove underline from anchors */
}

input:hover,
.btn:hover {
  opacity: 1;
}

/* add appropriate colors to fb, twitter and google buttons */
.fb {
  background-color: #3B5998;
  color: white;
}

.twitter {
  background-color: #55ACEE;
  color: white;
}

.google {
  background-color: #dd4b39;
  color: white;
}

/* style the submit button */
input[type=button] {
  background-color: #04AA6D;
  color: white;
  cursor: pointer;
  border: none;
}

input[type=button]:hover {
  background-color: #45a049;
}

/* Two-column layout */
.col {
  float: left;
  width: 50%;
  margin: auto;
  padding: 0 50px;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* vertical line */
.vl {
  position: absolute;
  left: 50%;
  transform: translate(-50%);
  border: 2px solid #ddd;
  height: 175px;
}

/* text inside the vertical line */
.vl-innertext {
  position: absolute;
  top: 50%;
  transform: translate(-50%, -50%);
  background-color: #f1f1f1;
  border: 1px solid #ccc;
  border-radius: 50%;
  padding: 8px 10px;
}

/* hide some text on medium and large screens */
.hide-md-lg {
  display: none;
}

/* bottom container */
.bottom-container {
  text-align: center;
  background-color: #666;
  border-radius: 0px 0px 4px 4px;
}

/* Responsive layout - when the screen is less than 650px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 650px) {
  .col {
    width: 100%;
    margin-top: 0;
  }
  /* hide the vertical line */
  .vl {
    display: none;
  }
  /* show the hidden text on small screens */
  .hide-md-lg {
    display: block;
    text-align: center;
  }
}
</style>
</head>
<body>

<div class="container" style="max-width:800px;margin:auto">
  <form name="form1"action="/login" method="POST">
    <div class="row">
      <h2 style="text-align:center">로그인</h2>

   
        <input type="text" name="memberId" id="memberId" placeholder="이메일" required>
        <span id="emailChk"></span>
        <input type="password" name="memberPw" id="memberPw" placeholder="비밀번호" required>
        <span id="pwChk"></span>
        <input type="button" id="btnLogin" value="로그인">
      	 <c:if test="${msg == 'Error'}">
           <div style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.
           </div>
        </c:if>
        <c:if test="${msg == 'logout'}">
         <div style="color:red;"> 로그아웃되었습니다.
         </div>
        </c:if>
    </div>
  </form>
</div>
<div class="bottom-container" style="max-width:800px;margin:auto">
  <div class="row">
    <div class="col">
      <a href="/register" style="color:white" class="btn">회원가입</a>
    </div>
    <div class="col">
      <a href="#" style="color:white" class="btn">Forgot password?</a>
    </div>
  </div>
</div>

</body>
<script>
	$(function(){
		$("#btnLogin").click(function(){
			var memberId=$("#memberId").val();
			var memberPw=$("#memberPw").val();
			var chk1 = false;
			var chk2 = false;
			if(memberId==""||memberId==''||memberId==null){
				$("#emailChk").html('<b style="font-size: 14px; color: red"> [이메일을 입력해주세요]</b>');
			    chk1 = false;
			}else chk1 = true;
			
			if(memberPw==""||memberPw==''||memberPw==null){
				$("#pwChk").html('<b style="font-size: 14px; color: red"> [비밀번호를 입력해주세요]</b>');
			    chk2 = false;
			}else chk2 = true;
			
			if(chk1 && chk2){
				document.form1.action= "/loginCheck";
				document.form1.submit();
			}
		});
	});
</script>
</html>


