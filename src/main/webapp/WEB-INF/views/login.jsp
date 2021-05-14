<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/login/login.jsp"></jsp:include>
</head>
<body style="background-color: #666666;">
<div class="limiter">
<div class="container-login100">
<div class="wrap-login100">
<form class="login100-form validate-form">
<span class="login100-form-title p-b-43">
EZENPLAY
</span>
<div class="wrap-input100 validate-input" >
<input class="input100" type="text" id="userId">
<span class="focus-input100"></span>
<span class="label-input100">ID</span>
</div>
<div class="wrap-input100 validate-input" >
<input class="input100" type="password" id="userPwd">
<span class="focus-input100"></span>
<span class="label-input100">Password</span>
</div>
<div class="flex-sb-m w-full p-t-3 p-b-32">
<div class="contact100-form-checkbox">
</div>
<div>
<a href="/views/findidpwd" class="txt1">
아이디/비밀번호 찾기
</a>
</div>
</div>
<div class="container-login100-form-btn">
<button type="button"  onclick="login()" class="login100-form-btn" style="margin-top:10px; background-color:#8484ff;">
로그인
</button>
<button type="button" onclick="goPage();" class="login100-form-btn" style="margin-top:10px; background-color:#6060ff;">
회원가입 
</button>
</div>
</form>
<div class="login100-more" style="background-image: url('/resources/images/home/ezenpc6.jpg');">
</div>
</div>
</div>
</div>
</body>
<script>
function goPage(){
	location.href="/views/join"
}
</script>
<script src="/resources/js/logindi.js"></script><!-- 로그인로그아웃로직 -->
</html>