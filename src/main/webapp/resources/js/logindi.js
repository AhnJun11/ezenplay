function logout() {
			var xhr = new XMLHttpRequest();
			xhr.open('POST', '/logout');
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					if (xhr.responseText == 'true') {
						location.href = '/';
					}
				}
			}
			xhr.send();
		}
	//로그인로직
	function login() {
		var p = {
				userId : document.querySelector('#userId').value,
			userPwd : document.querySelector('#userPwd').value
		}
		var xhr = new XMLHttpRequest();
		xhr.open('POST', '/login');
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var html = '';
				if (xhr.responseText) {
					var res = JSON.parse(xhr.responseText);
					location.href = '/';
				}else{
				console.log(xhr.responseText);
					alert('탈퇴했거나 없는 아이디입니다.');
				}
			}
		}
		xhr.setRequestHeader('content-type', 'application/json;charset=UTF-8');
		xhr.send(JSON.stringify(p));
	}