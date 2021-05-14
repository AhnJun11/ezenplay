<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><!-- 회원가입화면임; -->
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/home/maintemplethead.jsp"></jsp:include><!-- 상단바로고디자인 -->
<jsp:include page="/WEB-INF/views/home/maintempletbar.jsp"></jsp:include><!-- 상단바와 로고 -->

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<style rel="stylesheet" href="/resources/css/join.css"></style>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>

<body>
 <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.html">Home</a></li>
          <li>회원가입</li>
        </ol>
      </div>
    </section><!-- End Breadcrumbs -->



<div class="container">
	<div class="row">
    <div class="col-md-8">  
		<h2 style="margin-left: 70px;">회원가입</h2><br><br><br>
         <form class="form-horizontal" enctype="multipart/form-data" action="/memberjoin" method="post">
         <div class="form-group">
          <label class="control-label col-sm-3" for="id">아이디 입력 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <input type="text" class="form-control" name="userId" id="id" placeholder="4자리~10자리" onchange="idChack=false;">
        <small>아이디 중복확인을 해주세요.</small>
          </div>
            <button onclick="checkId()" class="button" type="button" >중복확인</button>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3" for="password">비밀번호 입력 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
              <input type="password" class="form-control" name="userPwd" id="password" placeholder="*******" value="">
           </div>   
          <small>비밀번호는 6자리 이상입니다.</small>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3" for="password2">비밀번호 확인 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
              <input type="password" class="form-control" name="userPwd2" id="password2" placeholder="*******" value="">
            </div>  
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3" for="name">이름 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <input type="text" class="form-control" name="userName" id="name" >
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3" for="email">이메일 입력 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
              <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
              <input type="email" class="form-control" name="userEmail" id="email" placeholder="example@email.com">
            </div>
            <small> 비밀번호 분실시 사용합니다. </small> </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">생년월일 <span class="text-danger">*</span></label>
          <div class="col-xs-8">
            <div class="form-inline">
              <div class="form-group" >
                <select name="yyyy" class="form-control" id="yyyy">
                  <option value="">년도</option>
                  <option value="1955" >1955 </option><option value="1956" >1956 </option><option value="1957" >1957 </option><option value="1958" >1958 </option><option value="1959" >1959 </option><option value="1960" >1960 </option><option value="1961" >1961 </option><option value="1962" >1962 </option><option value="1963" >1963 </option><option value="1964" >1964 </option><option value="1965" >1965 </option><option value="1966" >1966 </option><option value="1967" >1967 </option><option value="1968" >1968 </option><option value="1969" >1969 </option><option value="1970" >1970 </option><option value="1971" >1971 </option><option value="1972" >1972 </option><option value="1973" >1973 </option><option value="1974" >1974 </option><option value="1975" >1975 </option><option value="1976" >1976 </option><option value="1977" >1977 </option><option value="1978" >1978 </option><option value="1979" >1979 </option><option value="1980" >1980 </option><option value="1981" >1981 </option><option value="1982" >1982 </option><option value="1983" >1983 </option><option value="1984" >1984 </option><option value="1985" >1985 </option><option value="1986" >1986 </option><option value="1987" >1987 </option><option value="1988" >1988 </option><option value="1989" >1989 </option><option value="1990" >1990 </option><option value="1991" >1991 </option><option value="1992" >1992 </option><option value="1993" >1993 </option><option value="1994" >1994 </option><option value="1995" >1995 </option><option value="1996" >1996 </option><option value="1997" >1997 </option><option value="1998" >1998 </option><option value="1999" >1999 </option><option value="2000" >2000 </option><option value="2001" >2001 </option><option value="2002" >2002 </option><option value="2003" >2003 </option><option value="2004" >2004 </option><option value="2005" >2005 </option><option value="2006" >2006 </option>                </select>
              </div>
              <div class="form-group">
                <select name="mm" class="form-control" id="mm">
                  <option value="">월</option>
                  <option value="01">1</option><option value="02">2</option><option value="03">3</option><option value="04">4</option><option value="05">5</option><option value="06">6</option><option value="07">7</option><option value="08">8</option><option value="09">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>                </select>
              </div>
              <div class="form-group">
                <select name="dd" class="form-control" id="dd">
                  <option value="">일</option>
                  <option value="01" >1 </option><option value="02" >2 </option><option value="03" >3 </option><option value="04" >4 </option><option value="05" >5 </option><option value="06" >6 </option><option value="07" >7 </option><option value="08" >8 </option><option value="09" >9 </option><option value="10" >10 </option><option value="11" >11 </option><option value="12" >12 </option><option value="13" >13 </option><option value="14" >14 </option><option value="15" >15 </option><option value="16" >16 </option><option value="17" >17 </option><option value="18" >18 </option><option value="19" >19 </option><option value="20" >20 </option><option value="21" >21 </option><option value="22" >22 </option><option value="23" >23 </option><option value="24" >24 </option><option value="25" >25 </option><option value="26" >26 </option><option value="27" >27 </option><option value="28" >28 </option><option value="29" >29 </option><option value="30" >30 </option><option value="31" >31 </option>                </select>
              </div>
            </div>
          </div>
        </div>
        
        <div class="form-group">
          <label class="control-label col-sm-3">성별 <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
            <label for="man"> 남 </label>	<input name="userGender" type="radio" value="남성" id="man">
            <label for="woman"> 여 </label>	<input name="userGender" type="radio" value="여성" id="woman">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3" for="userAddr1">주소 </label>
          <div class="col-md-5 col-sm-8">
            <div>
                <input type="text" name="userAddr1" id="userAddr1" class="form-control"  />                
              </div>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3" for="userAddr2">상세 주소 </label>
          <div class="col-md-5 col-sm-8">
            <div>
                <input type="text" name="userAddr2" id="userAddr2" class="form-control"  />                
              </div>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3" for="phone1">전화번호 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
          	<div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
            <input type="text" class="form-control" name="userPhone" id="phone1" placeholder="010-1234-5678" value="">
            </div>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">프로필 사진 </label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group"> <span class="input-group-addon" id="file_upload"><i class="glyphicon glyphicon-upload"></i></span>
              <input type="file" name="userFile" id="file_nm" class="form-control upload" placeholder="" aria-describedby="file_upload">
            </div>
          </div>
        </div>
         <div class="form-group">
          <label class="control-label col-sm-3">선호 장르 </label>
          <div class="col-md-5 col-sm-8">
        <div class="input-group">
                <select name="favoriteGame" class="form-control" id="genre">
                  <option value=""></option>
                  <option value="1" >fps </option><option value="2" >aos </option><option value="3" >rpg </option>
                 </select>
              </div>
         </div>
        </div>
        
        <div class="form-group">
          <div class="col-xs-offset-3 col-md-8 col-sm-9"><span class="text-muted"><span class="label label-danger">Note:-</span> By clicking Sign Up, you agree to our <a href="#">Terms</a> and that you have read our <a href="#">Policy</a>, including our <a href="#">Cookie Use</a>.</span> </div>
        </div>
        <div class="col-xs-offset-3 col-xs-8"> 
            <button type="button" style="border-radius:6px; font-s" class="btn btn-success" onclick="checkVD()" >회원가입</button>
           </div>
      </form>
      <br><br><br>
    </div>
</div>
</div>

<jsp:include page="/WEB-INF/views/home/maintempletfooter.jsp"></jsp:include><!-- footer형태-->
<jsp:include page="/WEB-INF/views/home/maintempletfooterjs.jsp"></jsp:include><!-- 템플릿전체움직임-->

<script>
var idCheck = false;
function checkId(){
	var userId = document.querySelector('#id').value;
	if(userId.trim().length<4){
		alert('아이디는 4글자 이상입니다.');
	}else { 
		var xhr = new XMLHttpRequest();
		xhr.open('POST', '/check'); 
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4 && xhr.status==200){
				console.log(xhr.responseText);
				var res = JSON.parse(xhr.responseText);
				if(res==1){
					alert('해당아이디로는 가입이 불가능');
					document.querySelector('#id').value = '';
					document.querySelector('#id').focus();
				}else{
					alert('가입가능한 아이디입니다.');
					idCheck = true;
				}
			}
		}
		xhr.send(userId);
	}
}
var idRegExp = /^[a-zA-z0-9]{4,12}$/;
function idCheck2(){
	if(!idRegExp('#id')){
		alert('아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다.');
		form.userId.value = "";
		form.userId.focus();
		return false;
	}
	return true;
}

function validation(id, min, max, msg ){
	var obj = document.querySelector(id);
	if((min && obj.value.trim().length < min) 
			|| (max && obj.value.trim().length > max)){
		alert(msg);
		obj.value = '';
		obj.focus();
		return false;
	}
	return true
}

function checkVD() {
	if (!validation('#id', 4, 12, '아이디를 입력해주세요.')) {
		return false;
	}
	if(!idCheck){
		alert('중복확인 해주세요.');
		return false;
	}
	if (!validation('#password', 6, 20, '비밀번호를 다시 입력해주세요.')) {
		return false;
	}
	if (!validation('#password2', 6, 20, '비밀번호를 확인해주세요.')) {
		return false;
	}		
	var userPwd = document.querySelector('[name=userPwd]');
	var userPwd2 = document.querySelector('[name=userPwd2]');
	if (userPwd.value.trim() != userPwd2.value.trim()) {
		alert('비밀번호를 똑같이 다시 입력해주세요.');
		userPwd2.value = "";
		userPwd2.focus();
		return false;
	}
	if (!validation('#name', 2, 10, '이름을 다시 입력해주세요.')) {
		return false;
	}
	var email = document.querySelector('#email').value;
	if(!email){
		alert('이메일을 입력해주세요');
		return false;
	}
	var yyyy = document.querySelector('[name=yyyy]');
	var yValue = yyyy.options[yyyy.selectedIndex];
	if(yValue.value.length==0){
		alert('출생년도를 선택해주세요');
		return false;
	}
	var mm = document.querySelector('[name=mm]');
	var mValue = mm.options[mm.selectedIndex];
	if(mValue.value.length==0){
		alert('월을 선택해주세요');
		return false;
	}
	var dd = document.querySelector('[name=dd]');
	var dValue = dd.options[dd.selectedIndex];
	if(dValue.value.length==0){
		alert('일을 선택해주세요');
		return false;
	}
	
	var gender = document.querySelector('[name=userGender]:checked');
	if(!gender){
		alert('성별을 입력해주세요.');
		return false;
	}
	
	if (!validation('#userAddr1', 3, 20, '주소는 3글자 이상입니다.')) {
		return false;
	}
	if (!validation('#userAddr2', 5, 50, '상세주소는 5글자 이상입니다.')) {
		return false;
	}
	if (!validation('#phone1', 9, 11, '전화번호를 다시 입력해주세요.')) {
		return false;
	}
	var favoriteGame = document.querySelector('[name=favoriteGame]');
	var favoriteGameV = favoriteGame.options[favoriteGame.selectedIndex];
	if(favoriteGameV.value.length==0){
		alert('좋아하는 장르를 선택해주세요');
		return false;
	}
	
	var xhr = new XMLHttpRequest();
	xhr.open('POST','/memberjoin');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			alert('회원가입 성공');
			location.href='/';
		}
	}
	var formData = new FormData();
	var userId = document.querySelector('[name=userId]');
	var userPwd = document.querySelector('[name=userPwd]');
	var userEmail = document.querySelector('[name=userEmail]');
	var userName = document.querySelector('[name=userName]');
	var yyyy = document.querySelector('[name=yyyy]');
	var mm = document.querySelector('[name=mm]');
	var dd = document.querySelector('[name=dd]');
	var userGender = document.querySelector('[name=userGender]');
	var userFile = document.querySelector('[name=userFile]');
	var userPhone = document.querySelector('[name=userPhone]');
	var userAddr1 = document.querySelector('[name=userAddr1]');
	var userAddr2 = document.querySelector('[name=userAddr2]');
	var favoriteGame = document.querySelector('[name=favoriteGame]');
	formData.append('userId',userId.value);
	formData.append('userPwd',userPwd.value);
	formData.append('userEmail',userEmail.value);
	if(userFile.files[0]){
		formData.append('userFile',userFile.files[0]);
	}
	formData.append('userName',userName.value);
	formData.append('userDateOfBirth',yyyy.value+'-'+mm.value+'-'+dd.value);
	formData.append('userGender',userGender.value);
	formData.append('userPhone',userPhone.value);
	formData.append('userAddr1',userAddr1.value);
	formData.append('userAddr2',userAddr2.value);
	formData.append('favoriteGame',favoriteGame.value);
	xhr.send(formData);
}
</script>
</body>
</html>
