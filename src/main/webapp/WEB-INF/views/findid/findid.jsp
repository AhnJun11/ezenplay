<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- ======= Breadcrumbs ======= -->
	<section id="breadcrumbs" class="breadcrumbs">
		<div class="container">

			<ol>
				<li><a href="index.html">Home</a></li>
				<li>Contact</li>
			</ol>
			<h2>Contact</h2>

		</div>
	</section>
	<!-- End Breadcrumbs -->

	<!-- ======= Contact Section ======= -->
	<main>
		<section id="contact" class="contact">
			<div class="container">
				<div class="row">
					<!-- Large modal -->
					<div class="modal-body">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#infoPanel" role="tab">id찾기</a>
							<li>
							<li class="nav-item" id="pwdchange"><a class="nav-link"  data-toggle="tab" id="tabtest"
								href="#placementPanel" role="tab">비밀번호바꾸기</a>
							<li>
						</ul>

						<div class="tab-content mt-2">
							<div class="tab-pane fade show active" id="infoPanel"role="tabpanel"><!--id찾기부분 -->
								<div id="hidetext">
									<h4>아이디찾기</h4>
									<div class="form-group">
									<label for="campaignName">회원정보를 입력하세요</label><br>
									이름 : <input type="text" class="form-text" id='userName' ></input>
									생년월일 : <input type="date" class="form-text" id='userDateOfBirth' ></input>
									전화번호 : <input type="text" class="form-text" id='userPhone' ></input>
									이메일 : <input type="email" class="form-text" id='userEmail'></input><button  id="sendEmail" onclick="middlechack();">인증번호받기</button>
									<br/>
									인증번호 : <input type="email" class="form-text" id='scrnum' ></input><button  id="chackNum" onclick="chackNums()">인증번호확인</button>
									</div>
									<button class="btn btn-secondary" id="hidebtn">찾기</button>
								</div>
									<div id="resulttext" style="display:none;"><!-- 결과부분 -->
										<div class="form-group">
											<div class="card">
												<div class="card-header" role="tab" id="headingOne">
													<h5 class="mb-0">
														<a id="idtext" data-toggle="collapse" data-parent="#accordion"
														href="#collapseOne" aria-expanded="true"
														aria-controls="collapseOne"> # </a>
													</h5>
												</div>
											</div>
										</div>
									<button class="btn btn-secondary" name= "openbtn" id="openbtn">로그인하러가기</button>
									<button class="btn btn-secondary" id="findp">비밀번호변경하기</button>
								</div>
							</div>
							
							<div class="tab-pane fade" id="placementPanel" role="tabpanel"><!-- pwd바꾸기부분 -->
								<div id="hidetext2">
								<h4>비밀번호변경하기</h4>
								<div class="form-group">
													<h5 class="mb-0">
														<a id="idtext2" data-toggle="collapse" data-parent="#accordion"
														href="#collapseOne" aria-expanded="true"
														aria-controls="collapseOne"> </a>
													</h5>
									<label for="campaignName">변경하실 비밀번호를 입력하세요</label><br>
									아이디 : <input type="text" class="form-text" id='userId' name="idput" value="" readonly></input>
									변경할실 비밀번호 : <input type="text" class="form-text" id='userPwd' ></input>
									변경하실 비밀번호확인 : <input type="text" class="form-text" id='userNewPwd' ></input>
								</div>
								<button class="btn btn-secondary" id="hidebtn2">변경하기</button>
								</div>	
								<div id="resulttext2" style="display:none;"><!-- 결과부분 -->
								<div class="form-group">
										<div class="card">
											<div class="card-header" role="tab" id="headingOne">
												<h5 class="mb-0">
													<a id="love" data-toggle="collapse" data-parent="#accordion"
														href="#collapseOne" aria-expanded="true"
														aria-controls="collapseOne"> 변경이 완료되었습니다. </a>
												</h5>
											</div>
										</div>
									</div>
									<button class="btn btn-secondary" name= "openbtn" id="openbtn2">로그인하러가기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>



</body>
<script> 
var mailchack = '';
var chackbtn = false;
var chacknumbtn = false;
var echack = false;
var sendemail = document.getElementById('sendemail');
var chackNum = document.getElementById('chackNum');
function middlechack(){
	var userName = document.querySelector('#userName').value;
	var userDateOfBirth = document.querySelector('#userDateOfBirth').value;
	var userPhone = document.querySelector('#userPhone').value;
	var userEmail = document.getElementById('userEmail').value;
	var userpack={
			userName,userDateOfBirth,userPhone,userEmail
	}////////////
	var xhr = new XMLHttpRequest();
	xhr.open('POST', '/matchemail');
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			if(xhr.responseText ==""){
				alert('회원정보가 일치하지 않습니다.');
				return false;
			
			}else{
				alert('이메일 수신에 몇 분 정도 소요될 수 있습니다.');
				echack = true;
				sendEmail.disabled = 'disabled';
				sendEmails();
			}
		}
	}
	xhr.setRequestHeader('content-type', 'application/json;charset=UTF-8');
	xhr.send(JSON.stringify(userpack));
}

function sendEmails(){ //메일 전송로직//////////////////////////

	var userEmail = document.getElementById('userEmail').value;
	var subject = '인증번호 확인용 메일입니다.';
	var text = '고구마';
	var to = userEmail;
	var emailmaster={
			to,text,subject
	}
	/////////////
	var xhr = new XMLHttpRequest();
		xhr.open('POST', '/mail'); 
		xhr.onreadystatechange = function(){
			if (xhr.readyState == 4 && xhr.status == 200) {
			if(xhr.responseText && xhr.responseText!=null){
				mailchack = xhr.responseText;
				alert('전송완료');
			}
		}
	}	
	if(userEmail == "" || !echack){
    alert("본인확인용 번호를 받을 메일을 정확히 입력하세요.")
    return false;
    	}else{	
    		chackbtn = true;
		xhr.setRequestHeader('content-type', 'application/json;charset=UTF-8');
		xhr.send(JSON.stringify(emailmaster));
       }
}
function chackNums(){// 인증번호 확인로직
 	var scrnum =  document.getElementById('scrnum').value;
 	if (!chackbtn){
 		alert("본인확인용 메일을 발송후 작성하세요");
 	}
 	var testj = JSON.parse(mailchack);
 	var tests = testj.code;
 	if(scrnum ==null || tests !== scrnum){
 		alert("올바른 인증번호를 입력하세요");
 		return false;
 	}else{
		alert("본인인증을 완료했습니다.");
		chacknumbtn =true;
		chackNum.disabled = 'disabled';
 	}
	//var xhr = new XMLHttpRequest();
	//xhr.open('POST', '/chacknum'); 
}
</script>
<script> //각 버튼 숨기고 보이기, id찾기
window.onload =function(){
	$("#pwdchange").css({ 'pointer-events': 'none' });
	
	var hide = document.getElementById('hidebtn');
	var hide2 = document.getElementById('hidebtn2');
	var open = document.getElementById('openbtn');
	var open2 = document.getElementById('openbtn2');
	var findp = document.getElementById('findp');
	var hidetext = document.getElementById("hidetext");
	var resulttext = document.getElementById("resulttext");
	var hidetext2 = document.getElementById("hidetext2");
	var resulttext2 = document.getElementById("resulttext2");
	
	findp.onclick =function(){//아이디를 찾은 후 비밀번호찾기로 탭이동
		
		$('#tabtest').click();
	}
	open.onclick =function(){//아이디를 찾은 후 로그인을 위해 홈화면으로이동
		location.href = '/';
	}
	open2.onclick =function(){//비밀번호까지 찾은 후 로그인을위해 홈하면으로이동
		location.href = '/';
	}
	hide.onclick =function (){//아이디 찾기화면 로직
		var userName = document.querySelector('#userName').value;
		var userDateOfBirth = document.querySelector('#userDateOfBirth').value;
		var userPhone = document.querySelector('#userPhone').value;
		var userEmail = document.querySelector('#userEmail').value;
		var sendEmail = document.querySelector('#sendEmail').value;
		var scrnum = document.querySelector('#scrnum').value;
		
		 if(userName == ""){
             alert("본인 이름을 입력하세요.")
             userName.value="";
             userName.focus();
             return false;
         }
		 if(userDateOfBirth == ""){
             alert("본인 생년월일을 입력하세요.")
           
             return false;
		 }
         
		 if(userPhone == ""){
             alert("기억나는 번호를 입력하세요.")
        
             return false;
         }
		 if(userEmail == ""){
             alert("인증번호를 받을 메일을 정확히 입력하세요.")
        
             return false;
         }
		 if(scrnum == ""){
             alert("인증번호를 정확히 입력하세요.")
        
             return false;
         }
		 if(!chacknumbtn){
				alert('수신하신 인증번호로 중복확인후 진행하세요');
				return false;
			}
		
		 
		///////////////////////////////////
		hidetext.style.display = 'none'; //인풋숨기기
		resulttext.style.display = 'block'; //결과보이기
		var ndp = {
				userName,userDateOfBirth,userPhone
		}
		var xhr = new XMLHttpRequest();
		xhr.open('POST', '/findId');
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var html = '';
				var html2 = '';
				if (xhr.responseText) {
					var res = JSON.parse(xhr.responseText); 
					html += '<p class="form-text">찾으시는 ID는'+res.userId+'입니다.</p>';
					html2 += '<p class="form-text">찾으셨던 ID는'+res.userId+'입니다.</p>';
					var ui = res.userId;
				}else{//넘어온게 널일때 나올것
					alert('없는 계정입니다.')
					hidetext.style.display = 'block'; //다시인풋보이게
					resulttext.style.display = 'none'; //결과안보이게
				}
				document.querySelector('#idtext').innerHTML=html;
				document.querySelector('#idtext2').innerHTML=html2;
				$('input[name=idput]').attr('value',ui);
				$("#pwdchange").css({ 'pointer-events': '' }); //비밀번호바꾸기 활성화
			}
		}
			xhr.setRequestHeader('content-type', 'application/json;charset=UTF-8');
			xhr.send(JSON.stringify(ndp));
		}
	hide2.onclick =function (){//비밀번호찾기화면 로직
		var userId = document.querySelector('#userId').value;
		var userPwd = document.querySelector('#userPwd').value;
		var userNewPwd = document.querySelector('#userNewPwd').value;
		
		 if(userPwd == ""){
            alert("바꾸실 비밀번호를 입력하세요.")
            userDateOfBirth.value="";
            userDateOfBirth.focus();
            return false;
        }
		 if(userNewPwd == ""){
            alert("바꾸실 비밀번호를 다시 입력하세요.")
            userPhone.value="";
            userPhone.focus();
            return false;
        }
		 if(userPwd !== userNewPwd){
			 alert("일치시키세요")
			 return false;
		 }
		hidetext2.style.display = 'none'; //숨기기
		resulttext2.style.display = 'block'; //보이기
		var ipp = {
				userPwd,userId
		}
		var xhr = new XMLHttpRequest();
		xhr.open('POST', '/updatepwd');
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				if(xhr.responseText && xhr.responseText!=null){
					
					alert('등록완료');
					location.href='/';
				}
			}
		}
		xhr.setRequestHeader('content-type', 'application/json;charset=UTF-8');
		xhr.send(JSON.stringify(ipp));
	}
}
</script>
</html>