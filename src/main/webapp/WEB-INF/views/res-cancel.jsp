<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약취소</title>
<link rel="stylesheet" href="/resources/css/res-cancel.css">
</head>
<body>

<table class="blueone">
  <tr><th>예약번호</th><th>유저아이디</th><th>좌석번호</th><th>예약일</th><th>예약시간</th><th>취소</th></tr>
  <tbody id="tBody">
  
  </tbody>
</table>
<script>
window.addEventListener('load',load);

function load() {
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/res/user/${param.userNum}');
	xhr.onreadystatechange = function (){
		if(xhr.readyState==4&&xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			console.log(res);
			var html ='';
			var idx = 0;
			if(res.length>15){
				idx = 15;
			}else{
				idx = res.length;
			}
			for(var i =0;i<idx;i++){
				html +='<tr name="resTr">';
				html +='<td name="resNum">'+res[i].resNum+'</td>';
				html +='<td>'+res[i].userInfo.userId+'</td>';
				html +='<td>'+res[i].pcInfo.pcSeatNum+'</td>';
				var rDate = res[i].resDate.substring(0,10); //년도자르기
				html +='<td name="resDate">'+rDate+'</td>';
				html +='<td name="resTime">'+res[i].resTime+'</td>';
				var resDate = new Date(res[i].resDate+' '+res[i].resTime); //resDate.getTime() 예약시간
				var thirtyM = new Date(Date.parse(resDate)-1000*60*30); //thirtyM.getTime() 30분전
				var now = new Date(res[i].dateNow); //현재시간
				if(res[i].resResult==0){
					html +='<td> <a class="my" ><span>취소완료</span></a></td>';
				}
				else if(res[i].resResult==1&&resDate.getTime()<now.getTime()){
						html +='<td> <a class="my"><span>예약완료</span></a></td>';
				}else if(res[i].resResult==1&&resDate.getTime()>now.getTime()&&(resDate.getTime()-now.getTime())>(resDate.getTime()-thirtyM.getTime())){
						html +='<td> <a class="btn effect04" data-sm-link-text="Cancel" name="cal"></a></td>';
				}else if(res[i].resResult==1&&resDate.getTime()>now.getTime()&&(resDate.getTime()-now.getTime())<=(resDate.getTime()-thirtyM.getTime())){
						html +='<td> <a class="my">취소불가</a></td>';
					}
				html +='<td><input type="hidden" name="resResult" value="'+res[i].resResult+'"</td>';
				html +='</tr>';
			}
			document.querySelector('#tBody').innerHTML = html;
			timeCal();
		}
	}
	xhr.send();
}

function timeCal(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/callNow');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4&&xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			var nowV = res.date;
			var now = new Date(nowV);
			var cal = document.querySelector('[name=cal]');
			var times = document.querySelectorAll('[name=resTime]');
			var dates = document.querySelectorAll('[name=resDate]');
			var resTr = document.querySelectorAll('[name=resTr]');
			var resResult = document.querySelectorAll('[name=resResult]');
			
			for(var i = 0;i<dates.length;i++){
				var date = new Date(dates[i].innerHTML.substring(0,10)+' '+times[i].innerHTML); //예약한시간
				var thirtyM = new Date(Date.parse(date)-1000*60*30);//취소가능시간
				var time ='';
				var nt = now.getTime();
				var tt = thirtyM.getTime();
				if(tt>nt&&resResult[i].value==1){
					 sec =parseInt(tt - nt) / 1000;
				     day  = parseInt(sec/60/60/24);
				     sec = (sec - (day * 60 * 60 * 24));
				     hour = parseInt(sec/60/60);
				     sec = (sec - (hour*60*60));
				     min = parseInt(sec/60);
				     sec = parseInt(sec-(min*60));
				     if(hour<10){hour="0"+hour;}
				     if(min<10){min="0"+min;}
				     if(sec<10){sec="0"+sec;}
				     time += '<span>' + hour + ':' + min + ':' + sec + '</span>';
				     cal.innerHTML = time;
				     cal.setAttribute('onclick','doCancel()'); //펑션지정 사용완료,예약취소 구현
				     resTr[i].setAttribute('id','hi');
				     if(time=='<span>00:00:00</span>'){
				    	window.setTimeout('reload()',1000);
				     }
				}
			}
		}
	}
	xhr.send();
}

setInterval(timeCal,1000);
//document.querySelectorAll('[id^=num]') << id가 num으로시작하는거 다가져옴
function reload(){
	location.href = location.href;
}

function doCancel(){
	if(confirm('정말 취소하시겠습니까?')){
		var resNum = document.querySelector('#hi>[name=resNum]').innerHTML;
		var xhr = new XMLHttpRequest();
		xhr.open('DELETE','/res/delete/'+resNum);
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4&&xhr.status==200){
				if(xhr.responseText){
					alert('예약이 취소되었습니다.');
					location.href=location.href;
				}
			}
		}
		xhr.send();
	}else{
		return;
	}
}
</script>
</body>
</html>