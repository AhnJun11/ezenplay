<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="startDiv">
<input type="text" id="name" placeholder="대화명"><br><button onclick="startChat()">시작</button><br>
</div>
<div id= "chatDiv" style="display:none">
<textarea id="chat" cols="40" rows="10"></textarea><br>
<label id="lName"></label><input type="text" id="msg"><button onclick="sendMsg()">전송</button>
</div>
<script>
var ws;
function sendMsg(){
	var param = {
			type : "msg",
			name : document.querySelector('#name').value,
			msg : document.querySelector('#msg').value
	}
	ws.send(JSON.stringify(param));
}
function startChat(){
		if(!document.querySelector('#name').value.trim()){//id가 name인녀석이 비어있을때 리턴
			alert('대화명작성바람');
			return;
		}
		ws = new WebSocket('ws://localhost/chat'); //이게되는순간 WSHandler랑 커넥션을 맺음
		ws.onopen= function(data){//open이벤트
			var param= {
					type : "enter",
					name : document.querySelector('#name').value
			}
		document.querySelector('#lName').innerText = document.querySelector('#name').value +':';
		ws.send(JSON.stringify(param));
		document.querySelector('#startDiv').style.display = 'none';
		document.querySelector('#chatDiv').style.display = '';
		}
		ws.onmessage = function(data){
			console.log(data);
			var msg = JSON.parse(data.data);
			if(msg.type && msg.type=='enter'){
				document.querySelector('#chat').value += '[입장 :' +msg.name+'님이입장하였다.]\r\n';
			}else if(msg.type && msg.type=='msg'){
				document.querySelector('#chat').value += msg.name + ':' + msg.msg +'\r\n';
			}else{
				document.querySelector('#chat').value += '[퇴장 :' +msg.name+'님이퇴장하였다.]\r\n';
			}
		}
		ws.onclose = function(data){
			alert('채팅종료됨');
		}
	}
window.onload= function(){
	
}</script>
</body>
</html>