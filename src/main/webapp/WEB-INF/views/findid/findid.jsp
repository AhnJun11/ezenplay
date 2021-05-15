<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
														aria-controls="collapseOne"> Entire Venue </a>
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
		hidetext.style.display = 'none'; //인풋숨기기
		resulttext.style.display = 'block'; //결과보이기
		var ndp = {
				userName,userDateOfBirth,userPhone,
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
					hidetext.style.display = 'block'; //인풋숨기기
					resulttext.style.display = 'none'; //결과보이기
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
				if(x.responseText && x.responseText!=null){
					
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