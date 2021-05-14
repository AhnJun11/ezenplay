function showName(){
	var userName = document.querySelector('#userName').style.display;
	if(userName){
		document.querySelector('#userName').style.display='';
		document.querySelector('#hideUserName').style.display='none';
	}else{
		document.querySelector('#userName').style.display='none';
		document.querySelector('#hideUserName').style.display='';
	}
}
function showPhone(){
	var userPhone = document.querySelector('#userPhone').style.display;
	if(userPhone){
		document.querySelector('#userPhone').style.display='';
		document.querySelector('#hideUserPhone').style.display='none';
	}else{
		document.querySelector('#userPhone').style.display='none';
		document.querySelector('#hideUserPhone').style.display='';
	}
}
function showAddr1(){
	var userAddr1 = document.querySelector('#userAddr1').style.display;
	if(userAddr1){
		document.querySelector('#userAddr1').style.display='';
		document.querySelector('#hideUserAddress1').style.display='none';
	}else{
		document.querySelector('#userAddr1').style.display='none';
		document.querySelector('#hideUserAddress1').style.display='';
	}
}

function showAddr2(){
	var userAddr2 = document.querySelector('#userAddr2').style.display;
	if(userAddr2){
		document.querySelector('#userAddr2').style.display='';
		document.querySelector('#hideUserAddress2').style.display='none';
	}else{
		document.querySelector('#userAddr2').style.display='none';
		document.querySelector('#hideUserAddress2').style.display='';
	}
}
function showEmail(){
	var userEmail = document.querySelector('#userEmail').style.display;
	if(userEmail){
		document.querySelector('#userEmail').style.display='';
		document.querySelector('#hideUserEmail').style.display='none';
	}else{
		document.querySelector('#userEmail').style.display='none';
		document.querySelector('#hideUserEmail').style.display='';
	}
}
// print
function printName(){
	const name = document.querySelector('[name=userName]').value;
	document.querySelector("#userName").innerHTML = '<p style="cursor:pointer">'+name+'</p>';
	var userName = document.querySelector('#userName').style.display;
	if(userName){
		document.querySelector('#userName').style.display='';
		document.querySelector('#hideUserName').style.display='none';
	}
}
function printPhone(){
	const name = document.querySelector('[name=userPhone]').value;
	document.querySelector("#userPhone").innerHTML = '<p style="cursor:pointer">'+name+'</p>';
	var userPhone = document.querySelector('#userPhone').style.display;
	if(userPhone){
		document.querySelector('#userPhone').style.display='';
		document.querySelector('#hideUserPhone').style.display='none';
	}
}
function printAddr1(){
	const name = document.querySelector('[name=userAddr1]').value;
	document.querySelector("#userAddr1").innerHTML = '<p style="cursor:pointer">'+name+'</p>';
	var userAddr1 = document.querySelector('#userAddr1').style.display;
	if(userAddr1){
		document.querySelector('#userAddr1').style.display='';
		document.querySelector('#hideUserAddress1').style.display='none';
	}
}
function printAddr2(){
	const name = document.querySelector('[name=userAddr2]').value;
	document.querySelector("#userAddr2").innerHTML = '<p style="cursor:pointer">'+name+'</p>';
	var userAddr2 = document.querySelector('#userAddr2').style.display;
	if(userAddr2){
		document.querySelector('#userAddr2').style.display='';
		document.querySelector('#hideUserAddress2').style.display='none';
	}
}
function printEmail(){
	const name = document.querySelector('[name=userEmail]').value;
	document.querySelector("#userEmail").innerHTML = '<p style="cursor:pointer">'+name+'</p>';
	var userEmail = document.querySelector('#userEmail').style.display;
	if(userEmail){
		document.querySelector('#userEmail').style.display='';
		document.querySelector('#hideUserEmail').style.display='none';
	}
}

function getUser(){
	var userNum = document.querySelector('#userNum').value;
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/user?userNum='+userNum);
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			console.log(res);
			for(var key in res){
				var value = res[key];
				if(value!=null&&value!=''){
					if(key=='gradeInfo'){
						document.querySelector('#grade-img').innerHTML = '<img style="width:20px; height:20px;"  src="/resources/images/grade/'+res[key].filePath+'">'
						document.querySelector('#grade-name').innerHTML = res[key].gradeName;
					}else{
						var id = document.querySelector('#'+key);
						var pointer = 'style="cursor:pointer"';
						if(key=='userMileage'||key=='restOfTime'||key=='userId'){
							pointer = '';
						}
						if(id){
							id.innerHTML = '<p '+pointer+'>'+value+'</p>';
						}
					}
				}
			}
			document.querySelector('#totalAmount').innerHTML = res.totalAmount;
			if(res.totalAmount<50000){
				document.querySelector('#gradePrice').innerHTML = 50000;
			}else if(res.totalAmount<300000){
				document.querySelector('#gradePrice').innerHTML = 300000;
			}else if(res.totalAmount<1000000){
				document.querySelector('#gradePrice').innerHTML = 1000000;
			}else{
				document.querySelector('#gradePrice').innerHTML = '최고등급';
			}
			
			if(res.profilePath){
				document.querySelector('#profile-i').innerHTML = '<img src="/resources/images/user/'+res.profilePath+'" id="profile-img"/>';
			}else{
				document.querySelector('#profile-i').innerHTML = '<img src="/resources/images/user/basic.png" id="profile-img"/>';
			}
		}
	}
	xhr.send();
}

window.onload = getUser();

function change(obj){
	var reader = new FileReader();
	reader.onload = function(e){
		document.querySelector('#profile-img').src = e.target.result;
	}
	reader.readAsDataURL(obj.files[0]);
}

function update(){
	var xhr = new XMLHttpRequest();
	xhr.open('POST','/update');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 &&xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			if(res!=0){
				alert('수정이 성공하였습니다!');
				location.href='/';
			}else{
				alert('수정실패');
			}
		}
	}
	var formData = new FormData();
	
	formData.append('userPhone',document.querySelector('#userPhone>p').innerHTML);
	formData.append('userAddr1',document.querySelector('#userAddr1>p').innerHTML);
	formData.append('userAddr2',document.querySelector('#userAddr2>p').innerHTML);

	formData.append('userEmail',document.querySelector('#userEmail>p').innerHTML);
	formData.append('userName',document.querySelector('#userName>p').innerHTML);
	formData.append('favoriteGame',document.querySelector('#favoriteGame').value);
	formData.append('restOfTime',document.querySelector('#restOfTime>p').innerHTML);
	formData.append('totalAmount',document.querySelector('#totalAmount').innerHTML);
	if(document.querySelector('#profile-i').innerHTML=='<img src="/resources/images/user/basic.png" id="profile-img">'){
		document.querySelector('[name=file]').value=null;
	}
	if(document.querySelector('[name=file]').files[0]){
		formData.append('userFile',document.querySelector('[name=file]').files[0]);
	}else{
		if(document.querySelector('#profile-i').innerHTML=='<img src="/resources/images/user/basic.png" id="profile-img">'){
		formData.append('userProfile','basic.png');
		formData.append('profilePath','basic.png');
		}else{
		formData.append('userProfile',document.querySelector('#userProfile').value);
		formData.append('profilePath',document.querySelector('#profilePath').value);
		}
	}
	formData.append('userNum',document.querySelector('#userNum').value);
	xhr.send(formData);
}

function showImg(){
	document.querySelector('#profile-i').innerHTML = '<img src="/resources/images/user/basic.png" id="profile-img"/>';
}
function goRedfila(){
	window.open('https://m.blog.naver.com/PostList.nhn?blogId=redfila&currentPage=2','Dong-Dong');
}
function showPassword(){
	if(document.querySelector('#hideP').style.display){
		document.querySelector('#hideP').style.display='';
	}else{
		document.querySelector('#hideP').style.display='none';
	}
}
function doDelete(){
	var userP = document.querySelector('[name=userPwd]');
	if(userP.value.trim().length==0){
		alert('비밀번호를 입력해주세요!');
		userP.focus();
		return;
	}
	if(confirm('마일리지와 남은시간이 소멸됩니다. 정말탈퇴하시겠습니까?')){
		var userPwd = document.querySelector('[name=userPwd]').value;
		var userNum = document.querySelector('#userNum').value;
		var restOfTime = document.querySelector('#restOfTime>p').innerHTML;
		var userMileage = document.querySelector('#userMileage>p').innerHTML;
		var xhr = new XMLHttpRequest();
		var url = '?userPwd='+userPwd+'&userNum='+userNum+'&restOfTime='+restOfTime+'&userMileage='+userMileage;
		xhr.open('DELETE','/withdrawn'+url);
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4&& xhr.status==200){
				var res = JSON.parse(xhr.responseText);
				if(res==1){
					alert('회원탈퇴완료');
					location.href='/';
				}else{
					alert('비밀번호가 틀립니다');
					userP.focus();
				}
			}
		}
		xhr.send();
	}
}
function gores(){
	window.open( '/views/reservation' ,'reservation', 'width = 500, height = 300, top = 100, left = 200,status=no ');
	
}

function cancelRes(){
	var userNum = document.querySelector('#userNum').value;
	window.open('/views/res-cancel?userNum='+userNum,'res-cancel','width=600,height=700,top=100,align=center')
}