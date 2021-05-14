<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<head>

<jsp:include page="/WEB-INF/views/home/maintemplethead.jsp"></jsp:include><!-- 상단바로고디자인 -->
<jsp:include page="/WEB-INF/views/home/maintempletbar.jsp"></jsp:include><!-- 상단바와 로고 -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

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
    </section><!-- End Breadcrumbs -->
    
<!-- ======= Contact Section ======= -->
<main>
    <section id="contact" class="contact">
      <div class="container">
        <div class="row">

<div class="container">
	<h2 class="text-center">리뷰리스트</h2>
	<input type="hidden" id="sessionid" value="${UserInfo.userId }">
	<div style="display:none;">
<jsp:include page="/WEB-INF/views/customercenter/reviewup.jsp"></jsp:include><!-- 리뷰등록 --></div>

	<div class="card">
	    <div class="card-body" id="cardlist">
				    </div>
				</div>
			</div>
			
        </div>
       </div>
      </section>
     </main>

</body>
<script><!-- 리뷰리스트바디 -->
var hiddennum = '';
window.onload = function(){
	
	   var delup =document.querySelector('#delup');
	   var uid = document.querySelector('#sessionid').value; //세션아이디와 등록자아이디 비교
	   alert(uid);
		var xhr = new XMLHttpRequest();
		xhr.open('GET', '/review/list');
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				
				var res = JSON.parse(xhr.responseText);
				for(var i = 0;i<=100;i++){
					

				var r = res[i]; 
				console.log(r);
			   	var html ='';
	         	for(r of res){
	            html += '<div class="card card-inner">';
	            html += ' <div class="card-body" style="margin-top:30px;">';
	            html += '   <div class="row">';
	            if(r.userInfo.profilePath == null){
	         	html += '		<img src="/resources/images/user/basic.png'+'"';
		 	    html += ' width="100" height ="100" style="border-radius: 50px;"/>';
	            }else{
	           	html += '		<img src="/resources/images/user/'+r.userInfo.profilePath +'"';
	           //	html += 'onerror="this.src='+'\' +/resources/images/user/basic.png+'+\';"';
	 	        html += ' width="100" height ="100" style="border-radius: 50px;"/>';
	            }
	            html += '            <div class="col-md-10">';
	                       html += '               <p class="text-secondary text-left" id="revStar" style="align:"bottom"">'
	            for(var j = 0;j<r.revStar;j++)
					{
						html+= '<i class="fa fa-star"></i>';
	            }
	            html += '</p>';
	            html += '                  <p><a href=""><strong id="userId">' 
	            html += r.userInfo.userId;
	            html += '</strong></a></p>';
	            html += '                         <div id="revComment" >';
	            html += r.revComment+'</div>';
	            html += '                              <br/><p id="delup" style="'
	            if(uid == r.userInfo.userId){
	            	
	               html += 'display:block;">'; //세션아이디 일치시 취소업데이트버튼보이기
	            }else{
	               html += 'display:none;">';
	            }
	           	html += ' <input type="hidden" id="hiddennum" value="'+r.revNum+'">';

	            html += '                        <a   onclick="javascript:ondelete('+r.revNum+');" class="float-right btn btn-outline-primary ml-2">  <i class="fa fa-reply"></i> 삭제하기</a> ';
	            html += '                        <a   onclick="javascript:onready('+r.revNum+','+r.revComment+','+r.revStar+');" class="float-right btn text-white btn-danger"> <i class="fa fa-heart"></i> 수정하기</a>';
	            html += ' </p></div></div></div></div>';
	            	 html += '<jsp:include page="'+'/WEB-INF/views/customercenter/reviewup.jsp'+'"></jsp:include>';
	            	 html += '<br/>';

	           

	         }
	         
			      document.querySelector('#cardlist').innerHTML=html;
			
				}
			}
		}
		xhr.send();
	}
var revNums = '';
var revComments = '';
var revStars = '';
function ondelete(revNums){ //앵커태그 펑션 매개변수로 revNum넘기기.
	var xhr = new XMLHttpRequest();
	//xhr.open('DELETE', '/review/delete');
	xhr.open('GET', '/review/delete?revNum='+revNums);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			alert(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			if(res!=0){
				alert('삭제성공');
				location.href = '/views/customercenter/reviewlist';
			}else{
				alert('삭제실패');
			}
		}
		
	}
	xhr.send(revNums);
}





function onready(revNums,revComments,revStars){ //팝업으로 가기
	var openChild;
	openChild = window.open("<c:url value='/views/customercenter/reviewupdate.do?revNums="+revNums+"'/>", 'child', 'width=400, height=600, left=400, top=400, resizable = yes')

	
}

</script>
<jsp:include page="/WEB-INF/views/home/maintempletfooter.jsp"></jsp:include><!-- footer형태-->
<jsp:include page="/WEB-INF/views/home/maintempletfooterjs.jsp"></jsp:include><!-- 템플릿전체움직임-->
</html>