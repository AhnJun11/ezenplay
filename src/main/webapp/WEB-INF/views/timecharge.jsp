<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${UserInfo eq null }">
	<script>
		alert('로그인 후 이용해주세요.');
		location.href = '/';
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<jsp:include page="/WEB-INF/views/home/maintemplethead.jsp"></jsp:include><!-- 상단바로고디자인 -->
<jsp:include page="/WEB-INF/views/home/maintempletbar.jsp"></jsp:include><!-- 상단바와 로고 -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/timecharge.css">
</head>
<body>

<div style="margin:30px auto;">

  <div class="container group">
    <div id="divOne" onclick="clicks(this)" data-col="div1">
    <div class="grid-1-5">
   	 <span class="button">✓</span><br>
      <span style="font-size: 0.5em; font-weight: 700; text-align: center; font-size: x-large;">charge</span><br><br>
      <strong style="font-size: 1.5em;">1000<span class="small">원</span></strong><br>
      <small>01:00</small><br>
      <sub>마일리지 10p+</sub><br>
      <input type="radio" name="Amt" id="radio-1" style="float:left; display:none" value="1000" ><br>
    </div>
   	 </div>
     
     <div id="divTwo" onclick="clicks(this)" data-col="div2">
    <div class="grid-1-5">
   	 <span class="button">✓</span><br>
      <span style="font-size: 0.5em; font-weight: 700; text-align: center; font-size: x-large;">charge</span><br><br>
      <strong style="font-size: 1.5em;">2000<span class="small">원</span></strong><br>
      <small>02:00</small><br>
      <sub>마일리지 20p+</sub><br>
      <input type="radio" name="Amt" id="radio-2" style="float:left; display:none" value="2000" ><br>
    </div>
   	 </div>
   	 
       <div id="divThree" onclick="clicks(this)" data-col="div3">
    <div class="grid-1-5">
   	 <span class="button">✓</span><br>
      <span style="font-size: 0.5em; font-weight: 700; text-align: center; font-size: x-large;">charge</span><br><br>
      <strong style="font-size: 1.5em;">3000<span class="small">원</span></strong><br>
      <small>03:00</small><br>
      <sub>마일리지 30p+</sub><br>
      <input type="radio" name="Amt" id="radio-3" style="float:left; display:none" value="3000" ><br>
    </div>
   	 </div>
  </div>
  <br><br>
  <div class="container group">
  
	<div id="divFour" onclick="clicks(this)" data-col="div4">
    <div class="grid-1-5">
   	 <span class="button">✓</span><br>
      <span style="font-size: 0.5em; font-weight: 700; text-align: center; font-size: x-large;">charge</span><br><br>
      <strong style="font-size: 1.5em;">5000<span class="small">원</span></strong><br>
      <small>05:00</small><br>
      <sub>마일리지 50p+</sub><br>
      <input type="radio" name="Amt" id="radio-4" style="float:left; display:none" value="5000" ><br>
    </div>
   	 </div>  


	<div id="divFive" onclick="clicks(this)" data-col="div5">
    <div class="grid-1-5">
   	 <span class="button">✓</span><br>
      <span style="font-size: 0.5em; font-weight: 700; text-align: center; font-size: x-large;">charge</span><br><br>
      <strong style="font-size: 1.5em;">10000<span class="small">원</span></strong><br>
      <small>11:00</small><br>
      <sub>마일리지 100p+</sub><br>
      <input type="radio" name="Amt" id="radio-5" style="float:left; display:none" value="10000" ><br>
    </div>
   	 </div>
     
     <div id="divSix" onclick="clicks(this)" data-col="div6">
    <div class="grid-1-5">
   	 <span class="button">✓</span><br>
      <span style="font-size: 0.5em; font-weight: 700; text-align: center; font-size: x-large;">charge</span><br><br>
      <strong style="font-size: 1.5em;">20000<span class="small">원</span></strong><br>
      <small>22:00</small><br>
      <sub>마일리지 200p+</sub><br>
      <input type="radio" name="Amt" id="radio-6" style="float:left; display:none" value="20000" ><br>
    </div>
   	 </div>
 
      <div class="col_third" style="float:right;margin-top:85px;">
        <div class="hover panel">
          <div class="front">
            <div class="box1">
            	<select name="pay" class="payC" onclick="textInput('payArea',this.value)">
            		<option value="">선택하세요</option>
            		<option value="카드">카드</option>
            		<option value="휴대폰">휴대폰</option>
            	</select><br><br>
            	<div class="line"></div>
              <button type="button" onclick="goPay()" style="bottom:0;position: relative; float:right;margin-top: 25px;">다음</button>
            </div><br>
          </div>
          
          <div class="back">
            <div class="box2" style="float:right">
              <input type="text" class="box" id="payArea" name="payArea" placeholder="결제수단" readOnly><br>
              <input type="text" class="box" id="priceArea" name="priceArea" placeholder="결제금액" readOnly><br>
              <input type="number" class="box" id="mileageArea" name="mileageArea" placeholder="마일리지 사용 금액" value="this">
              보유 마일리지 : ${UserInfo.userMileage}
               <button type="reset" onclick="reset()" style="bottom:0;position: relative; float:right;">취소</button>
               <button type="button" class="charge" id="radioButton" onclick="charge()" style="bottom:0;position: relative; float:right;">충전</button>
            <button type="button" class="charge" onclick="test()" style="bottom:0;position: relative;">테스트 충전</button>
            </div>
          </div>
        </div>
    </div>

    </div> 
 
   </div>
    
    
<script>
function textInput(Obj, Str) {
	document.getElementById(Obj).value = Str;
}
function clicks(obj){
	var listDataCol = document.querySelectorAll('[data-col]');
	var objCol = obj.getAttribute('data-col');
	for(var d of listDataCol){
		var dataCol = d.getAttribute('data-col');
		if(objCol==dataCol){
		var da = document.querySelector('[data-col='+dataCol+']');
		document.querySelector('#'+da.id+'>div>span').setAttribute('class','my');
		var input = document.querySelector('#'+obj.id+'>div>input');
		$(input).prop('checked', 'checked');
		}else{
			var els = d.getAttribute('id');
			document.querySelector('#'+els+'>div>span').setAttribute('class','button');
			var out = document.querySelector('#'+els+'>div>input');
			$(out).prop('checked', '');
		}
	}
	var Str = document.querySelector('[name=Amt]:checked').value;
	document.getElementById("priceArea").value = Str;
}

function goPay(){
  if(document.querySelector('[name=pay]').value==''){
alert('수단을 선택해주세요');
return false;
  }
     $('.hover').addClass('flip');
 }
function reset(){
  $('.hover').removeClass('flip');
 }
function test(){
	var xhr = new XMLHttpRequest();
	xhr.open('POST','/testPay');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 &&xhr.status==200){
			var res = JSON.parse(xhr.responseText);
		}
	}
	var formData = new FormData();
	var price = document.getElementById("priceArea");
	var userNum = ${UserInfo.userNum};
	var TextMileage = document.getElementById("mileageArea").value;
	var UsingMileage = ${UserInfo.userMileage}-TextMileage;
	var Mileage = ${UserInfo.userMileage}+price.value*0.01;
	var totalMileage = UsingMileage+Mileage;
	
	var restOfTime = '00:00:00';
	var details;
	if(price.value==1000){
		restOfTime = '01:00:00';
		details = '1';
	}
	if(price.value==2000){
		restOfTime = '02:00:00';
		details = '2';
	}
	if(price.value==3000){
		restOfTime = '03:00:00';
		details = '3';
	}
	if(price.value==5000){
		restOfTime = '05:00:00';
		details = '5';
	}
	if(price.value==10000){
		restOfTime = '11:00:00';
		details = '11';
	}
	if(price.value==20000){
		restOfTime = '22:00:00';
		details = '22';
	}
	formData.append('userNum',${UserInfo.userNum});
	formData.append('restOfTime',restOfTime);
	xhr.send(formData);

	var xhr = new XMLHttpRequest();
	xhr.open('POST','/mileage');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 &&xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			if(res!=0){
				alert('적립성공');
				//location.href='/';
			}else{
				alert('적립실패');
			}
		}
	}
	
	formData.append('userNum',${UserInfo.userNum});
	formData.append('userMileage',totalMileage);
	xhr.send(formData);
	
	var xhr = new XMLHttpRequest();
	xhr.open('POST','/testHis');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 &&xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			if(res!=0){
				alert('충전완료');
				location.href='/';
			}else{
				alert('충전실패');
			}
		}
	}
	var formData = new FormData();
	var UserInfo = ${UserInfo.userNum};
	var phType = '시간충전';
	var price = document.getElementById("priceArea");
	var haveMile = document.getElementById("mileageArea");
	var phPrice = price.value-haveMile.value;
	var pay = document.getElementById("payArea");
	var phMethod = pay.value;
	var phDetails = '시간충전'+details+'시간';
	var phSave = price.value*0.01;
	formData.append('UserInfo',UserInfo);
	formData.append('phType',phType);
	formData.append('phPrice',phPrice);
	formData.append('phMethod',phMethod);
	formData.append('phDetails',phDetails);
	formData.append('phSave',phSave);
	xhr.send(formData);
}


function charge() {
	var xhr = new XMLHttpRequest();
	xhr.open('POST','/testPay');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 &&xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			if(res!=0){
				alert('충전완료');
				location.href='/';
			}else{
				alert('충전실패');
			}
		}
	}
	var pay = document.getElementById("payArea");
	var price = document.getElementById("priceArea");
	if(pay.value=="카드"){
		var IMP = window.IMP;
		IMP.init('imp92849282');
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '유저_시간충전',
		    amount : price.value,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '사용자',
		    buyer_tel : '010-1234-5678',
		    m_redirect_url : 'https://www.ezenplay.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	}
	else if(pay.value=="휴대폰"){

		var IMP = window.IMP;
		IMP.init('imp92849282');
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'phone',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '유저_시간충전',
		    amount : price.value,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '사용자',
		    buyer_tel : '010-1234-5678',
		    m_redirect_url : 'https://www.ezenplay.com/views/charge/complet'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	}
} 
</script>
<jsp:include page="/WEB-INF/views/home/maintempletfooter.jsp"></jsp:include><!-- footer형태-->
<jsp:include page="/WEB-INF/views/home/maintempletfooterjs.jsp"></jsp:include><!-- 템플릿전체움직임-->
</body>
</html>